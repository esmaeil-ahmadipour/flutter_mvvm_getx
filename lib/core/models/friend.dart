import 'package:freezed_annotation/freezed_annotation.dart' ;
part 'friend.g.dart';
part 'friend.freezed.dart';

@freezed
class Friend with _$Friend {
  const Friend._();
  const factory Friend({
    required int? id,
    required String? guid,
    required String? name,
  }) = _Friend;
  factory Friend.fromJson(Map<String, dynamic> json) => _$FriendFromJson(json);
 }