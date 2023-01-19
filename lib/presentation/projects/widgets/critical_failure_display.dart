import 'package:flutter/material.dart';
import 'package:task_manager/domain/projects/project_failure.dart';

class CriticalFailureDisplay extends StatelessWidget {
  final ProjectFailure failure;
  const CriticalFailureDisplay({Key? key,required this.failure }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(

      child: Column(mainAxisSize:MainAxisSize.min,children:[
        Text("😱",style: TextStyle(fontSize:100),),
        Text(failure.maybeMap(insufficientPermission:(_)=>"Insufficient permissions",orElse: ()=>"Unexpected error. \nPlease, contact support"),style:TextStyle(fontSize:24),textAlign:TextAlign.center),
        TextButton(onPressed:(){},child:Row(mainAxisSize:MainAxisSize.min,children:[
          Icon(Icons.mail),
          const SizedBox(height:4),
          Text("I need help")
        ]))
      ]),

    );
  }
}
