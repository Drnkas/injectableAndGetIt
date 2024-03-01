// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:geti_injectable/datasources/auth_local_datasource.dart' as _i7;
import 'package:geti_injectable/datasources/auth_remote_datasource.dart' as _i8;
import 'package:geti_injectable/injection/injection.dart' as _i9;
import 'package:geti_injectable/managers/session_manager.dart' as _i5;
import 'package:geti_injectable/repositories/auth_repository.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i6;

const String _firebase = 'firebase';
const String _test = 'test';
const String _node = 'node';

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i3.AuthRepository>(
      () => _i3.FirebaseAuthRepository(),
      registerFor: {_firebase},
    );
    gh.factory<_i3.AuthRepository>(
      () => _i3.MockAuthRepository(),
      registerFor: {_test},
    );
    gh.singleton<_i4.Dio>(registerModule.dio);
    gh.lazySingleton<_i5.SessionManager>(
        () => _i5.SessionManager(gh<_i3.AuthRepository>()));
    await gh.singletonAsync<_i6.SharedPreferences>(
      () => registerModule.sharedPreferences,
      preResolve: true,
    );
    gh.factory<_i7.AuthLocalDatasource>(
        () => _i7.AuthLocalDatasource(gh<_i6.SharedPreferences>()));
    gh.factory<_i8.AuthRemoteDatasource>(
        () => _i8.AuthRemoteDatasource(gh<_i4.Dio>()));
    gh.factory<_i3.AuthRepository>(
      () => _i3.NodeAuthRepository(
        gh<_i8.AuthRemoteDatasource>(),
        gh<_i7.AuthLocalDatasource>(),
      ),
      registerFor: {_node},
    );
    return this;
  }
}

class _$RegisterModule extends _i9.RegisterModule {}
