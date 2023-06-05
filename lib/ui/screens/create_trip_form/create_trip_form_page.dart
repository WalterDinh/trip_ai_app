import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_app/configs/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_app/core/values/app_values.dart';
import 'package:my_app/routes.dart';
import 'package:my_app/ui/widgets/input/simple_text_form_field.dart';
import 'package:my_app/ui/widgets/input/simple_text_form_field_date_picker.dart';
import 'package:my_app/ui/widgets/spacer.dart';

List<String> dataTab = ['All', 'Popular', 'Rating', 'Most Searched'];

class CreateTripFormScreen extends StatefulWidget {
  const CreateTripFormScreen({super.key});

  @override
  State<StatefulWidget> createState() => _CreateTripFormScreenState();
}

class _CreateTripFormScreenState extends State<CreateTripFormScreen> {
  late AppLocalizations appLocalization;
  final SimpleTextFormFieldController textNameTripController =
      SimpleTextFormFieldController();
  final SimpleTextFormFieldController textFormController =
      SimpleTextFormFieldController();
  final SimpleTextFormFieldController textFormController1 =
      SimpleTextFormFieldController();
  final SimpleTextFormFieldDatePickerController startDateController =
      SimpleTextFormFieldDatePickerController();
  final SimpleTextFormFieldDatePickerController endDateController =
      SimpleTextFormFieldDatePickerController();

  bool showTitle = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onCreate() {
    AppNavigator.push(Routes.create_plan_trip);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: AppColors.whiteGrey,
        body: SizedBox(
          height: double.infinity,
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: AppValues.margin_18),
                  child: Text(
                    'Create trip',
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.start,
                  )),
              Container(
                margin: const EdgeInsets.all(AppValues.margin_18),
                child: Column(
                  children: [
                    boxInput(),
                    const VSpacer(AppValues.margin_40),
                  ],
                ),
              ),
              const SizedBox(
                height: AppValues.largePadding,
              )
            ],
          )),
        ),
        bottomNavigationBar: Container(
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: AppColors.darkGrey.withOpacity(0.2),
                offset: const Offset(3, 0),
                blurRadius: 10,
              )
            ]),
            padding: const EdgeInsets.all(24),
            child: ElevatedButton(
                statesController: MaterialStatesController(),
                onPressed: onCreate,
                child: Text('Continue',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: AppColors.whiteGrey,
                        )))));
  }

  Widget boxInput() {
    return Column(
      children: [
        SimpleTextFormField(
          controller: textNameTripController,
          errorTextSize: 8,
          maxLength: 12,
          // isRequired: true,
          placeHolder: 'Trip name',
          label: 'Trip name',
          type: InputTextType.text,
        ),
        const SizedBox(
          height: AppValues.padding,
        ),
        SimpleTextFormField(
          controller: textFormController,
          errorTextSize: 8,
          maxLength: 12,
          label: 'Budget',
          placeHolder: 'Budget',
          type: InputTextType.money,
        ),
        const SizedBox(
          height: AppValues.padding,
        ),
        inputDate(),
        const SizedBox(
          height: AppValues.padding,
        ),
        SimpleTextFormField(
          controller: textFormController1,
          errorTextSize: 8,
          // isRequired: true,
          maxLength: 12,
          placeHolder: 'Form of tourism',
          type: InputTextType.money,
          label: 'Form of tourism',
        ),
        const SizedBox(
          height: AppValues.largePadding,
        ),
      ],
    );
  }

  Widget inputDate() {
    return Row(
      children: [
        Expanded(
            child: SimpleTextFormFieldDatePicker(
          controller: startDateController,
          required: true,
          valueItem: (e) => DateFormat.MMMEd().format(e as DateTime),
          hintText: 'Start Date',
        )),
        const SizedBox(
          width: AppValues.largePadding,
        ),
        Expanded(
            child: SimpleTextFormFieldDatePicker(
          controller: endDateController,
          required: true,
          valueItem: (e) => DateFormat.MMMEd().format(e as DateTime),
          hintText: 'End Date',
        )),
      ],
    );
  }
}