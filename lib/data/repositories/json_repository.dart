import 'package:flutter_mvvm_getx/core/models/user.dart';
import 'package:flutter_mvvm_getx/core/params/find_friend_params.dart';
import 'package:flutter_mvvm_getx/core/params/search_email_params.dart';

abstract class JsonRepository {
  Future<List<User>> getUserList();
  Future<User> getUserInfo();
  Future<User?> loginRequest({required SearchEmailParams params});
  Future<User?> findFriend({required FindFriendParams params});
}
