import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_failure.freezed.dart';
@freezed
abstract class ProjectFailure with _$ProjectFailure{
  const factory ProjectFailure.unexpected()=_Unexpected;
  const factory ProjectFailure.insufficientPermission()=_InsufficientPermission;
  const factory ProjectFailure.unableToUpdate()=_UnableToUpdate;
}