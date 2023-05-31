part of '../sign_up_page.dart';

final List<ItemGender> listGender = [
  ItemGender(genderName: "Nam", id: 1),
  ItemGender(genderName: "Nữ", id: 0),
];

class SignUpStep2 extends StatefulWidget {
  const SignUpStep2({Key? key}) : super(key: key);

  @override
  State<SignUpStep2> createState() => _SignUpStep2State();
}

class _SignUpStep2State extends State<SignUpStep2> {
  final SimpleTextFormFieldController textNameController =
      SimpleTextFormFieldController();

  final SimpleTextFormFieldDatePickerController dropdownDateOfBirthController =
      SimpleTextFormFieldDatePickerController();

  final SimpleTextFormFieldDropDownController dropdownGenderController =
      SimpleTextFormFieldDropDownController();

  void checkData() async {
    textNameController.value = context.read<SignUpCubit>().state.name ?? '';
    dropdownDateOfBirthController.value =
        context.read<SignUpCubit>().state.dateOfBirth;
    dropdownGenderController.value = context.read<SignUpCubit>().state.gender;
  }

  @override
  void initState() {
    super.initState();
    checkData();
  }

  void onNext(BuildContext context) async {
    context.read<SignUpCubit>().onUpdateStep2(textNameController.value,
        dropdownDateOfBirthController.value, dropdownGenderController.value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            imageHeader(context),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(AppValues.margin_45),
              child: Column(
                children: [
                  boxInput(context),
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

  Widget boxInput(BuildContext context) {
    return Column(
      children: [
        SimpleTextFormField(
            controller: textNameController,
            errorTextSize: 8,
            maxLength: 12,
            isRequired: true,
            type: InputTextType.email,
            label: 'Enter your name'),
        const SizedBox(
          height: AppValues.padding,
        ),
        SimpleTextFormFieldDatePicker(
          controller: dropdownDateOfBirthController,
          required: true,
          valueItem: (e) => DateFormat.MMMEd().format(e as DateTime),
          label: 'Enter your Birthday',
        ),
        const SizedBox(
          height: AppValues.largePadding,
        ),
        SimpleTextFormFieldDropDown<ItemGender>(
          controller: dropdownGenderController,
          required: true,
          label: 'Enter your Gender',
          valueItem: (e) => e.genderName,
          listItem: listGender,
        ),
        const SizedBox(
          height: AppValues.largePadding,
        )
      ],
    );
  }

  Widget imageHeader(BuildContext context) {
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
            leading: IconButton(
              splashRadius: AppValues.iconSize_20,
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: AppColors.black,
              ),
              onPressed: () => context.read<SignUpCubit>().onAnimateToPage(0),
            ),
          ),
        ],
      ),
    );
  }
}
