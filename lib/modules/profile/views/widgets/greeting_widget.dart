import 'package:flutter/material.dart';



import 'package:flutter/material.dart';
import 'package:flutter_mvvm_getx/core/models/user.dart';
import 'package:flutter_mvvm_getx/views/global_widgets/widgets/shimmer_list_tile.dart';
import 'package:flutter_mvvm_getx/modules/profile/view_models/profile_viewModel.dart';
import 'package:flutter_mvvm_getx/modules/profile/views/widgets/listView_hrz_shimmer_friendList.dart';
import 'package:flutter_mvvm_getx/utils/constants/main_theme.dart';
import 'package:get/get.dart';

class GreetingWidget extends StatelessWidget {
  const GreetingWidget({
    Key? key,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (ProfileViewModel controller) => Container(
        margin: EdgeInsets.all(16),
          height: 200,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.8),
            border: Border.all(
                color: Theme.of(context).colorScheme.primary,
                width: 2.0),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
          child: controller.uiState.value.when(
            init: () => const Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                )),
            loading: () =>
            const Center(child: ShimmerListTile()),
            success: (data) => GreetingTitleWidget(user: data[0]),
            error: (error) => const SizedBox.shrink(),
          )),
    );
  }
}


//
// class GreetingWidget extends StatelessWidget {
//   const GreetingWidget({
//     Key? key,
//     required this.greeting,
//   }) : super(key: key);
//   final String? greeting;
//
//   @override
//   Widget build(BuildContext context) {
//     return GreetingTitleWidget(greeting: greeting);
//   }
// }

class GreetingTitleWidget extends StatelessWidget {
  const GreetingTitleWidget({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User? user;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        user?.greeting ?? '',
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onPrimary, fontSize: 24),
      ),
    );
  }
}
