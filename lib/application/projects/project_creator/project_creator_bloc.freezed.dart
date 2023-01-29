// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_creator_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProjectCreatorEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() startProjectForm,
    required TResult Function() cancelProjectForm,
    required TResult Function() startTaskForm,
    required TResult Function() cancelTaskForm,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? startProjectForm,
    TResult? Function()? cancelProjectForm,
    TResult? Function()? startTaskForm,
    TResult? Function()? cancelTaskForm,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? startProjectForm,
    TResult Function()? cancelProjectForm,
    TResult Function()? startTaskForm,
    TResult Function()? cancelTaskForm,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StartProjectForm value) startProjectForm,
    required TResult Function(_CancelProjectForm value) cancelProjectForm,
    required TResult Function(_StartTaskForm value) startTaskForm,
    required TResult Function(_CancelTaskForm value) cancelTaskForm,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartProjectForm value)? startProjectForm,
    TResult? Function(_CancelProjectForm value)? cancelProjectForm,
    TResult? Function(_StartTaskForm value)? startTaskForm,
    TResult? Function(_CancelTaskForm value)? cancelTaskForm,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartProjectForm value)? startProjectForm,
    TResult Function(_CancelProjectForm value)? cancelProjectForm,
    TResult Function(_StartTaskForm value)? startTaskForm,
    TResult Function(_CancelTaskForm value)? cancelTaskForm,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectCreatorEventCopyWith<$Res> {
  factory $ProjectCreatorEventCopyWith(
          ProjectCreatorEvent value, $Res Function(ProjectCreatorEvent) then) =
      _$ProjectCreatorEventCopyWithImpl<$Res, ProjectCreatorEvent>;
}

/// @nodoc
class _$ProjectCreatorEventCopyWithImpl<$Res, $Val extends ProjectCreatorEvent>
    implements $ProjectCreatorEventCopyWith<$Res> {
  _$ProjectCreatorEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_StartProjectFormCopyWith<$Res> {
  factory _$$_StartProjectFormCopyWith(
          _$_StartProjectForm value, $Res Function(_$_StartProjectForm) then) =
      __$$_StartProjectFormCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_StartProjectFormCopyWithImpl<$Res>
    extends _$ProjectCreatorEventCopyWithImpl<$Res, _$_StartProjectForm>
    implements _$$_StartProjectFormCopyWith<$Res> {
  __$$_StartProjectFormCopyWithImpl(
      _$_StartProjectForm _value, $Res Function(_$_StartProjectForm) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_StartProjectForm implements _StartProjectForm {
  _$_StartProjectForm();

  @override
  String toString() {
    return 'ProjectCreatorEvent.startProjectForm()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_StartProjectForm);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() startProjectForm,
    required TResult Function() cancelProjectForm,
    required TResult Function() startTaskForm,
    required TResult Function() cancelTaskForm,
  }) {
    return startProjectForm();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? startProjectForm,
    TResult? Function()? cancelProjectForm,
    TResult? Function()? startTaskForm,
    TResult? Function()? cancelTaskForm,
  }) {
    return startProjectForm?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? startProjectForm,
    TResult Function()? cancelProjectForm,
    TResult Function()? startTaskForm,
    TResult Function()? cancelTaskForm,
    required TResult orElse(),
  }) {
    if (startProjectForm != null) {
      return startProjectForm();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StartProjectForm value) startProjectForm,
    required TResult Function(_CancelProjectForm value) cancelProjectForm,
    required TResult Function(_StartTaskForm value) startTaskForm,
    required TResult Function(_CancelTaskForm value) cancelTaskForm,
  }) {
    return startProjectForm(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartProjectForm value)? startProjectForm,
    TResult? Function(_CancelProjectForm value)? cancelProjectForm,
    TResult? Function(_StartTaskForm value)? startTaskForm,
    TResult? Function(_CancelTaskForm value)? cancelTaskForm,
  }) {
    return startProjectForm?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartProjectForm value)? startProjectForm,
    TResult Function(_CancelProjectForm value)? cancelProjectForm,
    TResult Function(_StartTaskForm value)? startTaskForm,
    TResult Function(_CancelTaskForm value)? cancelTaskForm,
    required TResult orElse(),
  }) {
    if (startProjectForm != null) {
      return startProjectForm(this);
    }
    return orElse();
  }
}

abstract class _StartProjectForm implements ProjectCreatorEvent {
  factory _StartProjectForm() = _$_StartProjectForm;
}

/// @nodoc
abstract class _$$_CancelProjectFormCopyWith<$Res> {
  factory _$$_CancelProjectFormCopyWith(_$_CancelProjectForm value,
          $Res Function(_$_CancelProjectForm) then) =
      __$$_CancelProjectFormCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_CancelProjectFormCopyWithImpl<$Res>
    extends _$ProjectCreatorEventCopyWithImpl<$Res, _$_CancelProjectForm>
    implements _$$_CancelProjectFormCopyWith<$Res> {
  __$$_CancelProjectFormCopyWithImpl(
      _$_CancelProjectForm _value, $Res Function(_$_CancelProjectForm) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_CancelProjectForm implements _CancelProjectForm {
  _$_CancelProjectForm();

  @override
  String toString() {
    return 'ProjectCreatorEvent.cancelProjectForm()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_CancelProjectForm);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() startProjectForm,
    required TResult Function() cancelProjectForm,
    required TResult Function() startTaskForm,
    required TResult Function() cancelTaskForm,
  }) {
    return cancelProjectForm();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? startProjectForm,
    TResult? Function()? cancelProjectForm,
    TResult? Function()? startTaskForm,
    TResult? Function()? cancelTaskForm,
  }) {
    return cancelProjectForm?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? startProjectForm,
    TResult Function()? cancelProjectForm,
    TResult Function()? startTaskForm,
    TResult Function()? cancelTaskForm,
    required TResult orElse(),
  }) {
    if (cancelProjectForm != null) {
      return cancelProjectForm();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StartProjectForm value) startProjectForm,
    required TResult Function(_CancelProjectForm value) cancelProjectForm,
    required TResult Function(_StartTaskForm value) startTaskForm,
    required TResult Function(_CancelTaskForm value) cancelTaskForm,
  }) {
    return cancelProjectForm(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartProjectForm value)? startProjectForm,
    TResult? Function(_CancelProjectForm value)? cancelProjectForm,
    TResult? Function(_StartTaskForm value)? startTaskForm,
    TResult? Function(_CancelTaskForm value)? cancelTaskForm,
  }) {
    return cancelProjectForm?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartProjectForm value)? startProjectForm,
    TResult Function(_CancelProjectForm value)? cancelProjectForm,
    TResult Function(_StartTaskForm value)? startTaskForm,
    TResult Function(_CancelTaskForm value)? cancelTaskForm,
    required TResult orElse(),
  }) {
    if (cancelProjectForm != null) {
      return cancelProjectForm(this);
    }
    return orElse();
  }
}

abstract class _CancelProjectForm implements ProjectCreatorEvent {
  factory _CancelProjectForm() = _$_CancelProjectForm;
}

/// @nodoc
abstract class _$$_StartTaskFormCopyWith<$Res> {
  factory _$$_StartTaskFormCopyWith(
          _$_StartTaskForm value, $Res Function(_$_StartTaskForm) then) =
      __$$_StartTaskFormCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_StartTaskFormCopyWithImpl<$Res>
    extends _$ProjectCreatorEventCopyWithImpl<$Res, _$_StartTaskForm>
    implements _$$_StartTaskFormCopyWith<$Res> {
  __$$_StartTaskFormCopyWithImpl(
      _$_StartTaskForm _value, $Res Function(_$_StartTaskForm) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_StartTaskForm implements _StartTaskForm {
  _$_StartTaskForm();

  @override
  String toString() {
    return 'ProjectCreatorEvent.startTaskForm()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_StartTaskForm);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() startProjectForm,
    required TResult Function() cancelProjectForm,
    required TResult Function() startTaskForm,
    required TResult Function() cancelTaskForm,
  }) {
    return startTaskForm();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? startProjectForm,
    TResult? Function()? cancelProjectForm,
    TResult? Function()? startTaskForm,
    TResult? Function()? cancelTaskForm,
  }) {
    return startTaskForm?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? startProjectForm,
    TResult Function()? cancelProjectForm,
    TResult Function()? startTaskForm,
    TResult Function()? cancelTaskForm,
    required TResult orElse(),
  }) {
    if (startTaskForm != null) {
      return startTaskForm();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StartProjectForm value) startProjectForm,
    required TResult Function(_CancelProjectForm value) cancelProjectForm,
    required TResult Function(_StartTaskForm value) startTaskForm,
    required TResult Function(_CancelTaskForm value) cancelTaskForm,
  }) {
    return startTaskForm(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartProjectForm value)? startProjectForm,
    TResult? Function(_CancelProjectForm value)? cancelProjectForm,
    TResult? Function(_StartTaskForm value)? startTaskForm,
    TResult? Function(_CancelTaskForm value)? cancelTaskForm,
  }) {
    return startTaskForm?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartProjectForm value)? startProjectForm,
    TResult Function(_CancelProjectForm value)? cancelProjectForm,
    TResult Function(_StartTaskForm value)? startTaskForm,
    TResult Function(_CancelTaskForm value)? cancelTaskForm,
    required TResult orElse(),
  }) {
    if (startTaskForm != null) {
      return startTaskForm(this);
    }
    return orElse();
  }
}

abstract class _StartTaskForm implements ProjectCreatorEvent {
  factory _StartTaskForm() = _$_StartTaskForm;
}

/// @nodoc
abstract class _$$_CancelTaskFormCopyWith<$Res> {
  factory _$$_CancelTaskFormCopyWith(
          _$_CancelTaskForm value, $Res Function(_$_CancelTaskForm) then) =
      __$$_CancelTaskFormCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_CancelTaskFormCopyWithImpl<$Res>
    extends _$ProjectCreatorEventCopyWithImpl<$Res, _$_CancelTaskForm>
    implements _$$_CancelTaskFormCopyWith<$Res> {
  __$$_CancelTaskFormCopyWithImpl(
      _$_CancelTaskForm _value, $Res Function(_$_CancelTaskForm) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_CancelTaskForm implements _CancelTaskForm {
  _$_CancelTaskForm();

  @override
  String toString() {
    return 'ProjectCreatorEvent.cancelTaskForm()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_CancelTaskForm);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() startProjectForm,
    required TResult Function() cancelProjectForm,
    required TResult Function() startTaskForm,
    required TResult Function() cancelTaskForm,
  }) {
    return cancelTaskForm();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? startProjectForm,
    TResult? Function()? cancelProjectForm,
    TResult? Function()? startTaskForm,
    TResult? Function()? cancelTaskForm,
  }) {
    return cancelTaskForm?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? startProjectForm,
    TResult Function()? cancelProjectForm,
    TResult Function()? startTaskForm,
    TResult Function()? cancelTaskForm,
    required TResult orElse(),
  }) {
    if (cancelTaskForm != null) {
      return cancelTaskForm();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StartProjectForm value) startProjectForm,
    required TResult Function(_CancelProjectForm value) cancelProjectForm,
    required TResult Function(_StartTaskForm value) startTaskForm,
    required TResult Function(_CancelTaskForm value) cancelTaskForm,
  }) {
    return cancelTaskForm(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartProjectForm value)? startProjectForm,
    TResult? Function(_CancelProjectForm value)? cancelProjectForm,
    TResult? Function(_StartTaskForm value)? startTaskForm,
    TResult? Function(_CancelTaskForm value)? cancelTaskForm,
  }) {
    return cancelTaskForm?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartProjectForm value)? startProjectForm,
    TResult Function(_CancelProjectForm value)? cancelProjectForm,
    TResult Function(_StartTaskForm value)? startTaskForm,
    TResult Function(_CancelTaskForm value)? cancelTaskForm,
    required TResult orElse(),
  }) {
    if (cancelTaskForm != null) {
      return cancelTaskForm(this);
    }
    return orElse();
  }
}

abstract class _CancelTaskForm implements ProjectCreatorEvent {
  factory _CancelTaskForm() = _$_CancelTaskForm;
}

/// @nodoc
mixin _$ProjectCreatorState {
  bool get projectFormIsActive => throw _privateConstructorUsedError;
  bool get taskFormIsActive => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProjectCreatorStateCopyWith<ProjectCreatorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectCreatorStateCopyWith<$Res> {
  factory $ProjectCreatorStateCopyWith(
          ProjectCreatorState value, $Res Function(ProjectCreatorState) then) =
      _$ProjectCreatorStateCopyWithImpl<$Res, ProjectCreatorState>;
  @useResult
  $Res call({bool projectFormIsActive, bool taskFormIsActive});
}

/// @nodoc
class _$ProjectCreatorStateCopyWithImpl<$Res, $Val extends ProjectCreatorState>
    implements $ProjectCreatorStateCopyWith<$Res> {
  _$ProjectCreatorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectFormIsActive = null,
    Object? taskFormIsActive = null,
  }) {
    return _then(_value.copyWith(
      projectFormIsActive: null == projectFormIsActive
          ? _value.projectFormIsActive
          : projectFormIsActive // ignore: cast_nullable_to_non_nullable
              as bool,
      taskFormIsActive: null == taskFormIsActive
          ? _value.taskFormIsActive
          : taskFormIsActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProjectCreatorStateCopyWith<$Res>
    implements $ProjectCreatorStateCopyWith<$Res> {
  factory _$$_ProjectCreatorStateCopyWith(_$_ProjectCreatorState value,
          $Res Function(_$_ProjectCreatorState) then) =
      __$$_ProjectCreatorStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool projectFormIsActive, bool taskFormIsActive});
}

/// @nodoc
class __$$_ProjectCreatorStateCopyWithImpl<$Res>
    extends _$ProjectCreatorStateCopyWithImpl<$Res, _$_ProjectCreatorState>
    implements _$$_ProjectCreatorStateCopyWith<$Res> {
  __$$_ProjectCreatorStateCopyWithImpl(_$_ProjectCreatorState _value,
      $Res Function(_$_ProjectCreatorState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectFormIsActive = null,
    Object? taskFormIsActive = null,
  }) {
    return _then(_$_ProjectCreatorState(
      projectFormIsActive: null == projectFormIsActive
          ? _value.projectFormIsActive
          : projectFormIsActive // ignore: cast_nullable_to_non_nullable
              as bool,
      taskFormIsActive: null == taskFormIsActive
          ? _value.taskFormIsActive
          : taskFormIsActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ProjectCreatorState implements _ProjectCreatorState {
  _$_ProjectCreatorState(
      {required this.projectFormIsActive, required this.taskFormIsActive});

  @override
  final bool projectFormIsActive;
  @override
  final bool taskFormIsActive;

  @override
  String toString() {
    return 'ProjectCreatorState(projectFormIsActive: $projectFormIsActive, taskFormIsActive: $taskFormIsActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProjectCreatorState &&
            (identical(other.projectFormIsActive, projectFormIsActive) ||
                other.projectFormIsActive == projectFormIsActive) &&
            (identical(other.taskFormIsActive, taskFormIsActive) ||
                other.taskFormIsActive == taskFormIsActive));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, projectFormIsActive, taskFormIsActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProjectCreatorStateCopyWith<_$_ProjectCreatorState> get copyWith =>
      __$$_ProjectCreatorStateCopyWithImpl<_$_ProjectCreatorState>(
          this, _$identity);
}

abstract class _ProjectCreatorState implements ProjectCreatorState {
  factory _ProjectCreatorState(
      {required final bool projectFormIsActive,
      required final bool taskFormIsActive}) = _$_ProjectCreatorState;

  @override
  bool get projectFormIsActive;
  @override
  bool get taskFormIsActive;
  @override
  @JsonKey(ignore: true)
  _$$_ProjectCreatorStateCopyWith<_$_ProjectCreatorState> get copyWith =>
      throw _privateConstructorUsedError;
}
