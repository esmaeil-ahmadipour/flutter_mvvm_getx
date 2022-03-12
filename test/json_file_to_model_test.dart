import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_mvvm_getx/core/models/friend.dart';
import 'package:flutter_mvvm_getx/core/models/user.dart';
import 'package:flutter_mvvm_getx/utils/constants/main_values.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('parse json file', () {
    test(
      'should be success convert JsonFile to UserModelList',
      () async {
        // act
        bool? finalResult;
        List<dynamic> _items =
            await json.decode(await rootBundle.loadString(MainValues.jsonFile));
        await Future.delayed(const Duration(seconds: 1), () {})
            .whenComplete(() {
          for (var item in _items) {
            User _user = User.fromJson(item as Map<String, dynamic>);
            Map<String, dynamic> userToJson = _user.toJson();
            List<Friend> friendListInUserModel = <Friend>[];
            friendListInUserModel = _user.friends!;

            /// FiendModelList in UserModel !: need convert this List To Json ...
            if (friendListInUserModel.isNotEmpty) {
              List<Map<String, dynamic>> convertedFriendList = [];
              for (var i = 0; i < friendListInUserModel.length; ++i) {
                Friend friendConvertToJson = friendListInUserModel[i];
                Map<String, dynamic> convertedFriendToJson =
                    friendConvertToJson.toJson();
                convertedFriendList.add(convertedFriendToJson);
              }
              userToJson["friends"] = convertedFriendList;
            }
            /// Check items in JsonFile is Equal to UserModelList ..
            /// when find wrong item return false and fail test..
            if (userToJson.toString() == item.toString() &&
                (finalResult == null || finalResult == true)) {
              finalResult = true;
            } else {
              finalResult = false;
              return;
            }
          }
        });
        // assert
        expect(finalResult, true);
      },
    );
  });
}
