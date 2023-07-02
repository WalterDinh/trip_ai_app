import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:my_app/core/base/base_widget_screen_mixin.dart';
import 'package:my_app/core/values/app_values.dart';
import 'package:my_app/routes.dart';
import 'package:my_app/states/change_password/change_password_cubit.dart';
import 'package:my_app/ui/widgets/input/simple_text_form_field.dart';
import 'package:my_app/ui/widgets/spacer.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangePasswordCubit(),
      child: const ChangePasswordView(),
    );
  }
}

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({Key? key}) : super(key: key);

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView>
    with BaseState {
  final SimpleTextFormFieldController textPasswordController =
      SimpleTextFormFieldController();
  final SimpleTextFormFieldController textNewPasswordController =
      SimpleTextFormFieldController();
  final SimpleTextFormFieldController textReNewPasswordController =
      SimpleTextFormFieldController();
  bool loading = true;

  void handleLoginFacebook() {
    return;
  }

  void handleLoginApple() {
    return;
  }

  void handleLoginGoogle() {
    return;
  }

  void checkData() async {
    return;
  }

  void onChangePassword() async {
    AppNavigator.pop();
  }

  @override
  void initState() {
    super.initState();
    checkData();
  }

  @override
  Widget screenName() {
    return const Text("Change password");
  }

  @override
  Widget body(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(AppValues.margin_32),
              child: Column(
                children: [
                  boxInput(),
                  const VSpacer(16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: onChangePassword,
                        child: const Text('Change password')),
                  ),
                  const VSpacer(16),
                ],
              ),
            ),
          ],
        ));
  }

  Widget boxInput() {
    return Column(
      children: [
        SimpleTextFormField(
          controller: textPasswordController,
          errorTextSize: 8,
          maxLength: 12,
          isRequired: true,
          type: InputTextType.password,
          label: 'Enter your Password',
        ),
        const SizedBox(
          height: AppValues.padding,
        ),
        SimpleTextFormField(
          controller: textNewPasswordController,
          errorTextSize: 8,
          isRequired: true,
          maxLength: 12,
          // validator: (value) {
          //   return '';
          // },
          label: 'Enter your new Password',
          type: InputTextType.password,
        ),
        const VSpacer(AppValues.largePadding),
        SimpleTextFormField(
          controller: textReNewPasswordController,
          errorTextSize: 8,
          isRequired: true,
          maxLength: 12,
          // validator: (value) {
          //   return '';
          // },
          label: 'Enter confirm new Password',
          type: InputTextType.password,
        ),
      ],
    );
  }
}
