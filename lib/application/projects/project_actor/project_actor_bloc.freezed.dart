// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_actor_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProjectActorEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Project project) deleteProject,
    required TResult Function(Task task, DocumentReference<Object?> reference)
        deleteTask,
    required TResult Function() reInitializeProject,
    required TResult Function() reInitializeTask,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Project project)? deleteProject,
    TResult? Function(Task task, DocumentReference<Object?> reference)?
        deleteTask,
    TResult? Function()? reInitializeProject,
    TResult? Function()? reInitializeTask,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Project project)? deleteProject,
    TResult Function(Task task, DocumentReference<Object?> reference)?
        deleteTask,
    TResult Function()? reInitializeProject,
    TResult Function()? reInitializeTask,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Deleted value) deleteProject,
    required TResult Function(_DeleteTask value) deleteTask,
    required TResult Function(_ReInitializeProject value) reInitializeProject,
    required TResult Function(_ReInitializeTask value) reInitializeTask,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Deleted value)? deleteProject,
    TResult? Function(_DeleteTask value)? deleteTask,
    TResult? Function(_ReInitializeProject value)? reInitializeProject,
    TResult? Function(_ReInitializeTask value)? reInitializeTask,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Deleted value)? deleteProject,
    TResult Function(_DeleteTask value)? deleteTask,
    TResult Function(_ReInitializeProject value)? reInitializeProject,
    TResult Function(_ReInitializeTask value)? reInitializeTask,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectActorEventCopyWith<$Res> {
  factory $ProjectActorEventCopyWith(
          ProjectActorEvent value, $Res Function(ProjectActorEvent) then) =
      _$ProjectActorEventCopyWithImpl<$Res, ProjectActorEvent>;
}

/// @nodoc
class _$ProjectActorEventCopyWithImpl<$Res, $Val extends ProjectActorEvent>
    implements $ProjectActorEventCopyWith<$Res> {
  _$ProjectActorEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_DeletedCopyWith<$Res> {
  factory _$$_DeletedCopyWith(
          _$_Deleted value, $Res Function(_$_Deleted) then) =
      __$$_DeletedCopyWithImpl<$Res>;
  @useResult
  $Res call({Project project});

  $ProjectCopyWith<$Res> get project;
}

/// @nodoc
class __$$_DeletedCopyWithImpl<$Res>
    extends _$ProjectActorEventCopyWithImpl<$Res, _$_Deleted>
    implements _$$_DeletedCopyWith<$Res> {
  __$$_DeletedCopyWithImpl(_$_Deleted _value, $Res Function(_$_Deleted) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? project = null,
  }) {
    return _then(_$_Deleted(
      null == project
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as Project,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ProjectCopyWith<$Res> get project {
    return $ProjectCopyWith<$Res>(_value.project, (value) {
      return _then(_value.copyWith(project: value));
    });
  }
}

/// @nodoc

class _$_Deleted implements _Deleted {
  const _$_Deleted(this.project);

  @override
  final Project project;

  @override
  String toString() {
    return 'ProjectActorEvent.deleteProject(project: $project)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Deleted &&
            (identical(other.project, project) || other.project == project));
  }

  @override
  int get hashCode => Object.hash(runtimeType, project);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeletedCopyWith<_$_Deleted> get copyWith =>
      __$$_DeletedCopyWithImpl<_$_Deleted>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Project project) deleteProject,
    required TResult Function(Task task, DocumentReference<Object?> reference)
        deleteTask,
    required TResult Function() reInitializeProject,
    required TResult Function() reInitializeTask,
  }) {
    return deleteProject(project);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Project project)? deleteProject,
    TResult? Function(Task task, DocumentReference<Object?> reference)?
        deleteTask,
    TResult? Function()? reInitializeProject,
    TResult? Function()? reInitializeTask,
  }) {
    return deleteProject?.call(project);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Project project)? deleteProject,
    TResult Function(Task task, DocumentReference<Object?> reference)?
        deleteTask,
    TResult Function()? reInitializeProject,
    TResult Function()? reInitializeTask,
    required TResult orElse(),
  }) {
    if (deleteProject != null) {
      return deleteProject(project);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Deleted value) deleteProject,
    required TResult Function(_DeleteTask value) deleteTask,
    required TResult Function(_ReInitializeProject value) reInitializeProject,
    required TResult Function(_ReInitializeTask value) reInitializeTask,
  }) {
    return deleteProject(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Deleted value)? deleteProject,
    TResult? Function(_DeleteTask value)? deleteTask,
    TResult? Function(_ReInitializeProject value)? reInitializeProject,
    TResult? Function(_ReInitializeTask value)? reInitializeTask,
  }) {
    return deleteProject?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Deleted value)? deleteProject,
    TResult Function(_DeleteTask value)? deleteTask,
    TResult Function(_ReInitializeProject value)? reInitializeProject,
    TResult Function(_ReInitializeTask value)? reInitializeTask,
    required TResult orElse(),
  }) {
    if (deleteProject != null) {
      return deleteProject(this);
    }
    return orElse();
  }
}

abstract class _Deleted implements ProjectActorEvent {
  const factory _Deleted(final Project project) = _$_Deleted;

  Project get project;
  @JsonKey(ignore: true)
  _$$_DeletedCopyWith<_$_Deleted> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DeleteTaskCopyWith<$Res> {
  factory _$$_DeleteTaskCopyWith(
          _$_DeleteTask value, $Res Function(_$_DeleteTask) then) =
      __$$_DeleteTaskCopyWithImpl<$Res>;
  @useResult
  $Res call({Task task, DocumentReference<Object?> reference});

  $TaskCopyWith<$Res> get task;
}

/// @nodoc
class __$$_DeleteTaskCopyWithImpl<$Res>
    extends _$ProjectActorEventCopyWithImpl<$Res, _$_DeleteTask>
    implements _$$_DeleteTaskCopyWith<$Res> {
  __$$_DeleteTaskCopyWithImpl(
      _$_DeleteTask _value, $Res Function(_$_DeleteTask) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? task = null,
    Object? reference = null,
  }) {
    return _then(_$_DeleteTask(
      null == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as Task,
      null == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Object?>,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $TaskCopyWith<$Res> get task {
    return $TaskCopyWith<$Res>(_value.task, (value) {
      return _then(_value.copyWith(task: value));
    });
  }
}

/// @nodoc

class _$_DeleteTask implements _DeleteTask {
  const _$_DeleteTask(this.task, this.reference);

  @override
  final Task task;
  @override
  final DocumentReference<Object?> reference;

  @override
  String toString() {
    return 'ProjectActorEvent.deleteTask(task: $task, reference: $reference)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeleteTask &&
            (identical(other.task, task) || other.task == task) &&
            (identical(other.reference, reference) ||
                other.reference == reference));
  }

  @override
  int get hashCode => Object.hash(runtimeType, task, reference);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeleteTaskCopyWith<_$_DeleteTask> get copyWith =>
      __$$_DeleteTaskCopyWithImpl<_$_DeleteTask>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Project project) deleteProject,
    required TResult Function(Task task, DocumentReference<Object?> reference)
        deleteTask,
    required TResult Function() reInitializeProject,
    required TResult Function() reInitializeTask,
  }) {
    return deleteTask(task, reference);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Project project)? deleteProject,
    TResult? Function(Task task, DocumentReference<Object?> reference)?
        deleteTask,
    TResult? Function()? reInitializeProject,
    TResult? Function()? reInitializeTask,
  }) {
    return deleteTask?.call(task, reference);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Project project)? deleteProject,
    TResult Function(Task task, DocumentReference<Object?> reference)?
        deleteTask,
    TResult Function()? reInitializeProject,
    TResult Function()? reInitializeTask,
    required TResult orElse(),
  }) {
    if (deleteTask != null) {
      return deleteTask(task, reference);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Deleted value) deleteProject,
    required TResult Function(_DeleteTask value) deleteTask,
    required TResult Function(_ReInitializeProject value) reInitializeProject,
    required TResult Function(_ReInitializeTask value) reInitializeTask,
  }) {
    return deleteTask(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Deleted value)? deleteProject,
    TResult? Function(_DeleteTask value)? deleteTask,
    TResult? Function(_ReInitializeProject value)? reInitializeProject,
    TResult? Function(_ReInitializeTask value)? reInitializeTask,
  }) {
    return deleteTask?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Deleted value)? deleteProject,
    TResult Function(_DeleteTask value)? deleteTask,
    TResult Function(_ReInitializeProject value)? reInitializeProject,
    TResult Function(_ReInitializeTask value)? reInitializeTask,
    required TResult orElse(),
  }) {
    if (deleteTask != null) {
      return deleteTask(this);
    }
    return orElse();
  }
}

abstract class _DeleteTask implements ProjectActorEvent {
  const factory _DeleteTask(
          final Task task, final DocumentReference<Object?> reference) =
      _$_DeleteTask;

  Task get task;
  DocumentReference<Object?> get reference;
  @JsonKey(ignore: true)
  _$$_DeleteTaskCopyWith<_$_DeleteTask> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ReInitializeProjectCopyWith<$Res> {
  factory _$$_ReInitializeProjectCopyWith(_$_ReInitializeProject value,
          $Res Function(_$_ReInitializeProject) then) =
      __$$_ReInitializeProjectCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ReInitializeProjectCopyWithImpl<$Res>
    extends _$ProjectActorEventCopyWithImpl<$Res, _$_ReInitializeProject>
    implements _$$_ReInitializeProjectCopyWith<$Res> {
  __$$_ReInitializeProjectCopyWithImpl(_$_ReInitializeProject _value,
      $Res Function(_$_ReInitializeProject) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ReInitializeProject implements _ReInitializeProject {
  const _$_ReInitializeProject();

  @override
  String toString() {
    return 'ProjectActorEvent.reInitializeProject()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ReInitializeProject);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Project project) deleteProject,
    required TResult Function(Task task, DocumentReference<Object?> reference)
        deleteTask,
    required TResult Function() reInitializeProject,
    required TResult Function() reInitializeTask,
  }) {
    return reInitializeProject();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Project project)? deleteProject,
    TResult? Function(Task task, DocumentReference<Object?> reference)?
        deleteTask,
    TResult? Function()? reInitializeProject,
    TResult? Function()? reInitializeTask,
  }) {
    return reInitializeProject?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Project project)? deleteProject,
    TResult Function(Task task, DocumentReference<Object?> reference)?
        deleteTask,
    TResult Function()? reInitializeProject,
    TResult Function()? reInitializeTask,
    required TResult orElse(),
  }) {
    if (reInitializeProject != null) {
      return reInitializeProject();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Deleted value) deleteProject,
    required TResult Function(_DeleteTask value) deleteTask,
    required TResult Function(_ReInitializeProject value) reInitializeProject,
    required TResult Function(_ReInitializeTask value) reInitializeTask,
  }) {
    return reInitializeProject(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Deleted value)? deleteProject,
    TResult? Function(_DeleteTask value)? deleteTask,
    TResult? Function(_ReInitializeProject value)? reInitializeProject,
    TResult? Function(_ReInitializeTask value)? reInitializeTask,
  }) {
    return reInitializeProject?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Deleted value)? deleteProject,
    TResult Function(_DeleteTask value)? deleteTask,
    TResult Function(_ReInitializeProject value)? reInitializeProject,
    TResult Function(_ReInitializeTask value)? reInitializeTask,
    required TResult orElse(),
  }) {
    if (reInitializeProject != null) {
      return reInitializeProject(this);
    }
    return orElse();
  }
}

abstract class _ReInitializeProject implements ProjectActorEvent {
  const factory _ReInitializeProject() = _$_ReInitializeProject;
}

/// @nodoc
abstract class _$$_ReInitializeTaskCopyWith<$Res> {
  factory _$$_ReInitializeTaskCopyWith(
          _$_ReInitializeTask value, $Res Function(_$_ReInitializeTask) then) =
      __$$_ReInitializeTaskCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ReInitializeTaskCopyWithImpl<$Res>
    extends _$ProjectActorEventCopyWithImpl<$Res, _$_ReInitializeTask>
    implements _$$_ReInitializeTaskCopyWith<$Res> {
  __$$_ReInitializeTaskCopyWithImpl(
      _$_ReInitializeTask _value, $Res Function(_$_ReInitializeTask) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ReInitializeTask implements _ReInitializeTask {
  const _$_ReInitializeTask();

  @override
  String toString() {
    return 'ProjectActorEvent.reInitializeTask()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ReInitializeTask);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Project project) deleteProject,
    required TResult Function(Task task, DocumentReference<Object?> reference)
        deleteTask,
    required TResult Function() reInitializeProject,
    required TResult Function() reInitializeTask,
  }) {
    return reInitializeTask();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Project project)? deleteProject,
    TResult? Function(Task task, DocumentReference<Object?> reference)?
        deleteTask,
    TResult? Function()? reInitializeProject,
    TResult? Function()? reInitializeTask,
  }) {
    return reInitializeTask?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Project project)? deleteProject,
    TResult Function(Task task, DocumentReference<Object?> reference)?
        deleteTask,
    TResult Function()? reInitializeProject,
    TResult Function()? reInitializeTask,
    required TResult orElse(),
  }) {
    if (reInitializeTask != null) {
      return reInitializeTask();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Deleted value) deleteProject,
    required TResult Function(_DeleteTask value) deleteTask,
    required TResult Function(_ReInitializeProject value) reInitializeProject,
    required TResult Function(_ReInitializeTask value) reInitializeTask,
  }) {
    return reInitializeTask(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Deleted value)? deleteProject,
    TResult? Function(_DeleteTask value)? deleteTask,
    TResult? Function(_ReInitializeProject value)? reInitializeProject,
    TResult? Function(_ReInitializeTask value)? reInitializeTask,
  }) {
    return reInitializeTask?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Deleted value)? deleteProject,
    TResult Function(_DeleteTask value)? deleteTask,
    TResult Function(_ReInitializeProject value)? reInitializeProject,
    TResult Function(_ReInitializeTask value)? reInitializeTask,
    required TResult orElse(),
  }) {
    if (reInitializeTask != null) {
      return reInitializeTask(this);
    }
    return orElse();
  }
}

abstract class _ReInitializeTask implements ProjectActorEvent {
  const factory _ReInitializeTask() = _$_ReInitializeTask;
}

/// @nodoc
mixin _$ProjectActorState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reInitializeProjectState,
    required TResult Function() reInitializeTaskState,
    required TResult Function() deleteProjectSuccess,
    required TResult Function(String failureException) deleteProjectFailure,
    required TResult Function() deleteTaskSuccess,
    required TResult Function(String failureException) deleteTaskFailure,
    required TResult Function() initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reInitializeProjectState,
    TResult? Function()? reInitializeTaskState,
    TResult? Function()? deleteProjectSuccess,
    TResult? Function(String failureException)? deleteProjectFailure,
    TResult? Function()? deleteTaskSuccess,
    TResult? Function(String failureException)? deleteTaskFailure,
    TResult? Function()? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reInitializeProjectState,
    TResult Function()? reInitializeTaskState,
    TResult Function()? deleteProjectSuccess,
    TResult Function(String failureException)? deleteProjectFailure,
    TResult Function()? deleteTaskSuccess,
    TResult Function(String failureException)? deleteTaskFailure,
    TResult Function()? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ReInitializeProjectState value)
        reInitializeProjectState,
    required TResult Function(_ReInitializeTaskState value)
        reInitializeTaskState,
    required TResult Function(_DeleteProjectSuccess value) deleteProjectSuccess,
    required TResult Function(_DeleteProjectFailure value) deleteProjectFailure,
    required TResult Function(_DeleteTaskSuccess value) deleteTaskSuccess,
    required TResult Function(_DeleteTaskFailure value) deleteTaskFailure,
    required TResult Function(_Initial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ReInitializeProjectState value)?
        reInitializeProjectState,
    TResult? Function(_ReInitializeTaskState value)? reInitializeTaskState,
    TResult? Function(_DeleteProjectSuccess value)? deleteProjectSuccess,
    TResult? Function(_DeleteProjectFailure value)? deleteProjectFailure,
    TResult? Function(_DeleteTaskSuccess value)? deleteTaskSuccess,
    TResult? Function(_DeleteTaskFailure value)? deleteTaskFailure,
    TResult? Function(_Initial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ReInitializeProjectState value)? reInitializeProjectState,
    TResult Function(_ReInitializeTaskState value)? reInitializeTaskState,
    TResult Function(_DeleteProjectSuccess value)? deleteProjectSuccess,
    TResult Function(_DeleteProjectFailure value)? deleteProjectFailure,
    TResult Function(_DeleteTaskSuccess value)? deleteTaskSuccess,
    TResult Function(_DeleteTaskFailure value)? deleteTaskFailure,
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectActorStateCopyWith<$Res> {
  factory $ProjectActorStateCopyWith(
          ProjectActorState value, $Res Function(ProjectActorState) then) =
      _$ProjectActorStateCopyWithImpl<$Res, ProjectActorState>;
}

/// @nodoc
class _$ProjectActorStateCopyWithImpl<$Res, $Val extends ProjectActorState>
    implements $ProjectActorStateCopyWith<$Res> {
  _$ProjectActorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_ReInitializeProjectStateCopyWith<$Res> {
  factory _$$_ReInitializeProjectStateCopyWith(
          _$_ReInitializeProjectState value,
          $Res Function(_$_ReInitializeProjectState) then) =
      __$$_ReInitializeProjectStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ReInitializeProjectStateCopyWithImpl<$Res>
    extends _$ProjectActorStateCopyWithImpl<$Res, _$_ReInitializeProjectState>
    implements _$$_ReInitializeProjectStateCopyWith<$Res> {
  __$$_ReInitializeProjectStateCopyWithImpl(_$_ReInitializeProjectState _value,
      $Res Function(_$_ReInitializeProjectState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ReInitializeProjectState implements _ReInitializeProjectState {
  const _$_ReInitializeProjectState();

  @override
  String toString() {
    return 'ProjectActorState.reInitializeProjectState()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReInitializeProjectState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reInitializeProjectState,
    required TResult Function() reInitializeTaskState,
    required TResult Function() deleteProjectSuccess,
    required TResult Function(String failureException) deleteProjectFailure,
    required TResult Function() deleteTaskSuccess,
    required TResult Function(String failureException) deleteTaskFailure,
    required TResult Function() initial,
  }) {
    return reInitializeProjectState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reInitializeProjectState,
    TResult? Function()? reInitializeTaskState,
    TResult? Function()? deleteProjectSuccess,
    TResult? Function(String failureException)? deleteProjectFailure,
    TResult? Function()? deleteTaskSuccess,
    TResult? Function(String failureException)? deleteTaskFailure,
    TResult? Function()? initial,
  }) {
    return reInitializeProjectState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reInitializeProjectState,
    TResult Function()? reInitializeTaskState,
    TResult Function()? deleteProjectSuccess,
    TResult Function(String failureException)? deleteProjectFailure,
    TResult Function()? deleteTaskSuccess,
    TResult Function(String failureException)? deleteTaskFailure,
    TResult Function()? initial,
    required TResult orElse(),
  }) {
    if (reInitializeProjectState != null) {
      return reInitializeProjectState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ReInitializeProjectState value)
        reInitializeProjectState,
    required TResult Function(_ReInitializeTaskState value)
        reInitializeTaskState,
    required TResult Function(_DeleteProjectSuccess value) deleteProjectSuccess,
    required TResult Function(_DeleteProjectFailure value) deleteProjectFailure,
    required TResult Function(_DeleteTaskSuccess value) deleteTaskSuccess,
    required TResult Function(_DeleteTaskFailure value) deleteTaskFailure,
    required TResult Function(_Initial value) initial,
  }) {
    return reInitializeProjectState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ReInitializeProjectState value)?
        reInitializeProjectState,
    TResult? Function(_ReInitializeTaskState value)? reInitializeTaskState,
    TResult? Function(_DeleteProjectSuccess value)? deleteProjectSuccess,
    TResult? Function(_DeleteProjectFailure value)? deleteProjectFailure,
    TResult? Function(_DeleteTaskSuccess value)? deleteTaskSuccess,
    TResult? Function(_DeleteTaskFailure value)? deleteTaskFailure,
    TResult? Function(_Initial value)? initial,
  }) {
    return reInitializeProjectState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ReInitializeProjectState value)? reInitializeProjectState,
    TResult Function(_ReInitializeTaskState value)? reInitializeTaskState,
    TResult Function(_DeleteProjectSuccess value)? deleteProjectSuccess,
    TResult Function(_DeleteProjectFailure value)? deleteProjectFailure,
    TResult Function(_DeleteTaskSuccess value)? deleteTaskSuccess,
    TResult Function(_DeleteTaskFailure value)? deleteTaskFailure,
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (reInitializeProjectState != null) {
      return reInitializeProjectState(this);
    }
    return orElse();
  }
}

abstract class _ReInitializeProjectState implements ProjectActorState {
  const factory _ReInitializeProjectState() = _$_ReInitializeProjectState;
}

/// @nodoc
abstract class _$$_ReInitializeTaskStateCopyWith<$Res> {
  factory _$$_ReInitializeTaskStateCopyWith(_$_ReInitializeTaskState value,
          $Res Function(_$_ReInitializeTaskState) then) =
      __$$_ReInitializeTaskStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ReInitializeTaskStateCopyWithImpl<$Res>
    extends _$ProjectActorStateCopyWithImpl<$Res, _$_ReInitializeTaskState>
    implements _$$_ReInitializeTaskStateCopyWith<$Res> {
  __$$_ReInitializeTaskStateCopyWithImpl(_$_ReInitializeTaskState _value,
      $Res Function(_$_ReInitializeTaskState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ReInitializeTaskState implements _ReInitializeTaskState {
  const _$_ReInitializeTaskState();

  @override
  String toString() {
    return 'ProjectActorState.reInitializeTaskState()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ReInitializeTaskState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reInitializeProjectState,
    required TResult Function() reInitializeTaskState,
    required TResult Function() deleteProjectSuccess,
    required TResult Function(String failureException) deleteProjectFailure,
    required TResult Function() deleteTaskSuccess,
    required TResult Function(String failureException) deleteTaskFailure,
    required TResult Function() initial,
  }) {
    return reInitializeTaskState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reInitializeProjectState,
    TResult? Function()? reInitializeTaskState,
    TResult? Function()? deleteProjectSuccess,
    TResult? Function(String failureException)? deleteProjectFailure,
    TResult? Function()? deleteTaskSuccess,
    TResult? Function(String failureException)? deleteTaskFailure,
    TResult? Function()? initial,
  }) {
    return reInitializeTaskState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reInitializeProjectState,
    TResult Function()? reInitializeTaskState,
    TResult Function()? deleteProjectSuccess,
    TResult Function(String failureException)? deleteProjectFailure,
    TResult Function()? deleteTaskSuccess,
    TResult Function(String failureException)? deleteTaskFailure,
    TResult Function()? initial,
    required TResult orElse(),
  }) {
    if (reInitializeTaskState != null) {
      return reInitializeTaskState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ReInitializeProjectState value)
        reInitializeProjectState,
    required TResult Function(_ReInitializeTaskState value)
        reInitializeTaskState,
    required TResult Function(_DeleteProjectSuccess value) deleteProjectSuccess,
    required TResult Function(_DeleteProjectFailure value) deleteProjectFailure,
    required TResult Function(_DeleteTaskSuccess value) deleteTaskSuccess,
    required TResult Function(_DeleteTaskFailure value) deleteTaskFailure,
    required TResult Function(_Initial value) initial,
  }) {
    return reInitializeTaskState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ReInitializeProjectState value)?
        reInitializeProjectState,
    TResult? Function(_ReInitializeTaskState value)? reInitializeTaskState,
    TResult? Function(_DeleteProjectSuccess value)? deleteProjectSuccess,
    TResult? Function(_DeleteProjectFailure value)? deleteProjectFailure,
    TResult? Function(_DeleteTaskSuccess value)? deleteTaskSuccess,
    TResult? Function(_DeleteTaskFailure value)? deleteTaskFailure,
    TResult? Function(_Initial value)? initial,
  }) {
    return reInitializeTaskState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ReInitializeProjectState value)? reInitializeProjectState,
    TResult Function(_ReInitializeTaskState value)? reInitializeTaskState,
    TResult Function(_DeleteProjectSuccess value)? deleteProjectSuccess,
    TResult Function(_DeleteProjectFailure value)? deleteProjectFailure,
    TResult Function(_DeleteTaskSuccess value)? deleteTaskSuccess,
    TResult Function(_DeleteTaskFailure value)? deleteTaskFailure,
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (reInitializeTaskState != null) {
      return reInitializeTaskState(this);
    }
    return orElse();
  }
}

abstract class _ReInitializeTaskState implements ProjectActorState {
  const factory _ReInitializeTaskState() = _$_ReInitializeTaskState;
}

/// @nodoc
abstract class _$$_DeleteProjectSuccessCopyWith<$Res> {
  factory _$$_DeleteProjectSuccessCopyWith(_$_DeleteProjectSuccess value,
          $Res Function(_$_DeleteProjectSuccess) then) =
      __$$_DeleteProjectSuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_DeleteProjectSuccessCopyWithImpl<$Res>
    extends _$ProjectActorStateCopyWithImpl<$Res, _$_DeleteProjectSuccess>
    implements _$$_DeleteProjectSuccessCopyWith<$Res> {
  __$$_DeleteProjectSuccessCopyWithImpl(_$_DeleteProjectSuccess _value,
      $Res Function(_$_DeleteProjectSuccess) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_DeleteProjectSuccess implements _DeleteProjectSuccess {
  const _$_DeleteProjectSuccess();

  @override
  String toString() {
    return 'ProjectActorState.deleteProjectSuccess()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_DeleteProjectSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reInitializeProjectState,
    required TResult Function() reInitializeTaskState,
    required TResult Function() deleteProjectSuccess,
    required TResult Function(String failureException) deleteProjectFailure,
    required TResult Function() deleteTaskSuccess,
    required TResult Function(String failureException) deleteTaskFailure,
    required TResult Function() initial,
  }) {
    return deleteProjectSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reInitializeProjectState,
    TResult? Function()? reInitializeTaskState,
    TResult? Function()? deleteProjectSuccess,
    TResult? Function(String failureException)? deleteProjectFailure,
    TResult? Function()? deleteTaskSuccess,
    TResult? Function(String failureException)? deleteTaskFailure,
    TResult? Function()? initial,
  }) {
    return deleteProjectSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reInitializeProjectState,
    TResult Function()? reInitializeTaskState,
    TResult Function()? deleteProjectSuccess,
    TResult Function(String failureException)? deleteProjectFailure,
    TResult Function()? deleteTaskSuccess,
    TResult Function(String failureException)? deleteTaskFailure,
    TResult Function()? initial,
    required TResult orElse(),
  }) {
    if (deleteProjectSuccess != null) {
      return deleteProjectSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ReInitializeProjectState value)
        reInitializeProjectState,
    required TResult Function(_ReInitializeTaskState value)
        reInitializeTaskState,
    required TResult Function(_DeleteProjectSuccess value) deleteProjectSuccess,
    required TResult Function(_DeleteProjectFailure value) deleteProjectFailure,
    required TResult Function(_DeleteTaskSuccess value) deleteTaskSuccess,
    required TResult Function(_DeleteTaskFailure value) deleteTaskFailure,
    required TResult Function(_Initial value) initial,
  }) {
    return deleteProjectSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ReInitializeProjectState value)?
        reInitializeProjectState,
    TResult? Function(_ReInitializeTaskState value)? reInitializeTaskState,
    TResult? Function(_DeleteProjectSuccess value)? deleteProjectSuccess,
    TResult? Function(_DeleteProjectFailure value)? deleteProjectFailure,
    TResult? Function(_DeleteTaskSuccess value)? deleteTaskSuccess,
    TResult? Function(_DeleteTaskFailure value)? deleteTaskFailure,
    TResult? Function(_Initial value)? initial,
  }) {
    return deleteProjectSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ReInitializeProjectState value)? reInitializeProjectState,
    TResult Function(_ReInitializeTaskState value)? reInitializeTaskState,
    TResult Function(_DeleteProjectSuccess value)? deleteProjectSuccess,
    TResult Function(_DeleteProjectFailure value)? deleteProjectFailure,
    TResult Function(_DeleteTaskSuccess value)? deleteTaskSuccess,
    TResult Function(_DeleteTaskFailure value)? deleteTaskFailure,
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (deleteProjectSuccess != null) {
      return deleteProjectSuccess(this);
    }
    return orElse();
  }
}

abstract class _DeleteProjectSuccess implements ProjectActorState {
  const factory _DeleteProjectSuccess() = _$_DeleteProjectSuccess;
}

/// @nodoc
abstract class _$$_DeleteProjectFailureCopyWith<$Res> {
  factory _$$_DeleteProjectFailureCopyWith(_$_DeleteProjectFailure value,
          $Res Function(_$_DeleteProjectFailure) then) =
      __$$_DeleteProjectFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({String failureException});
}

/// @nodoc
class __$$_DeleteProjectFailureCopyWithImpl<$Res>
    extends _$ProjectActorStateCopyWithImpl<$Res, _$_DeleteProjectFailure>
    implements _$$_DeleteProjectFailureCopyWith<$Res> {
  __$$_DeleteProjectFailureCopyWithImpl(_$_DeleteProjectFailure _value,
      $Res Function(_$_DeleteProjectFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failureException = null,
  }) {
    return _then(_$_DeleteProjectFailure(
      null == failureException
          ? _value.failureException
          : failureException // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_DeleteProjectFailure implements _DeleteProjectFailure {
  const _$_DeleteProjectFailure(this.failureException);

  @override
  final String failureException;

  @override
  String toString() {
    return 'ProjectActorState.deleteProjectFailure(failureException: $failureException)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeleteProjectFailure &&
            (identical(other.failureException, failureException) ||
                other.failureException == failureException));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failureException);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeleteProjectFailureCopyWith<_$_DeleteProjectFailure> get copyWith =>
      __$$_DeleteProjectFailureCopyWithImpl<_$_DeleteProjectFailure>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reInitializeProjectState,
    required TResult Function() reInitializeTaskState,
    required TResult Function() deleteProjectSuccess,
    required TResult Function(String failureException) deleteProjectFailure,
    required TResult Function() deleteTaskSuccess,
    required TResult Function(String failureException) deleteTaskFailure,
    required TResult Function() initial,
  }) {
    return deleteProjectFailure(failureException);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reInitializeProjectState,
    TResult? Function()? reInitializeTaskState,
    TResult? Function()? deleteProjectSuccess,
    TResult? Function(String failureException)? deleteProjectFailure,
    TResult? Function()? deleteTaskSuccess,
    TResult? Function(String failureException)? deleteTaskFailure,
    TResult? Function()? initial,
  }) {
    return deleteProjectFailure?.call(failureException);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reInitializeProjectState,
    TResult Function()? reInitializeTaskState,
    TResult Function()? deleteProjectSuccess,
    TResult Function(String failureException)? deleteProjectFailure,
    TResult Function()? deleteTaskSuccess,
    TResult Function(String failureException)? deleteTaskFailure,
    TResult Function()? initial,
    required TResult orElse(),
  }) {
    if (deleteProjectFailure != null) {
      return deleteProjectFailure(failureException);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ReInitializeProjectState value)
        reInitializeProjectState,
    required TResult Function(_ReInitializeTaskState value)
        reInitializeTaskState,
    required TResult Function(_DeleteProjectSuccess value) deleteProjectSuccess,
    required TResult Function(_DeleteProjectFailure value) deleteProjectFailure,
    required TResult Function(_DeleteTaskSuccess value) deleteTaskSuccess,
    required TResult Function(_DeleteTaskFailure value) deleteTaskFailure,
    required TResult Function(_Initial value) initial,
  }) {
    return deleteProjectFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ReInitializeProjectState value)?
        reInitializeProjectState,
    TResult? Function(_ReInitializeTaskState value)? reInitializeTaskState,
    TResult? Function(_DeleteProjectSuccess value)? deleteProjectSuccess,
    TResult? Function(_DeleteProjectFailure value)? deleteProjectFailure,
    TResult? Function(_DeleteTaskSuccess value)? deleteTaskSuccess,
    TResult? Function(_DeleteTaskFailure value)? deleteTaskFailure,
    TResult? Function(_Initial value)? initial,
  }) {
    return deleteProjectFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ReInitializeProjectState value)? reInitializeProjectState,
    TResult Function(_ReInitializeTaskState value)? reInitializeTaskState,
    TResult Function(_DeleteProjectSuccess value)? deleteProjectSuccess,
    TResult Function(_DeleteProjectFailure value)? deleteProjectFailure,
    TResult Function(_DeleteTaskSuccess value)? deleteTaskSuccess,
    TResult Function(_DeleteTaskFailure value)? deleteTaskFailure,
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (deleteProjectFailure != null) {
      return deleteProjectFailure(this);
    }
    return orElse();
  }
}

abstract class _DeleteProjectFailure implements ProjectActorState {
  const factory _DeleteProjectFailure(final String failureException) =
      _$_DeleteProjectFailure;

  String get failureException;
  @JsonKey(ignore: true)
  _$$_DeleteProjectFailureCopyWith<_$_DeleteProjectFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DeleteTaskSuccessCopyWith<$Res> {
  factory _$$_DeleteTaskSuccessCopyWith(_$_DeleteTaskSuccess value,
          $Res Function(_$_DeleteTaskSuccess) then) =
      __$$_DeleteTaskSuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_DeleteTaskSuccessCopyWithImpl<$Res>
    extends _$ProjectActorStateCopyWithImpl<$Res, _$_DeleteTaskSuccess>
    implements _$$_DeleteTaskSuccessCopyWith<$Res> {
  __$$_DeleteTaskSuccessCopyWithImpl(
      _$_DeleteTaskSuccess _value, $Res Function(_$_DeleteTaskSuccess) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_DeleteTaskSuccess implements _DeleteTaskSuccess {
  const _$_DeleteTaskSuccess();

  @override
  String toString() {
    return 'ProjectActorState.deleteTaskSuccess()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_DeleteTaskSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reInitializeProjectState,
    required TResult Function() reInitializeTaskState,
    required TResult Function() deleteProjectSuccess,
    required TResult Function(String failureException) deleteProjectFailure,
    required TResult Function() deleteTaskSuccess,
    required TResult Function(String failureException) deleteTaskFailure,
    required TResult Function() initial,
  }) {
    return deleteTaskSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reInitializeProjectState,
    TResult? Function()? reInitializeTaskState,
    TResult? Function()? deleteProjectSuccess,
    TResult? Function(String failureException)? deleteProjectFailure,
    TResult? Function()? deleteTaskSuccess,
    TResult? Function(String failureException)? deleteTaskFailure,
    TResult? Function()? initial,
  }) {
    return deleteTaskSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reInitializeProjectState,
    TResult Function()? reInitializeTaskState,
    TResult Function()? deleteProjectSuccess,
    TResult Function(String failureException)? deleteProjectFailure,
    TResult Function()? deleteTaskSuccess,
    TResult Function(String failureException)? deleteTaskFailure,
    TResult Function()? initial,
    required TResult orElse(),
  }) {
    if (deleteTaskSuccess != null) {
      return deleteTaskSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ReInitializeProjectState value)
        reInitializeProjectState,
    required TResult Function(_ReInitializeTaskState value)
        reInitializeTaskState,
    required TResult Function(_DeleteProjectSuccess value) deleteProjectSuccess,
    required TResult Function(_DeleteProjectFailure value) deleteProjectFailure,
    required TResult Function(_DeleteTaskSuccess value) deleteTaskSuccess,
    required TResult Function(_DeleteTaskFailure value) deleteTaskFailure,
    required TResult Function(_Initial value) initial,
  }) {
    return deleteTaskSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ReInitializeProjectState value)?
        reInitializeProjectState,
    TResult? Function(_ReInitializeTaskState value)? reInitializeTaskState,
    TResult? Function(_DeleteProjectSuccess value)? deleteProjectSuccess,
    TResult? Function(_DeleteProjectFailure value)? deleteProjectFailure,
    TResult? Function(_DeleteTaskSuccess value)? deleteTaskSuccess,
    TResult? Function(_DeleteTaskFailure value)? deleteTaskFailure,
    TResult? Function(_Initial value)? initial,
  }) {
    return deleteTaskSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ReInitializeProjectState value)? reInitializeProjectState,
    TResult Function(_ReInitializeTaskState value)? reInitializeTaskState,
    TResult Function(_DeleteProjectSuccess value)? deleteProjectSuccess,
    TResult Function(_DeleteProjectFailure value)? deleteProjectFailure,
    TResult Function(_DeleteTaskSuccess value)? deleteTaskSuccess,
    TResult Function(_DeleteTaskFailure value)? deleteTaskFailure,
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (deleteTaskSuccess != null) {
      return deleteTaskSuccess(this);
    }
    return orElse();
  }
}

abstract class _DeleteTaskSuccess implements ProjectActorState {
  const factory _DeleteTaskSuccess() = _$_DeleteTaskSuccess;
}

/// @nodoc
abstract class _$$_DeleteTaskFailureCopyWith<$Res> {
  factory _$$_DeleteTaskFailureCopyWith(_$_DeleteTaskFailure value,
          $Res Function(_$_DeleteTaskFailure) then) =
      __$$_DeleteTaskFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({String failureException});
}

/// @nodoc
class __$$_DeleteTaskFailureCopyWithImpl<$Res>
    extends _$ProjectActorStateCopyWithImpl<$Res, _$_DeleteTaskFailure>
    implements _$$_DeleteTaskFailureCopyWith<$Res> {
  __$$_DeleteTaskFailureCopyWithImpl(
      _$_DeleteTaskFailure _value, $Res Function(_$_DeleteTaskFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failureException = null,
  }) {
    return _then(_$_DeleteTaskFailure(
      null == failureException
          ? _value.failureException
          : failureException // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_DeleteTaskFailure implements _DeleteTaskFailure {
  const _$_DeleteTaskFailure(this.failureException);

  @override
  final String failureException;

  @override
  String toString() {
    return 'ProjectActorState.deleteTaskFailure(failureException: $failureException)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeleteTaskFailure &&
            (identical(other.failureException, failureException) ||
                other.failureException == failureException));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failureException);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeleteTaskFailureCopyWith<_$_DeleteTaskFailure> get copyWith =>
      __$$_DeleteTaskFailureCopyWithImpl<_$_DeleteTaskFailure>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reInitializeProjectState,
    required TResult Function() reInitializeTaskState,
    required TResult Function() deleteProjectSuccess,
    required TResult Function(String failureException) deleteProjectFailure,
    required TResult Function() deleteTaskSuccess,
    required TResult Function(String failureException) deleteTaskFailure,
    required TResult Function() initial,
  }) {
    return deleteTaskFailure(failureException);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reInitializeProjectState,
    TResult? Function()? reInitializeTaskState,
    TResult? Function()? deleteProjectSuccess,
    TResult? Function(String failureException)? deleteProjectFailure,
    TResult? Function()? deleteTaskSuccess,
    TResult? Function(String failureException)? deleteTaskFailure,
    TResult? Function()? initial,
  }) {
    return deleteTaskFailure?.call(failureException);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reInitializeProjectState,
    TResult Function()? reInitializeTaskState,
    TResult Function()? deleteProjectSuccess,
    TResult Function(String failureException)? deleteProjectFailure,
    TResult Function()? deleteTaskSuccess,
    TResult Function(String failureException)? deleteTaskFailure,
    TResult Function()? initial,
    required TResult orElse(),
  }) {
    if (deleteTaskFailure != null) {
      return deleteTaskFailure(failureException);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ReInitializeProjectState value)
        reInitializeProjectState,
    required TResult Function(_ReInitializeTaskState value)
        reInitializeTaskState,
    required TResult Function(_DeleteProjectSuccess value) deleteProjectSuccess,
    required TResult Function(_DeleteProjectFailure value) deleteProjectFailure,
    required TResult Function(_DeleteTaskSuccess value) deleteTaskSuccess,
    required TResult Function(_DeleteTaskFailure value) deleteTaskFailure,
    required TResult Function(_Initial value) initial,
  }) {
    return deleteTaskFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ReInitializeProjectState value)?
        reInitializeProjectState,
    TResult? Function(_ReInitializeTaskState value)? reInitializeTaskState,
    TResult? Function(_DeleteProjectSuccess value)? deleteProjectSuccess,
    TResult? Function(_DeleteProjectFailure value)? deleteProjectFailure,
    TResult? Function(_DeleteTaskSuccess value)? deleteTaskSuccess,
    TResult? Function(_DeleteTaskFailure value)? deleteTaskFailure,
    TResult? Function(_Initial value)? initial,
  }) {
    return deleteTaskFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ReInitializeProjectState value)? reInitializeProjectState,
    TResult Function(_ReInitializeTaskState value)? reInitializeTaskState,
    TResult Function(_DeleteProjectSuccess value)? deleteProjectSuccess,
    TResult Function(_DeleteProjectFailure value)? deleteProjectFailure,
    TResult Function(_DeleteTaskSuccess value)? deleteTaskSuccess,
    TResult Function(_DeleteTaskFailure value)? deleteTaskFailure,
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (deleteTaskFailure != null) {
      return deleteTaskFailure(this);
    }
    return orElse();
  }
}

abstract class _DeleteTaskFailure implements ProjectActorState {
  const factory _DeleteTaskFailure(final String failureException) =
      _$_DeleteTaskFailure;

  String get failureException;
  @JsonKey(ignore: true)
  _$$_DeleteTaskFailureCopyWith<_$_DeleteTaskFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$ProjectActorStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  _$_Initial();

  @override
  String toString() {
    return 'ProjectActorState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reInitializeProjectState,
    required TResult Function() reInitializeTaskState,
    required TResult Function() deleteProjectSuccess,
    required TResult Function(String failureException) deleteProjectFailure,
    required TResult Function() deleteTaskSuccess,
    required TResult Function(String failureException) deleteTaskFailure,
    required TResult Function() initial,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reInitializeProjectState,
    TResult? Function()? reInitializeTaskState,
    TResult? Function()? deleteProjectSuccess,
    TResult? Function(String failureException)? deleteProjectFailure,
    TResult? Function()? deleteTaskSuccess,
    TResult? Function(String failureException)? deleteTaskFailure,
    TResult? Function()? initial,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reInitializeProjectState,
    TResult Function()? reInitializeTaskState,
    TResult Function()? deleteProjectSuccess,
    TResult Function(String failureException)? deleteProjectFailure,
    TResult Function()? deleteTaskSuccess,
    TResult Function(String failureException)? deleteTaskFailure,
    TResult Function()? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ReInitializeProjectState value)
        reInitializeProjectState,
    required TResult Function(_ReInitializeTaskState value)
        reInitializeTaskState,
    required TResult Function(_DeleteProjectSuccess value) deleteProjectSuccess,
    required TResult Function(_DeleteProjectFailure value) deleteProjectFailure,
    required TResult Function(_DeleteTaskSuccess value) deleteTaskSuccess,
    required TResult Function(_DeleteTaskFailure value) deleteTaskFailure,
    required TResult Function(_Initial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ReInitializeProjectState value)?
        reInitializeProjectState,
    TResult? Function(_ReInitializeTaskState value)? reInitializeTaskState,
    TResult? Function(_DeleteProjectSuccess value)? deleteProjectSuccess,
    TResult? Function(_DeleteProjectFailure value)? deleteProjectFailure,
    TResult? Function(_DeleteTaskSuccess value)? deleteTaskSuccess,
    TResult? Function(_DeleteTaskFailure value)? deleteTaskFailure,
    TResult? Function(_Initial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ReInitializeProjectState value)? reInitializeProjectState,
    TResult Function(_ReInitializeTaskState value)? reInitializeTaskState,
    TResult Function(_DeleteProjectSuccess value)? deleteProjectSuccess,
    TResult Function(_DeleteProjectFailure value)? deleteProjectFailure,
    TResult Function(_DeleteTaskSuccess value)? deleteTaskSuccess,
    TResult Function(_DeleteTaskFailure value)? deleteTaskFailure,
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ProjectActorState {
  factory _Initial() = _$_Initial;
}
