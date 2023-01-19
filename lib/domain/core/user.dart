import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_manager/domain/core/value_objects.dart';
part 'user.freezed.dart';
@freezed
abstract class User with _$User{
  factory User({
   required String id,required String name,required DocumentReference documentReference
})=_User;
}