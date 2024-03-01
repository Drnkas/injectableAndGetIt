import 'package:geti_injectable/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

import '../models/user.dart';

//Responsável por tratar qual é o usuário atual
@lazySingleton
class SessionManager {

  SessionManager(this.authRepository){
    print('Construção do session manager');
    _getCurrentUser();
  }

  final AuthRepository authRepository;

  User? user;

  void _getCurrentUser() {
    user = authRepository.getCurrentUser();
  }
}