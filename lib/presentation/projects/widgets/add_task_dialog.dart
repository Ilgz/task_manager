import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/application/projects/tasks/task_form/task_form_bloc.dart';
import 'package:task_manager/injection.dart';
import 'package:task_manager/presentation/core/widgets/failure_snackbar.dart';

class AddTaskDialog extends StatelessWidget {
  const AddTaskDialog({Key? key,required this.documentReference}) : super(key: key);
  final DocumentReference documentReference;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<TaskFormBloc>(),
      child: BlocConsumer<TaskFormBloc, TaskFormState>(
        listenWhen: (p, c) =>
        p.projectFailureSuccessOption != c.projectFailureSuccessOption,
        listener: (context, state) {
          state.projectFailureSuccessOption.fold(() {}, (either) {
            either.fold((failure) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(FailureSnackBar(failure: failure));
            }, (_) {
              Navigator.pop(context);
            });
          });
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Column(mainAxisSize:MainAxisSize.min,mainAxisAlignment:MainAxisAlignment.center,children: [
              SizedBox(
                width: double.infinity,
                child: TextFormField(
                    autovalidateMode:
                    state.showErrorMessages,
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
                    autofocus: true,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(
                          30),
                    ],
                    decoration: const InputDecoration(
                        isDense: true,
                        border: UnderlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 20)),
                    style: Theme.of(context).textTheme.bodyText1
                ),
              ),
              const SizedBox(height: 20,),
              ElevatedButton(style:Theme.of(context).elevatedButtonTheme.style,onPressed: state.isProcessing?null:(){
                context.read<TaskFormBloc>().add(TaskFormEvent.saveTask(documentReference,context.read<TaskFormBloc>().state.task));
              }, child: state.isProcessing?const SizedBox(height:20,width:20,child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.white),)):const Text("Create")),
              const SizedBox(height: 15,),
            ],),
          );
        },
      ),
    );
  }
}
