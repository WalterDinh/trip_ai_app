part of '../sign_up_page.dart';

class SignUpStep1 extends StatefulWidget {
  const SignUpStep1({Key? key}) : super(key: key);

  @override
  State<SignUpStep1> createState() => _SignUpStep1State();
}

class _SignUpStep1State extends State<SignUpStep1> {
  final SimpleTextFormFieldController textEmailController =
      SimpleTextFormFieldController();

  final SimpleTextFormFieldController textPasswordController =
      SimpleTextFormFieldController();

  final SimpleTextFormFieldController textConfirmPasswordController =
      SimpleTextFormFieldController();

  void checkData() async {
    textEmailController.value = context.read<SignUpCubit>().state.email ?? '';
    textPasswordController.value =
        context.read<SignUpCubit>().state.password ?? '';
    textConfirmPasswordController.value =
        context.read<SignUpCubit>().state.confirmPassword ?? '';
  }

  @override
  void initState() {
    super.initState();
    checkData();
  }

  void onNext(BuildContext context) async {
    context.read<SignUpCubit>().onUpdateStep1(textEmailController.value,
        textPasswordController.value, textConfirmPasswordController.value);
  }

  @override
  Widget build(BuildContext context) {
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
                        onPressed: () => onNext(context),
                        child: const Text('Next')),
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
          controller: textEmailController,
          errorTextSize: 8,
          maxLength: 12,
          isRequired: true,
          type: InputTextType.email,
          label: 'Enter your Email',
        ),
        const SizedBox(
          height: AppValues.padding,
        ),
        SimpleTextFormField(
          controller: textPasswordController,
          errorTextSize: 8,
          isRequired: true,
          maxLength: 12,
          label: 'Enter your Password',
          type: InputTextType.password,
        ),
        const SizedBox(
          height: AppValues.largePadding,
        ),
        SimpleTextFormField(
          controller: textConfirmPasswordController,
          errorTextSize: 8,
          isRequired: true,
          maxLength: 12,
          label: 'Confirm your Password',
          type: InputTextType.password,
        ),
        const SizedBox(
          height: AppValues.largePadding,
        ),
        const SizedBox(
          height: AppValues.largePadding,
        )
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
          AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ],
      ),
    );
  }
}
