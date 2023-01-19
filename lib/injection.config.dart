// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:task_manager/application/auth/auth_bloc.dart' as _i11;
import 'package:task_manager/application/auth/sign_in_form/sign_in_form_bloc.dart'
    as _i10;
import 'package:task_manager/application/projects/project_watcher/project_watcher_bloc.dart'
    as _i9;
import 'package:task_manager/domain/auth/i_auth_facade.dart' as _i5;
import 'package:task_manager/domain/projects/i_project_repository.dart' as _i7;
import 'package:task_manager/infrastructure/auth/firebase_auth_facade.dart'
    as _i6;
import 'package:task_manager/infrastructure/core/firebase_injectable_module.dart'
    as _i12;
import 'package:task_manager/infrastructure/projects/project_repository.dart'
    as _i8;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final firebaseInjectableModule = _$FirebaseInjectableModule();
    gh.lazySingleton<_i3.FirebaseAuth>(
        () => firebaseInjectableModule.firebaseAuth);
    gh.lazySingleton<_i4.FirebaseFirestore>(
        () => firebaseInjectableModule.firebaseFirestore);
    gh.lazySingleton<_i5.IAuthFacade>(
        () => _i6.FirebaseAuthFacade(gh<_i3.FirebaseAuth>()));
    gh.lazySingleton<_i7.IProjectRepository>(
        () => _i8.ProjectRepository(gh<_i4.FirebaseFirestore>()));
    gh.factory<_i9.ProjectWatcherBloc>(
        () => _i9.ProjectWatcherBloc(gh<_i7.IProjectRepository>()));
    gh.factory<_i10.SignInFormBloc>(
        () => _i10.SignInFormBloc(gh<_i5.IAuthFacade>()));
    gh.factory<_i11.AuthBloc>(() => _i11.AuthBloc(gh<_i5.IAuthFacade>()));
    return this;
  }
}

class _$FirebaseInjectableModule extends _i12.FirebaseInjectableModule {}