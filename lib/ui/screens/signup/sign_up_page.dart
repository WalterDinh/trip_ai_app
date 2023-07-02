import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:my_app/configs/colors.dart';
import 'package:my_app/configs/images.dart';
import 'package:my_app/core/values/app_values.dart';
import 'package:my_app/routes.dart';
import 'package:my_app/states/sign_up/sign_up_cubit.dart';
import 'package:my_app/ui/widgets/input/simple_text_form_field.dart';
import 'package:my_app/ui/widgets/input/simple_text_form_field_date_picker.dart';
import 'package:my_app/ui/widgets/input/simple_text_form_field_dropdown.dart';
import 'package:my_app/ui/widgets/spacer.dart';

part 'sections/sign_up_step_1.dart';
part 'sections/sign_up_step_2.dart';
part 'sections/sign_up_step_3.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => SignUpCubit(), child: const SignUpView());
  }
}

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  void checkData() async {
    return;
  }

  void onLogin() async {
    AppNavigator.push(Routes.login);
  }

  @override
  void initState() {
    super.initState();
    checkData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: PageView.builder(
            pageSnapping: true,
            physics: const NeverScrollableScrollPhysics(),
            controller: context.read<SignUpCubit>().pageController,
            onPageChanged: (int index) {
              context.read<SignUpCubit>().onChangePage(index);
            },
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              switch (index) {
                case 0:
                  return const SignUpStep1();
                case 1:
                  return const SignUpStep2();
                default:
                  return SignUpStep3();
              }
            }));
  }
}
