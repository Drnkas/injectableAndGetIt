import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';

@injectable
class AuthLocalDatasource {

  AuthLocalDatasource(this.sharedPreferences);

  final SharedPreferences sharedPreferences;

  User? getCurrentUser() {
    //faz a chamada no FlutterSecureStorage
    return User('Teste 2');
  }

}