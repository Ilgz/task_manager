import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/application/projects/project_form/project_form_bloc.dart';
import 'package:task_manager/injection.dart';
import 'package:task_manager/presentation/core/widgets/failure_snackbar.dart';

class AddProjectDialog extends StatelessWidget {
  const AddProjectDialog({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => getIt<ProjectFormBloc>(),
  child: BlocConsumer<ProjectFormBloc, ProjectFormState>(
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
          context.read<ProjectFormBloc>().add(ProjectFormEvent.saveProject());
        }, child: state.isProcessing?const SizedBox(height:20,width:20,child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.white),)):const Text("Create")),
        const SizedBox(height: 15,),
      ],),
    );
  },
),
);
  }
}
