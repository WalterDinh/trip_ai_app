import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_app/configs/colors.dart';
import 'package:my_app/configs/images.dart';
import 'package:my_app/core/base/base_widget_screen_mixin.dart';
import 'package:my_app/core/values/app_values.dart';
import 'package:my_app/routes.dart';
import 'package:my_app/states/login/login_bloc.dart';
import 'package:my_app/ui/widgets/input/simple_text_form_field.dart';
import 'package:my_app/ui/widgets/main_app_bar.dart';
import 'package:my_app/ui/widgets/ripple.dart';
import 'package:my_app/ui/widgets/spacer.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(),
      child: const LoginView(),
    );
  }
}

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with BaseState {
  final SimpleTextFormFieldController textEmailController =
      SimpleTextFormFieldController();
  final SimpleTextFormFieldController textPasswordController =
      SimpleTextFormFieldController();

  LoginBloc get loginBloc => context.read<LoginBloc>();
  bool loading = true;

  void handleLoginFacebook() {
    loginBloc.add(const LoginWithSocial('', 'facebook', null));
  }

  void handleLoginApple() {
    loginBloc.add(const LoginWithSocial('', 'apple', null));
  }

  void handleLoginGoogle() {
    loginBloc.add(const LoginWithSocial('', 'google', null));
  }

  void onLogin() async {
    loginBloc.add(LoginWithEmailPassword(
        textEmailController.value, textPasswordController.value));
    AppNavigator.popToTop();
    AppNavigator.replaceWith(Routes.main);
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    double buttonWidth = MediaQuery.of(context).size.width / 2;

    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            imageHeader(),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(AppValues.margin_45),
              child: Column(
                children: [
                  boxInput(),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: onLogin, child: const Text('Login')),
                  ),
                  const VSpacer(16),
                  buttonSocial(buttonWidth),
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
          controller: textEmailController,
          errorTextSize: 8,
          maxLength: 12,
          isRequired: true,
          type: InputTextType.email,
          label: 'Enter your ID or Email',
        ),
        const SizedBox(
          height: AppValues.padding,
        ),
        SimpleTextFormField(
          controller: textPasswordController,
          errorTextSize: 8,
          isRequired: true,
          maxLength: 12,
          // validator: (value) {
          //   return '';
          // },
          label: 'Enter your Password',
          type: InputTextType.password,
        ),
        const VSpacer(AppValues.largePadding)
      ],
    );
  }

  Widget imageHeader() {
    return Expanded(
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(AppValues.extraLargeImageRadius),
                  bottomRight:
                      Radius.circular(AppValues.extraLargeImageRadius)),
              color: AppColors.whiteGrey,
              boxShadow: [
                BoxShadow(
                    blurStyle: BlurStyle.inner,
                    color: Color.fromRGBO(0, 0, 0, 0.2),
                    blurRadius: 16,
                    offset: Offset(0, -1)),
              ],
            ),
            child: const ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(AppValues.extraLargeImageRadius),
                  bottomRight:
                      Radius.circular(AppValues.extraLargeImageRadius)),
              child: Image(
                image: AppImages.welcome,
                fit: BoxFit.cover,
              ),
            ),
          ),
          MainAppBar(
            leading: const BackButton(color: Colors.white),
          )
        ],
      ),
    );
  }

  Widget buttonSocial(double buttonWidth) {
    return Container(
      margin: const EdgeInsets.only(bottom: 32.0),
      width: buttonWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Ripple(
            onTap: handleLoginGoogle,
            child: SvgPicture.asset(
              AppImages.googleIcon,
              width: AppValues.iconLargeSize,
              height: AppValues.iconLargeSize,
            ),
          ),
          Ripple(
            onTap: handleLoginApple,
            child: SvgPicture.asset(
              AppImages.appleIcon,
              width: AppValues.iconLargeSize,
              height: AppValues.iconLargeSize,
            ),
          ),
          Ripple(
            onTap: handleLoginFacebook,
            child: SvgPicture.asset(
              AppImages.facebookIcon,
              width: AppValues.iconLargeSize,
              height: AppValues.iconLargeSize,
            ),
          )
        ],
      ),
    );
  }
}
