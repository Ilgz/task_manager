import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/application/projects/project_actor/project_actor_cubit.dart';
import 'package:task_manager/application/projects/project_form/project_form_bloc.dart';
import 'package:task_manager/domain/projects/project.dart';
import 'package:task_manager/injection.dart';
import 'package:task_manager/presentation/core/routes/router.dart';
import 'package:task_manager/presentation/core/widgets/failure_snackbar.dart';
import 'package:task_manager/presentation/projects/widgets/linear_percent_indicator.dart';
import 'package:task_manager/presentation/projects/widgets/saving_overlay_widget.dart';
import 'package:task_manager/presentation/users/users_overview/widgets/user_icon.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({Key? key, required this.project}) : super(key: key);
  final Project project;
  @override
  Widget build(BuildContext context) {
    final int doneTasks = project.tasks.where((task) => task.isDone).length;
    return BlocProvider(
      create: (context) => getIt<ProjectFormBloc>(),
      child: Builder(builder: (context) {
        context
            .read<ProjectFormBloc>()
            .add(ProjectFormEvent.initialized(some(project)));
        return BlocConsumer<ProjectFormBloc, ProjectFormState>(
          listenWhen: (p, c) =>
              p.projectFailureSuccessOption != c.projectFailureSuccessOption,
          listener: (context, state) {
            state.projectFailureSuccessOption.fold(() {}, (either) {
              either.fold((failure) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(FailureSnackBar(failure: failure));
              }, (_) {
                context
                    .read<ProjectFormBloc>()
                    .add(ProjectFormEvent.changeEditingState(false));
              });
            });
          },
          buildWhen: (p, c) => p.isProcessing != c.isProcessing,
          builder: (context, state) {
            return Stack(
              children: [
                ProjectCardForm(project: project, doneTasks: doneTasks),
                SavingInProgressOverlay(
                  isSaving: state.isProcessing,
                  height: MediaQuery.of(context).size.height,
                )
              ],
            );
          },
        );
      }),
    );
  }
}

class ProjectCardForm extends StatelessWidget {
  const ProjectCardForm({
    Key? key,
    required this.project,
    required this.doneTasks,
  }) : super(key: key);

  final Project project;
  final int doneTasks;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProjectActorCubit>(),
      child: BlocListener<ProjectActorCubit, ProjectActorState>(
        listener: (context, state) {
          state.maybeMap(
              quitProjectFailure: (state) {
                ScaffoldMessenger.of(context).showSnackBar(
                    FailureSnackBar(failure: state.failureException));
              },
              changePublicityStatusFailure: (state) {
                ScaffoldMessenger.of(context).showSnackBar(
                    FailureSnackBar(failure: state.failureException));
              },
              deleteProjectFailure: (state) {
                ScaffoldMessenger.of(context).showSnackBar(
                    FailureSnackBar(failure: state.failureException));
              },
              orElse: () {});
        },
        child: BlocBuilder<ProjectFormBloc, ProjectFormState>(
          builder: (context, state) {
            return Card(
              elevation: 6,
              child: InkWell(
                onTap: () {
                  if (!state.isEditing) {
                    goToTasksOverviewPage(context, project);
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          UserIcon((project.owner.userName.getOrCrash())),
                          const Expanded(child: SizedBox()),
                          project.canBeModifiedAndIsAdmin.fold(
                            () => const SizedBox(),
                            (isAdmin) => isAdmin
                                ? PopupMenuButton<int>(
                                    enabled: !state.isEditing,
                                    icon: const Icon(Icons.more_horiz_outlined),
                                    onSelected: (index) {
                                      if (index == 0) {
                                        context
                                            .read<ProjectActorCubit>()
                                            .changePublicityStatus(project);
                                      } else if (index == 1) {
                                        context.read<ProjectFormBloc>().add(
                                            ProjectFormEvent.changeEditingState(
                                                true));
                                      } else if (index == 2) {
                                        context
                                            .read<ProjectActorCubit>()
                                            .deleteProject(project);
                                      }
                                    },
                                    itemBuilder: (context) => [
                                      PopupMenuItem(
                                        value: 0,
                                        child: Text(project.isPublic
                                            ? "Сделать закрытым"
                                            : "Сделать публичным"),
                                      ),
                                      const PopupMenuItem(
                                        value: 1,
                                        child: Text("Редактировать"),
                                      ),
                                      const PopupMenuItem(
                                        value: 2,
                                        child: Text(
                                          "Удалить",
                                        ),
                                      ),
                                    ],
                                    offset: const Offset(0, 0),
                                    elevation: 8,
                                  )
                                : PopupMenuButton<int>(
                                    //enabled:widget.isMember?true:false,
                                    icon: const Icon(Icons.more_horiz_outlined),
                                    onSelected: (value) {
                                      if (value == 1) {
                                        context
                                            .read<ProjectActorCubit>()
                                            .quitProject(project);
                                      }
                                    },
                                    itemBuilder: (context) => [
                                      const PopupMenuItem(
                                        value: 1,
                                        child: Text("Покинуть проект"),
                                      ),
                                      // popupmenu item 2
                                    ],
                                    offset: const Offset(0, 0),
                                    elevation: 8,
                                  ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      SizedBox(
                        height: 70,
                        child: state.isEditing
                            ? Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: IntrinsicWidth(
                                      child: TextFormField(
                                          autovalidateMode:
                                              state.showErrorMessages,
                                          onChanged: (value) => context
                                              .read<ProjectFormBloc>()
                                              .add(ProjectFormEvent.projectBodyChanged(
                                                  value)),
                                          validator: (_) => context
                                              .read<ProjectFormBloc>()
                                              .state
                                              .project
                                              .projectName
                                              .value
                                              .fold(
                                                  (f) => f.maybeMap(
                                                      empty: (value) =>
                                                          "Empty value",
                                                      exceedingLength: (value) =>
                                                          'Exceeding length 30 symbols',
                                                      orElse: () => null),
                                                  (r) => null),
                                          initialValue: project.projectName
                                              .isNewOrFailureStr(project.isNew),
                                          autofocus: true,
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(
                                                30),
                                          ],
                                          decoration: const InputDecoration(
                                              isDense: true,
                                              border: UnderlineInputBorder(),
                                              contentPadding: EdgeInsets.symmetric(vertical: 5)),
                                          //controller: textController,
                                          style: Theme.of(context).textTheme.bodyText1
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      context.read<ProjectFormBloc>().add(
                                          ProjectFormEvent.changeEditingState(
                                              false));
                                    },
                                    child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 6),
                                        child: const Icon(
                                          Icons.close,
                                          color: Colors.red,
                                        )),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      context
                                          .read<ProjectFormBloc>()
                                          .add(ProjectFormEvent.saveProject());
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 6),
                                      child: const Icon(
                                        Icons.done,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : Text(
                                project.projectName
                                    .isNewOrFailureStr(project.isNew),
                            style: Theme.of(context).textTheme.titleLarge
                        ),
                      ),
                      const Spacer(),
                      Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 13, vertical: 3),
                          decoration: BoxDecoration(
                            color: project.isPublic ? Colors.green : Colors.red,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(project.isPublic ? "Public" : "Private",
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ))),
                      const Divider(
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5, bottom: 10),
                        height: 20,
                        child: Row(
                          children: [
                            Icon(
                              Icons.task_outlined,
                              color: Theme.of(context).iconTheme.color,
                              size: 20,
                            ),
                            Text(
                              "$doneTasks/${project.tasks.length}",
                              style: Theme.of(context).textTheme.bodyText1
                            ),
                            Expanded(
                              child: SizedBox(
                                height: 20,
                                child: LinearPercentIndicator(
                                  lineHeight: 4.0,
                                  barRadius: const Radius.circular(3),
                                  percent: (doneTasks / project.tasks.length),
                                  backgroundColor: Colors.grey,
                                  progressColor: Colors.yellow,
                                ),
                              ),
                            ),
                            Text(
                                "${project.tasks.isNotEmpty ? ((doneTasks / project.tasks.length) * 100).round() : 0} %",
                                style: Theme.of(context).textTheme.bodyText1
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
