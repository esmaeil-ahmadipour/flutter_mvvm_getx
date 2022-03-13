import 'package:flutter/material.dart';
import 'package:flutter_mvvm_getx/core/models/user.dart';
import 'package:flutter_mvvm_getx/modules/main/views/widgets/user_list_view.dart';

class UserListView extends StatelessWidget {
  const UserListView({
    Key? key,
    required this.data,
  }) : super(key: key);

  final List<User> data;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemExtent: 120,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: UserListTile(user: data[index]),
          );
        });
  }
}
