import 'package:flutter_mvvm_getx/core/models/user.dart';
import 'package:flutter_mvvm_getx/core/params/search_email_params.dart';

abstract class JsonRepository {
  Future<List<User>> getUserList();
  Future<User> getUserInfo();
  Future<User?> loginRequest({required SearchEmailParams params});
}
