import 'package:flutter/material.dart';
import 'package:flutter_mvvm_getx/modules/login/view_models/login_viewModel.dart';
import 'package:flutter_mvvm_getx/utils/constants/main_theme.dart';
import 'package:flutter_mvvm_getx/views/global_widgets/customized_button.dart';
import 'package:get/get.dart';

class LoginSubmitButton extends StatelessWidget {
  const LoginSubmitButton({required this.width, required this.height});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return GetX<LoginViewModel>(
      autoRemove: true,
      builder: (controller) => controller.uiState.value.when(
          init: () => CustomizedButton(
                width: width,
                height: height,
                isActiveButton: controller.buttonState.value ? true : false,
                onPressed: controller.buttonState.value == true
                    ? () {
                        controller.loginRequest();
                      }
                    : null,
                title: 'confirm'.tr,
                fontSize: 16,
                buttonColor: Theme.of(context).colorScheme.primary,
              ),
          loading: () => SizedBox(
              height: 24,
              width: 24,
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.primary,
              )),
          success: (data) => CustomizedButton(
                width: width,
                height: height,
                isActiveButton: controller.buttonState.value ? true : false,
                onPressed: controller.buttonState.value == true
                    ? () {
                      }
                    : null,
                title: 'confirm'.tr,
                fontSize: 16,
            iconWidget: Icon(Icons.verified,color: Theme.of(context).colorScheme.onPrimary,).paddingSymmetric(horizontal: 8.0),
                buttonColor: MainThemes.colorConfirm,
              ),
          error: (error) => CustomizedButton(
            width: width,
            height: height,
            isActiveButton: controller.buttonState.value ? true : false,
            onPressed: controller.buttonState.value == true
                ? () {
              controller.loginRequest();

            }
                : null,
            title: 'retry'.tr,
            fontSize: 16,
            iconWidget: Icon(Icons.refresh,color: Theme.of(context).colorScheme.onError,).paddingSymmetric(horizontal: 8.0),
            buttonColor: Theme.of(context).colorScheme.error,
          )),
    );
  }
}
