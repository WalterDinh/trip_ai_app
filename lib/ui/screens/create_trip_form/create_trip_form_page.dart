import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_app/configs/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_app/core/base/base_widget_screen_mixin.dart';
import 'package:my_app/core/values/app_values.dart';
import 'package:my_app/routes.dart';
import 'package:my_app/ui/widgets/custom_track_shape.dart';
import 'package:my_app/ui/widgets/input/simple_contants.dart';
import 'package:my_app/ui/widgets/input/simple_text_form_field.dart';
import 'package:my_app/ui/widgets/input/simple_text_form_field_date_picker.dart';
import 'package:my_app/ui/widgets/spacer.dart';
import 'package:counter_button/counter_button.dart';

List<String> dataTab = ['All', 'Popular', 'Rating', 'Most Searched'];

class CreateTripFormScreen extends StatefulWidget {
  const CreateTripFormScreen({super.key});

  @override
  State<StatefulWidget> createState() => _CreateTripFormScreenState();
}

class _CreateTripFormScreenState extends State<CreateTripFormScreen>
    with BaseState {
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

  final SimpleTextFormFieldController startPlaceController =
      SimpleTextFormFieldController();

  final SimpleTextFormFieldController endPlaceController =
      SimpleTextFormFieldController();
  double _currentSliderValue = 500;
  double _current2SliderValue = 10000;
  int _counterValue1 = 0;
  int _counterValue2 = 0;
  int _counterValue3 = 0;

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
  Widget screenName() {
    return const Text("Create trip");
  }

  @override
  Widget bottomNavigationBar() {
    return Container(
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
                    ))));
  }

  @override
  Widget body(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
    );
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
          controller: startPlaceController,
          errorTextSize: 8,
          placeHolder: 'Detination',
          label: 'Detination',
          type: InputTextType.text,
        ),
        const SizedBox(
          height: AppValues.padding,
        ),
        inputDate(),
        const SizedBox(
          height: AppValues.padding,
        ),
        sidlerBudget(),
        const SizedBox(
          height: AppValues.padding,
        ),
        numberAndTypeOfMembers(),
        const SizedBox(
          height: AppValues.largePadding,
        ),
      ],
    );
  }

  Widget sidlerBudget() {
    return Column(
      children: [
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Budget',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: AppColors.grey800),
            )),
        const VSpacer(8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${SimpleConstants.currencyFormat(_currentSliderValue ?? 0)}\$ ',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: AppColors.grey800),
            ),
            Text(
              '${SimpleConstants.currencyFormat(_current2SliderValue ?? 0)}\$',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: AppColors.grey800),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: SliderTheme(
              data: SliderThemeData(
                overlayShape: SliderComponentShape.noThumb,
              ),
              child: RangeSlider(
                values: RangeValues(_currentSliderValue, _current2SliderValue),
                activeColor: AppColors.darkGreen,
                inactiveColor: Colors.green[200],
                max: 20000,
                min: 500,
                divisions: 100,
                onChanged: (RangeValues value) {
                  setState(() {
                    _currentSliderValue = value.start;
                    _current2SliderValue = value.end;
                  });
                },
              )),
        ),
      ],
    );
  }

  Widget numberAndTypeOfMembers() {
    return Column(
      children: [
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Number and type of members',
              textAlign: TextAlign.start,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: AppColors.grey800),
            )),
        const VSpacer(8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            item('Types', (int val) {
              setState(() {
                _counterValue1 = val;
              });
            }, _counterValue1),
            item('Adults', (int val) {
              setState(() {
                _counterValue2 = val;
              });
            }, _counterValue2),
            item('Children', (int val) {
              setState(() {
                _counterValue3 = val;
              });
            }, _counterValue3)
          ],
        ),
      ],
    );
  }

  Widget item(String title, Function(int) onChange, int value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              textAlign: TextAlign.start,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: AppColors.grey800),
            )),
        const VSpacer(4),
        CounterButton(
          loading: false,
          onChange: onChange,
          count: value,
          countColor: Colors.black,
          buttonColor: AppColors.blueGrey,
          progressColor: AppColors.blueGrey,
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
