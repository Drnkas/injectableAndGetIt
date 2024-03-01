import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:geti_injectable/datasources/auth_local_datasource.dart';
import 'package:geti_injectable/datasources/auth_remote_datasource.dart';
import 'package:geti_injectable/injection/injection.config.dart';
import 'package:geti_injectable/managers/session_manager.dart';
import 'package:geti_injectable/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

//variável global
final getIt = GetIt.I;

/*void configureDependencies() {

  debugPrint('Incio da configuração de dependencias');

  //Singleton - mantém a mesma instância
  // GetIt.I.registerSingleton(SessionManager());

  //Lazy singleton
  //GetIt.I.registerLazySingleton(() => SessionManager());

  //Factory - cria uma nova instância

  getIt.registerSingleton(Dio());
  getIt.registerFactory(() => AuthRemoteDatasource(getIt()));
  getIt.registerFactory(() => AuthLocalDatasource());
  getIt.registerFactory<AuthRepository>(() => NodeAuthRepository(getIt(), getIt()));
  getIt.registerSingleton(SessionManager(getIt()));

  debugPrint('Fim da configuração de dependencias');

}*/



@InjectableInit()
Future<void> configureDependencies() => getIt.init(environment: 'node');

@module
abstract class RegisterModule {

  @singleton
  Dio get dio => Dio();

  @preResolve
  @singleton
  Future<SharedPreferences> get sharedPreferences => SharedPreferences.getInstance();
}