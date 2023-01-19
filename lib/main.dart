import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:task_manager/firebase_options.dart';
import 'package:task_manager/injection.dart';
import 'package:task_manager/presentation/core/app_widget.dart';

// import 'package:training_center/domain/auth/auth_failure.dart';
// import 'package:training_center/domain/auth/value_objects.dart';
// import 'package:training_center/firebase_options.dart';
// import 'package:training_center/injection.dart';
// import 'package:training_center/presentation/core/app_widget.dart';

void main() async {
  configureInjection(Environment.prod);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const AppWidget());
  // FirebaseFirestore.instance.collection("tasks").where("members",
  //     arrayContains: "users/${FirebaseAuth.instance.currentUser!.uid}").snapshots().listen((event) {
  //   print("listening");
  //   print(event.size);
  //   event.docs.forEach((element) {
  //     print(element.data().toString());
  //   });
  // });
}
