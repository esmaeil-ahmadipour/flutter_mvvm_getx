import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_mvvm_getx/core/models/user.dart';
import 'package:flutter_mvvm_getx/core/params/find_friend_params.dart';
import 'package:flutter_mvvm_getx/core/params/search_email_params.dart';
import 'package:flutter_mvvm_getx/data/repositories/json_repository.dart';
import 'package:flutter_mvvm_getx/utils/constants/main_values.dart';

class JsonRepositoryImpl implements JsonRepository {
  @override
  Future<User> getUserInfo() {
    // TODO: implement getUserInfo
    throw UnimplementedError();
  }

  @override
  Future<List<User>> getUserList() async {
    List<User> _userList = <User>[];
    List<dynamic> _items =
        await json.decode(await rootBundle.loadString(MainValues.jsonFile));
    await Future.delayed(const Duration(seconds: 5), () {}).whenComplete(() {
      // throw Exception("ERROR ...");
      for (var item in _items) {
        _userList.add(User.fromJson(item as Map<String, dynamic>));
      }
    });
    return _userList;
  }

  @override
  Future<User> loginRequest({SearchEmailParams? params}) async {
    User? user;
    List<dynamic> _items =
        await json.decode(await rootBundle.loadString(MainValues.jsonFile));
    await Future.delayed(const Duration(seconds: 5), () {}).whenComplete(() {
      // throw Exception("ERROR ...");
      for (var item in _items) {
        print("item!:${item.toString()}");

        if (params!.email ==
            User.fromJson(item as Map<String, dynamic>).email) {
          user = User.fromJson(item as Map<String, dynamic>);
        }
        // _userList.add(User.fromJson(item as Map<String, dynamic>));
      }
    });
    return user!;
  }

  @override
  Future<User?> findFriend({FindFriendParams? params}) async {
    User? user;
    List<dynamic> _items =
    await json.decode(await rootBundle.loadString(MainValues.jsonFile));
    await Future.delayed(const Duration(seconds: 5), () {}).whenComplete(() {
      // throw Exception("ERROR ...");
      for (var item in _items) {
        print("=+>${item.toString()}");
        print("params!.guid=+>${params!.guid.toString()}");
        if (params.guid ==
            User.fromJson(item as Map<String, dynamic>).guid) {
          user = User.fromJson(item as Map<String, dynamic>);
          print("User.fromJson=+>${user!.guid.toString()}");
          print("User.fromJson=+>${user!.name.toString()}");

        }
      }
    });
    return user!;
  }
}
