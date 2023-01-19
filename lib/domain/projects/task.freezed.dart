// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Task {
  TaskName get taskName => throw _privateConstructorUsedError;
  bool get isDone => throw _privateConstructorUsedError;
  TaskResponsibleUser get responsibleUser => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TaskCopyWith<Task> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) then) =
      _$TaskCopyWithImpl<$Res, Task>;
  @useResult
  $Res call(
      {TaskName taskName, bool isDone, TaskResponsibleUser responsibleUser});
}

/// @nodoc
class _$TaskCopyWithImpl<$Res, $Val extends Task>
    implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskName = null,
    Object? isDone = null,
    Object? responsibleUser = null,
  }) {
    return _then(_value.copyWith(
      taskName: null == taskName
          ? _value.taskName
          : taskName // ignore: cast_nullable_to_non_nullable
              as TaskName,
      isDone: null == isDone
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
      responsibleUser: null == responsibleUser
          ? _value.responsibleUser
          : responsibleUser // ignore: cast_nullable_to_non_nullable
              as TaskResponsibleUser,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TaskCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$$_TaskCopyWith(_$_Task value, $Res Function(_$_Task) then) =
      __$$_TaskCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TaskName taskName, bool isDone, TaskResponsibleUser responsibleUser});
}

/// @nodoc
class __$$_TaskCopyWithImpl<$Res> extends _$TaskCopyWithImpl<$Res, _$_Task>
    implements _$$_TaskCopyWith<$Res> {
  __$$_TaskCopyWithImpl(_$_Task _value, $Res Function(_$_Task) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskName = null,
    Object? isDone = null,
    Object? responsibleUser = null,
  }) {
    return _then(_$_Task(
      null == taskName
          ? _value.taskName
          : taskName // ignore: cast_nullable_to_non_nullable
              as TaskName,
      null == isDone
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
      null == responsibleUser
          ? _value.responsibleUser
          : responsibleUser // ignore: cast_nullable_to_non_nullable
              as TaskResponsibleUser,
    ));
  }
}

/// @nodoc

class _$_Task implements _Task {
  _$_Task(this.taskName, this.isDone, this.responsibleUser);

  @override
  final TaskName taskName;
  @override
  final bool isDone;
  @override
  final TaskResponsibleUser responsibleUser;

  @override
  String toString() {
    return 'Task(taskName: $taskName, isDone: $isDone, responsibleUser: $responsibleUser)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Task &&
            (identical(other.taskName, taskName) ||
                other.taskName == taskName) &&
            (identical(other.isDone, isDone) || other.isDone == isDone) &&
            (identical(other.responsibleUser, responsibleUser) ||
                other.responsibleUser == responsibleUser));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, taskName, isDone, responsibleUser);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TaskCopyWith<_$_Task> get copyWith =>
      __$$_TaskCopyWithImpl<_$_Task>(this, _$identity);
}

abstract class _Task implements Task {
  factory _Task(final TaskName taskName, final bool isDone,
      final TaskResponsibleUser responsibleUser) = _$_Task;

  @override
  TaskName get taskName;
  @override
  bool get isDone;
  @override
  TaskResponsibleUser get responsibleUser;
  @override
  @JsonKey(ignore: true)
  _$$_TaskCopyWith<_$_Task> get copyWith => throw _privateConstructorUsedError;
}
