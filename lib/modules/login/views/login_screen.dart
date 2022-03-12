import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_getx/modules/login/view_models/login_viewModel.dart';
import 'package:flutter_mvvm_getx/modules/login/views/widgets/login_submit_button.dart';
import 'package:flutter_mvvm_getx/modules/login/views/widgets/text_form_email_login.dart';
import 'package:flutter_mvvm_getx/modules/login/views/widgets/text_form_password_login.dart';
import 'package:flutter_mvvm_getx/modules/splash/views/widgets/splash_title.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<LoginViewModel> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (LoginViewModel controller) => Scaffold(
        // backgroundColor: Theme.of(context).colorScheme.primary,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SplashTitle(
                title: 'app_name'.tr,
                padding: 16,
                color: Theme.of(context).colorScheme.primary,
              ),
              DelayedDisplay(
                slidingCurve: Curves.elasticInOut,
                delay: const Duration(milliseconds: 500),
                child: SplashTitle(
                        title: 'app_description'.tr,
                        padding: 32,
                        color: Theme.of(context).colorScheme.primary)
                    .paddingOnly(bottom: 16.0),
              ),
              const DelayedDisplay(
                      slidingCurve: Curves.easeInOutBack,
                      delay: Duration(milliseconds: 500),
                      child: EmailLoginTextFormField())
                  .paddingOnly(bottom: 16.0),
              const DelayedDisplay(
                      slidingCurve: Curves.easeInOutBack,
                      delay: Duration(milliseconds: 700),
                      child: PasswordLoginTextFormField())
                  .paddingOnly(bottom: 16.0),
              const DelayedDisplay(
                  slidingCurve: Curves.easeInOutBack,
                  delay: Duration(milliseconds: 900),
                  child: LoginSubmitButton(width: 250, height: 48)),
            ],
          ),
        ),
      ),
    );
  }
}
