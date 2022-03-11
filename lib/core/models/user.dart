import 'package:flutter_mvvm_getx/core/models/friend.dart';
import 'package:freezed_annotation/freezed_annotation.dart' ;
part 'user.g.dart';
part 'user.freezed.dart';

@freezed
class User with _$User{
  const User._();
  const factory User({

    required String? guid,
    required bool? isOwner,
    required String? balance,
    required String? picture,
    required int? age,
    required String? eyeColor,
    required String? name,
    required String? gender,
    required String? company,
    required String? email,
    required String? phone,
    required String? address,
    required String? about,
    required String? registered,
    required double? latitude,
    required double? longitude,
    required List<String>? tags,
    required List<Friend>? friends,
    required String? greeting,
    required String? favoriteFruit,

  }) = _User;
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
 }