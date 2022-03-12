import 'package:flutter/material.dart';
import 'package:flutter_mvvm_getx/modules/login/view_models/login_viewModel.dart';
import 'package:flutter_mvvm_getx/utils/constants/main_theme.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class PasswordLoginTextFormField extends StatelessWidget {
  const PasswordLoginTextFormField({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GetX<LoginViewModel>(
        autoRemove: true,
        builder: (controller) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            obscureText: true,
                obscuringCharacter:   "*",
                initialValue: controller.password.value,
                style: MainThemes.textStyleIranBold(
                    color: Theme.of(context).colorScheme.primary, fontSize: 16),
                onChanged: controller.passwordChanged,
                decoration: InputDecoration(
                  errorBorder:  OutlineInputBorder(
                    borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
                  ),
                  enabledBorder:  OutlineInputBorder(
                    borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
                  ),
                  hintText: 'password'.tr,
                  hintStyle: MainThemes.textStyleIranBold(
                      color: MainThemes.colorLogo, fontSize: 16),
                  counterText: '',
                  errorText:controller.errorTextPassword.value==""?null:controller.errorTextPassword.value,
                  errorStyle: const TextStyle(color: Colors.red),
                  contentPadding: const EdgeInsets.all(0),
                  prefixIcon: const Icon(Icons.keyboard),
                  labelStyle: MainThemes.textStyleIranBold(
                      color: MainThemes.colorLogo, fontSize: 16),
                  focusedBorder:  OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2.0,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                keyboardType:TextInputType.visiblePassword
                   ,
              ),
        ));
  }
}
