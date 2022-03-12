import 'package:flutter/material.dart';
import 'package:flutter_mvvm_getx/modules/login/view_models/login_viewModel.dart';
import 'package:flutter_mvvm_getx/utils/constants/main_theme.dart';
import 'package:get/get.dart';

class EmailLoginTextFormField extends StatelessWidget {
  const EmailLoginTextFormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<LoginViewModel>(
        autoRemove: true,
        builder: (controller) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                initialValue: controller.email.value,
                style: MainThemes.textStyleIranBold(
                    color: Theme.of(context).primaryColor, fontSize: 16),
                onChanged: controller.emailChanged,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary),
                  ),
                  hintText: 'email_address'.tr,
                  hintStyle: MainThemes.textStyleIranBold(
                      color: MainThemes.colorLogo, fontSize: 16),
                  counterText: '',
                  prefixIcon: const Icon(Icons.email),
                  errorText: controller.errorTextEmail.value == ""
                      ? null
                      : controller.errorTextEmail.value,
                  errorStyle: const TextStyle(color: Colors.red),
                  contentPadding: const EdgeInsets.all(0),
                  labelStyle: MainThemes.textStyleIranBold(
                      color: MainThemes.colorLogo, fontSize: 16),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ));
  }
}
