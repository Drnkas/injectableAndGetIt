import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../models/user.dart';

//Responsável por comunicar com a API - google auth, backend
@injectable
class AuthRemoteDatasource {

  final Dio dio;

  AuthRemoteDatasource(this.dio);

  User? getCurrentUser() {
    //faz a chamada que busca os dados da API
    return User('Isabela Dranka');
  }

}
