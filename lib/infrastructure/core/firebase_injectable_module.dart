import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:injectable/injectable.dart';
import 'package:task_manager/firebase_options.dart';
@module
abstract class FirebaseInjectableModule{
  @lazySingleton
  FirebaseAuth get firebaseAuth=>FirebaseAuth.instance;
  @lazySingleton
  FirebaseFirestore get firebaseFirestore=>FirebaseFirestore.instance;
}