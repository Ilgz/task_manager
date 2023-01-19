// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Project {
  ProjectName get taskName => throw _privateConstructorUsedError;
  bool get isPublic => throw _privateConstructorUsedError;
  DocumentReference<Object?> get owner => throw _privateConstructorUsedError;
  List<User> get members => throw _privateConstructorUsedError;
  List<Task> get tasks => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProjectCopyWith<Project> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectCopyWith<$Res> {
  factory $ProjectCopyWith(Project value, $Res Function(Project) then) =
      _$ProjectCopyWithImpl<$Res, Project>;
  @useResult
  $Res call(
      {ProjectName taskName,
      bool isPublic,
      DocumentReference<Object?> owner,
      List<User> members,
      List<Task> tasks});
}

/// @nodoc
class _$ProjectCopyWithImpl<$Res, $Val extends Project>
    implements $ProjectCopyWith<$Res> {
  _$ProjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskName = null,
    Object? isPublic = null,
    Object? owner = null,
    Object? members = null,
    Object? tasks = null,
  }) {
    return _then(_value.copyWith(
      taskName: null == taskName
          ? _value.taskName
          : taskName // ignore: cast_nullable_to_non_nullable
              as ProjectName,
      isPublic: null == isPublic
          ? _value.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as bool,
      owner: null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Object?>,
      members: null == members
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<User>,
      tasks: null == tasks
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProjectCopyWith<$Res> implements $ProjectCopyWith<$Res> {
  factory _$$_ProjectCopyWith(
          _$_Project value, $Res Function(_$_Project) then) =
      __$$_ProjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ProjectName taskName,
      bool isPublic,
      DocumentReference<Object?> owner,
      List<User> members,
      List<Task> tasks});
}

/// @nodoc
class __$$_ProjectCopyWithImpl<$Res>
    extends _$ProjectCopyWithImpl<$Res, _$_Project>
    implements _$$_ProjectCopyWith<$Res> {
  __$$_ProjectCopyWithImpl(_$_Project _value, $Res Function(_$_Project) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskName = null,
    Object? isPublic = null,
    Object? owner = null,
    Object? members = null,
    Object? tasks = null,
  }) {
    return _then(_$_Project(
      null == taskName
          ? _value.taskName
          : taskName // ignore: cast_nullable_to_non_nullable
              as ProjectName,
      null == isPublic
          ? _value.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as bool,
      null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Object?>,
      null == members
          ? _value._members
          : members // ignore: cast_nullable_to_non_nullable
              as List<User>,
      null == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
    ));
  }
}

/// @nodoc

class _$_Project implements _Project {
  _$_Project(this.taskName, this.isPublic, this.owner, final List<User> members,
      final List<Task> tasks)
      : _members = members,
        _tasks = tasks;

  @override
  final ProjectName taskName;
  @override
  final bool isPublic;
  @override
  final DocumentReference<Object?> owner;
  final List<User> _members;
  @override
  List<User> get members {
    if (_members is EqualUnmodifiableListView) return _members;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_members);
  }

  final List<Task> _tasks;
  @override
  List<Task> get tasks {
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  @override
  String toString() {
    return 'Project(taskName: $taskName, isPublic: $isPublic, owner: $owner, members: $members, tasks: $tasks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Project &&
            (identical(other.taskName, taskName) ||
                other.taskName == taskName) &&
            (identical(other.isPublic, isPublic) ||
                other.isPublic == isPublic) &&
            (identical(other.owner, owner) || other.owner == owner) &&
            const DeepCollectionEquality().equals(other._members, _members) &&
            const DeepCollectionEquality().equals(other._tasks, _tasks));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      taskName,
      isPublic,
      owner,
      const DeepCollectionEquality().hash(_members),
      const DeepCollectionEquality().hash(_tasks));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProjectCopyWith<_$_Project> get copyWith =>
      __$$_ProjectCopyWithImpl<_$_Project>(this, _$identity);
}

abstract class _Project implements Project {
  factory _Project(
      final ProjectName taskName,
      final bool isPublic,
      final DocumentReference<Object?> owner,
      final List<User> members,
      final List<Task> tasks) = _$_Project;

  @override
  ProjectName get taskName;
  @override
  bool get isPublic;
  @override
  DocumentReference<Object?> get owner;
  @override
  List<User> get members;
  @override
  List<Task> get tasks;
  @override
  @JsonKey(ignore: true)
  _$$_ProjectCopyWith<_$_Project> get copyWith =>
      throw _privateConstructorUsedError;
}
