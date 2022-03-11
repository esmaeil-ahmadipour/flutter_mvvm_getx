import 'package:flutter/material.dart';
import 'package:flutter_mvvm_getx/modules/main/views/widgets/shimmer_list_tile.dart';

class ShimmerListView extends StatelessWidget {
  const ShimmerListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemExtent: 120,
        itemCount: 20,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.all(8.0),
            child: ShimmerListTile(),
          );
        });
  }
}
