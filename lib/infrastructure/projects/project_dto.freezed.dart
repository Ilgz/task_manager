// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProjectDto _$ProjectDtoFromJson(Map<String, dynamic> json) {
  return _ProjectDto.fromJson(json);
}

/// @nodoc
mixin _$ProjectDto {
  String get projectName => throw _privateConstructorUsedError;
  bool get isPublic => throw _privateConstructorUsedError;
  @ServerTimestampConverter()
  Timestamp get date => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  DocumentReference<Object?>? get owner => throw _privateConstructorUsedError;
  List<User> get members => throw _privateConstructorUsedError;
  List<TaskDto> get tasks => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectDtoCopyWith<ProjectDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectDtoCopyWith<$Res> {
  factory $ProjectDtoCopyWith(
          ProjectDto value, $Res Function(ProjectDto) then) =
      _$ProjectDtoCopyWithImpl<$Res, ProjectDto>;
  @useResult
  $Res call(
      {String projectName,
      bool isPublic,
      @ServerTimestampConverter() Timestamp date,
      @JsonKey(ignore: true) DocumentReference<Object?>? owner,
      List<User> members,
      List<TaskDto> tasks});
}

/// @nodoc
class _$ProjectDtoCopyWithImpl<$Res, $Val extends ProjectDto>
    implements $ProjectDtoCopyWith<$Res> {
  _$ProjectDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectName = null,
    Object? isPublic = null,
    Object? date = null,
    Object? owner = freezed,
    Object? members = null,
    Object? tasks = null,
  }) {
    return _then(_value.copyWith(
      projectName: null == projectName
          ? _value.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String,
      isPublic: null == isPublic
          ? _value.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as bool,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      owner: freezed == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Object?>?,
      members: null == members
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<User>,
      tasks: null == tasks
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TaskDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProjectDtoCopyWith<$Res>
    implements $ProjectDtoCopyWith<$Res> {
  factory _$$_ProjectDtoCopyWith(
          _$_ProjectDto value, $Res Function(_$_ProjectDto) then) =
      __$$_ProjectDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String projectName,
      bool isPublic,
      @ServerTimestampConverter() Timestamp date,
      @JsonKey(ignore: true) DocumentReference<Object?>? owner,
      List<User> members,
      List<TaskDto> tasks});
}

/// @nodoc
class __$$_ProjectDtoCopyWithImpl<$Res>
    extends _$ProjectDtoCopyWithImpl<$Res, _$_ProjectDto>
    implements _$$_ProjectDtoCopyWith<$Res> {
  __$$_ProjectDtoCopyWithImpl(
      _$_ProjectDto _value, $Res Function(_$_ProjectDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectName = null,
    Object? isPublic = null,
    Object? date = null,
    Object? owner = freezed,
    Object? members = null,
    Object? tasks = null,
  }) {
    return _then(_$_ProjectDto(
      projectName: null == projectName
          ? _value.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String,
      isPublic: null == isPublic
          ? _value.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as bool,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      owner: freezed == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Object?>?,
      members: null == members
          ? _value._members
          : members // ignore: cast_nullable_to_non_nullable
              as List<User>,
      tasks: null == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TaskDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProjectDto implements _ProjectDto {
  _$_ProjectDto(
      {required this.projectName,
      required this.isPublic,
      @ServerTimestampConverter() required this.date,
      @JsonKey(ignore: true) this.owner,
      required final List<User> members,
      required final List<TaskDto> tasks})
      : _members = members,
        _tasks = tasks;

  factory _$_ProjectDto.fromJson(Map<String, dynamic> json) =>
      _$$_ProjectDtoFromJson(json);

  @override
  final String projectName;
  @override
  final bool isPublic;
  @override
  @ServerTimestampConverter()
  final Timestamp date;
  @override
  @JsonKey(ignore: true)
  final DocumentReference<Object?>? owner;
  final List<User> _members;
  @override
  List<User> get members {
    if (_members is EqualUnmodifiableListView) return _members;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_members);
  }

  final List<TaskDto> _tasks;
  @override
  List<TaskDto> get tasks {
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  @override
  String toString() {
    return 'ProjectDto(projectName: $projectName, isPublic: $isPublic, date: $date, owner: $owner, members: $members, tasks: $tasks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProjectDto &&
            (identical(other.projectName, projectName) ||
                other.projectName == projectName) &&
            (identical(other.isPublic, isPublic) ||
                other.isPublic == isPublic) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.owner, owner) || other.owner == owner) &&
            const DeepCollectionEquality().equals(other._members, _members) &&
            const DeepCollectionEquality().equals(other._tasks, _tasks));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      projectName,
      isPublic,
      date,
      owner,
      const DeepCollectionEquality().hash(_members),
      const DeepCollectionEquality().hash(_tasks));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProjectDtoCopyWith<_$_ProjectDto> get copyWith =>
      __$$_ProjectDtoCopyWithImpl<_$_ProjectDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProjectDtoToJson(
      this,
    );
  }
}

abstract class _ProjectDto implements ProjectDto {
  factory _ProjectDto(
      {required final String projectName,
      required final bool isPublic,
      @ServerTimestampConverter() required final Timestamp date,
      @JsonKey(ignore: true) final DocumentReference<Object?>? owner,
      required final List<User> members,
      required final List<TaskDto> tasks}) = _$_ProjectDto;

  factory _ProjectDto.fromJson(Map<String, dynamic> json) =
      _$_ProjectDto.fromJson;

  @override
  String get projectName;
  @override
  bool get isPublic;
  @override
  @ServerTimestampConverter()
  Timestamp get date;
  @override
  @JsonKey(ignore: true)
  DocumentReference<Object?>? get owner;
  @override
  List<User> get members;
  @override
  List<TaskDto> get tasks;
  @override
  @JsonKey(ignore: true)
  _$$_ProjectDtoCopyWith<_$_ProjectDto> get copyWith =>
      throw _privateConstructorUsedError;
}

TaskDto _$TaskDtoFromJson(Map<String, dynamic> json) {
  return _TaskDto.fromJson(json);
}

/// @nodoc
mixin _$TaskDto {
  String get name => throw _privateConstructorUsedError;
  bool get isDone => throw _privateConstructorUsedError;
  @ServerTimestampConverter()
  Timestamp get date => throw _privateConstructorUsedError;
  String get responsibleUser => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskDtoCopyWith<TaskDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskDtoCopyWith<$Res> {
  factory $TaskDtoCopyWith(TaskDto value, $Res Function(TaskDto) then) =
      _$TaskDtoCopyWithImpl<$Res, TaskDto>;
  @useResult
  $Res call(
      {String name,
      bool isDone,
      @ServerTimestampConverter() Timestamp date,
      String responsibleUser});
}

/// @nodoc
class _$TaskDtoCopyWithImpl<$Res, $Val extends TaskDto>
    implements $TaskDtoCopyWith<$Res> {
  _$TaskDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? isDone = null,
    Object? date = null,
    Object? responsibleUser = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isDone: null == isDone
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      responsibleUser: null == responsibleUser
          ? _value.responsibleUser
          : responsibleUser // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TaskDtoCopyWith<$Res> implements $TaskDtoCopyWith<$Res> {
  factory _$$_TaskDtoCopyWith(
          _$_TaskDto value, $Res Function(_$_TaskDto) then) =
      __$$_TaskDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      bool isDone,
      @ServerTimestampConverter() Timestamp date,
      String responsibleUser});
}

/// @nodoc
class __$$_TaskDtoCopyWithImpl<$Res>
    extends _$TaskDtoCopyWithImpl<$Res, _$_TaskDto>
    implements _$$_TaskDtoCopyWith<$Res> {
  __$$_TaskDtoCopyWithImpl(_$_TaskDto _value, $Res Function(_$_TaskDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? isDone = null,
    Object? date = null,
    Object? responsibleUser = null,
  }) {
    return _then(_$_TaskDto(
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      null == isDone
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
      null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      null == responsibleUser
          ? _value.responsibleUser
          : responsibleUser // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TaskDto implements _TaskDto {
  _$_TaskDto(this.name, this.isDone, @ServerTimestampConverter() this.date,
      this.responsibleUser);

  factory _$_TaskDto.fromJson(Map<String, dynamic> json) =>
      _$$_TaskDtoFromJson(json);

  @override
  final String name;
  @override
  final bool isDone;
  @override
  @ServerTimestampConverter()
  final Timestamp date;
  @override
  final String responsibleUser;

  @override
  String toString() {
    return 'TaskDto(name: $name, isDone: $isDone, date: $date, responsibleUser: $responsibleUser)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TaskDto &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isDone, isDone) || other.isDone == isDone) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.responsibleUser, responsibleUser) ||
                other.responsibleUser == responsibleUser));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, isDone, date, responsibleUser);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TaskDtoCopyWith<_$_TaskDto> get copyWith =>
      __$$_TaskDtoCopyWithImpl<_$_TaskDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TaskDtoToJson(
      this,
    );
  }
}

abstract class _TaskDto implements TaskDto {
  factory _TaskDto(
      final String name,
      final bool isDone,
      @ServerTimestampConverter() final Timestamp date,
      final String responsibleUser) = _$_TaskDto;

  factory _TaskDto.fromJson(Map<String, dynamic> json) = _$_TaskDto.fromJson;

  @override
  String get name;
  @override
  bool get isDone;
  @override
  @ServerTimestampConverter()
  Timestamp get date;
  @override
  String get responsibleUser;
  @override
  @JsonKey(ignore: true)
  _$$_TaskDtoCopyWith<_$_TaskDto> get copyWith =>
      throw _privateConstructorUsedError;
}
