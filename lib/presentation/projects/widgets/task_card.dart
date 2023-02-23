import 'package:dartz/dartz.dart' hide Task;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/application/projects/tasks/task_actor/task_actor_cubit.dart';
import 'package:task_manager/application/projects/tasks/task_form/task_form_bloc.dart';
import 'package:task_manager/domain/core/errors.dart';
import 'package:task_manager/domain/projects/project.dart';
import 'package:task_manager/domain/projects/task.dart';
import 'package:task_manager/injection.dart';
import 'package:task_manager/presentation/core/widgets/failure_snackbar.dart';
import 'package:task_manager/presentation/projects/widgets/saving_overlay_widget.dart';
import 'package:task_manager/presentation/users/users_overview/widgets/user_card.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({Key? key, required this.initialTask, required this.project})
      : super(key: key);
  final Task initialTask;
  final Project project;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<TaskFormBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<TaskActorCubit>(),
        ),
      ],
      child: Builder(builder: (context) {
        context
            .read<TaskFormBloc>()
            .add(TaskFormEvent.initialized(some(initialTask)));
        return BlocConsumer<TaskFormBloc, TaskFormState>(
          listenWhen: (p, c) =>
              p.projectFailureSuccessOption != c.projectFailureSuccessOption,
          listener: (context, state) {
            state.projectFailureSuccessOption.fold(() {
            }, (either) {
              either.fold((failure) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(failure.map(
                        unexpected: (_) => "Unexpected error while deleting...",
                        insufficientPermission: (_) =>
                            "Insufficient permissions 👩",
                        unableToUpdate: (_) => "Impossible Error"))));
              }, (_) {
                context
                    .read<TaskFormBloc>()
                    .add(TaskFormEvent.changeEditingState(false));
              });
            });
          },
          builder: (context, state) {
            return Stack(
              children: [
                TaskCardForm(
                  initialTask: initialTask,
                  project: project,
                ),
                SavingInProgressOverlay(
                  isSaving: state.isProcessing,
                  height: 70,
                ),
              ],
            );
          },
        );
      }),
    );
  }
}

class TaskCardForm extends StatelessWidget {
  const TaskCardForm(
      {Key? key, required this.initialTask, required this.project})
      : super(key: key);
  final Task initialTask;
  final Project project;

  @override
  Widget build(BuildContext context) {
    return BlocListener<TaskActorCubit, TaskActorState>(
        listener: (context, state) {
      state.maybeMap(
          changeDoneStatusFailure: (state) {
            ScaffoldMessenger.of(context)
                .showSnackBar(FailureSnackBar(failure: state.failureException));
          },
          deleteTaskFailure: (state) {
            ScaffoldMessenger.of(context)
                .showSnackBar(FailureSnackBar(failure: state.failureException));
          },
          orElse: () {});
    }, child: BlocBuilder<TaskFormBloc, TaskFormState>(
      builder: (context, state) {
        return Card(
          margin: const EdgeInsets.only(top: 5),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                ),
                child: const Icon(Icons.assignment, color: Colors.white),
              ),
              const SizedBox(
                width: 10,
              ),
              if (state.isEditing) ...[
                IntrinsicWidth(
                  child: TextFormField(
                    autovalidateMode: state.showErrorMessages,
                    onChanged: (value) => context
                        .read<TaskFormBloc>()
                        .add(TaskFormEvent.taskBodyChanged(value)),
                    validator: (_) => context
                        .read<TaskFormBloc>()
                        .state
                        .task
                        .taskName
                        .value
                        .fold(
                            (f) => f.maybeMap(
                                empty: (value) => "Empty value",
                                exceedingLength: (value) =>
                                    'Exceeding length 30 symbols',
                                orElse: () => null),
                            (r) => null),
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(30),
                    ],
                    decoration: const InputDecoration(
                        isDense: true,
                        border: UnderlineInputBorder(),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5)),
                    initialValue:
                        initialTask.taskName.isNewOrFailureStr(initialTask.isNew),
                    autofocus: true,
                                             style: Theme.of(context).textTheme.bodyText1
        ,
                  ),
                )
              ] else ...[
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      initialTask.taskName.isNewOrFailureStr(initialTask.isNew),
                        style: Theme.of(context).textTheme.bodyText1
                    ),
                    Builder(builder: (context) {
                      if (state.task.assignee.isSome()) {
                        final assignee = project.members.firstWhere((member) =>
                            member.reference ==
                            state.task.assignee
                                .getOrElse(() => throw UnexpectedProjectError));
                        return Text(
                          assignee.userName.getOrCrash(),
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        );
                      }
                      return const SizedBox();
                    })
                  ],
                ),
              ],
              Expanded(child: Container()),
              if (state.isEditing) ...[
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                            context
                                .read<TaskFormBloc>()
                                .add(TaskFormEvent.changeEditingState(false));
                        },
                        icon: const Icon(
                          Icons.close,
                          color: Colors.red,
                        )),
                    IconButton(
                        onPressed: () {
                         context.read<TaskFormBloc>().add(TaskFormEvent.saveTask(
                              project.reference, initialTask));
                        },
                        icon: const Icon(
                          Icons.done,
                          color: Colors.green,
                        )),
                  ],
                )
              ] else ...[
                Row(
                  children: [
                    Checkbox(
                        value: state.task.isDone,
                        onChanged: state.task.canChangeDoneStatus
                            ? (_) {
                                context.read<TaskActorCubit>().changeDoneStatus(
                                    state.task, project.reference);
                              }
                            : null),
                    PopupMenuButton<int>(
                      enabled: state.task.canBeModifiedAndIsAdmin
                          .getOrElse(() => false),
                      onSelected: (index) {
                        if (index == 0) {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Участники",
                                      style: Theme.of(context).textTheme.titleLarge
                                    ),
                                    Expanded(
                                      child: ListView.builder(
                                          itemCount: project.members.length,
                                          itemBuilder: (context, index) {
                                            final user = project.members[index];
                                            return UserCard(
                                                user: user,
                                                projectAndOptionTask:
                                                    Tuple2(project, state.task));
                                          }),
                                    )
                                  ],
                                );
                              });
                        }
                        if (index == 1) {
                          context
                              .read<TaskFormBloc>()
                              .add(TaskFormEvent.changeEditingState(true));
                        } else if (index == 2) {
                          context
                              .read<TaskActorCubit>()
                              .deleteTask(initialTask, project.reference);
                        }
                      },
                      itemBuilder: (context) => [
                        const PopupMenuItem(
                          value: 0,
                          child: Text("Закрепить"),
                        ),
                        const PopupMenuItem(
                          value: 1,
                          child: Text("Редактировать"),
                        ),
                        // popupmenu item 2
                        const PopupMenuItem(
                          value: 2,
                          // row has two child icon and text
                          child: Text(
                            "Удалить",
                          ),
                        ),
                      ],
                      offset: const Offset(0, 0),
                      elevation: 8,
                    ),
                  ],
                )
              ]
            ]),
          ),
        );
      },
    ));
  }
}
