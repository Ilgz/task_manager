import 'package:flutter/material.dart';
import 'package:task_manager/domain/projects/project_failure.dart';

class ProjectCriticalFailureDisplay extends StatelessWidget {
  final FirebaseFirestoreFailure failure;
  const ProjectCriticalFailureDisplay({Key? key,required this.failure }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisSize:MainAxisSize.min,children:[
        const Text("😱",style: TextStyle(fontSize:100),),
        Text(failure.maybeMap(insufficientPermission:(_)=>"Insufficient permissions",orElse: ()=>"Unexpected error. \nPlease, contact support"),style:const TextStyle(fontSize:24),textAlign:TextAlign.center),
        TextButton(onPressed:(){},child:Row(mainAxisSize:MainAxisSize.min,children:const [
          Icon(Icons.mail),
          SizedBox(height:4),
          Text("I need help")
        ]))
      ]),

    );
  }
}
