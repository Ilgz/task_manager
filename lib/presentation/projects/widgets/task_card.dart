import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart' hide Task;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/application/projects/project_actor/project_actor_bloc.dart';
import 'package:task_manager/application/projects/project_creator/project_creator_bloc.dart';
import 'package:task_manager/application/projects/tasks/task_form/task_form_bloc.dart';
import 'package:task_manager/domain/projects/task.dart';
import 'package:task_manager/injection.dart';
import 'package:task_manager/presentation/core/constants.dart';
import 'package:task_manager/presentation/core/styles.dart';
import 'package:task_manager/presentation/projects/widgets/saving_overlay_widget.dart';

class TaskCard extends StatelessWidget {
  const TaskCard(
      {Key? key, required this.initialTask, required this.documentReference})
      : super(key: key);
  final Task initialTask;
  final DocumentReference documentReference;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<TaskFormBloc>()
        ..add(TaskFormEvent.initialized(some(initialTask))),
      child: BlocConsumer<TaskFormBloc, TaskFormState>(
        listenWhen: (p, c) =>
            p.projectFailureSuccessOption != c.projectFailureSuccessOption,
        listener: (context, state) {
          state.projectFailureSuccessOption.fold(() {}, (either) {
            either.fold((failure) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(failure.map(
                      unexpected: (_) => "Unexpected error while deleting...",
                      insufficientPermission: (_) =>
                          "Insufficient permissions 👩",
                      unableToUpdate: (_) => "Impossible Error"))));
            }, (_) {
              if (state.task.isNew) {
                context
                    .read<ProjectCreatorBloc>()
                    .add(ProjectCreatorEvent.cancelTaskForm());
              }
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
                documentReference: documentReference,
              ),
              SavingInProgressOverlay(
                isSaving: state.isProcessing,
                height: 70,
              ),
            ],
          );
        },
      ),
    );
  }
}

class TaskCardForm extends StatelessWidget {
  const TaskCardForm(
      {Key? key, required this.initialTask, required this.documentReference})
      : super(key: key);
  final Task initialTask;
  final DocumentReference documentReference;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskFormBloc, TaskFormState>(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.only(top: 5),
          height: 70,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(children: [
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: AppConstants.primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: Icon(Icons.assignment, color: Colors.white),
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
                      .add(TaskFormEvent.taskBodyChanged(
                      value)),
                  validator: (_) => context
                      .read<TaskFormBloc>()
                      .state
                      .task
                      .taskName
                      .value
                      .fold(
                          (f) => f.maybeMap(
                          empty: (value) =>
                          "Empty value",
                          exceedingLength: (value) =>
                          'Exceeding length 30 symbols',
                          orElse: () => null),
                          (r) => null),
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(30),
                  ],
                  decoration: InputDecoration(
                      isDense: true,
                      border: UnderlineInputBorder(),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5)),
                  initialValue:
                      initialTask.taskName.isNewOrFailureStr(initialTask.isNew),
                  autofocus: true,
                  style: Styles.bodyStyle(context),
                ),
              )
            ] else ...[
              Text(
                initialTask.taskName.isNewOrFailureStr(initialTask.isNew),
                style: Styles.bodyStyle(context),
              ),
            ],
            Expanded(child: Container()),
            if (state.isEditing) ...[
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        if (initialTask.isNew) {
                          context
                              .read<ProjectCreatorBloc>()
                              .add(ProjectCreatorEvent.cancelTaskForm());
                        } else {
                          context
                              .read<TaskFormBloc>()
                              .add(TaskFormEvent.changeEditingState(false));
                        }
                      },
                      icon: Icon(
                        Icons.close,
                        color: Colors.red,
                      )),
                  IconButton(
                      onPressed: () {
                        context
                            .read<TaskFormBloc>()
                            .add(TaskFormEvent.saveTask(documentReference,initialTask));
                      },
                      icon: Icon(
                        Icons.done,
                        color: Colors.green,
                      )),
                ],
              )
            ] else ...[
              Row(
                children: [
                  Visibility(
                    visible: state.task.canBeModifiedAndIsAdmin.isSome(),
                    child: Checkbox(
                        value: state.task.isDone, onChanged: (value) {}),
                  ),
                  Visibility(
                    visible: state.task.canBeModifiedAndIsAdmin
                        .getOrElse(() => false),
                    child: PopupMenuButton<int>(
                      onSelected: (index) {
                        if (index == 1) {
                          context
                              .read<TaskFormBloc>()
                              .add(TaskFormEvent.changeEditingState(true));
                        } else if (index == 2) {
                          context.read<ProjectActorBloc>().add(ProjectActorEvent.deleteTask(initialTask, documentReference));
                        }
                      },
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          value: 0,
                          child: Text("Закрепить"),
                        ),
                        PopupMenuItem(
                          value: 1,
                          child: Text("Редактировать"),
                        ),
                        // popupmenu item 2
                        PopupMenuItem(
                          value: 2,
                          // row has two child icon and text
                          child: Text(
                            "Удалить",
                          ),
                        ),
                      ],
                      offset: Offset(0, 0),
                      color: Colors.white,
                      elevation: 8,
                    ),
                  ),
                ],
              )
            ]
          ]),
        );
      },
    );
  }
}
