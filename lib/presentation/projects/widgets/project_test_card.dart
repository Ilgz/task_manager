import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:task_manager/domain/projects/project.dart';
class ProjectTestCard extends HookWidget {
  const ProjectTestCard({Key? key,required this.project}):super(key:key);
  final Project project;
  @override
  Widget build(BuildContext context) {
    final isEditing = useState(false);
    return Card(child: Text(project.projectName.getOrCrash()),);
  }

}

