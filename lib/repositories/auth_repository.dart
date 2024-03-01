import 'package:geti_injectable/datasources/auth_local_datasource.dart';
import 'package:geti_injectable/datasources/auth_remote_datasource.dart';
import 'package:injectable/injectable.dart';

import '../models/user.dart';


abstract class AuthRepository {
  User? getCurrentUser();
}

//Responsável por gerenciar os dados de um ou mais datasource
@Injectable(as: AuthRepository, env: ['node'])
class NodeAuthRepository implements AuthRepository{

  NodeAuthRepository(this.remoteDatasource, this.localDatasource);

  final AuthRemoteDatasource remoteDatasource;
  final AuthLocalDatasource localDatasource;

  @override
  User? getCurrentUser(){
    User? user = localDatasource.getCurrentUser();
    user ??= remoteDatasource.getCurrentUser();
    return user;
  }

}

@Injectable(as: AuthRepository, env: ['firebase'])
class FirebaseAuthRepository implements AuthRepository {
  @override
  User? getCurrentUser() {
  }
}

@Injectable(as: AuthRepository, env: ['test'])
class MockAuthRepository implements AuthRepository {
  @override
  User? getCurrentUser() {
    return User('teste');
  }
}