import 'package:flutter/material.dart';
import 'package:my_app/configs/colors.dart';

class InputSearch extends StatelessWidget {
  const InputSearch(
      {super.key, this.controller, this.handleSearch, this.onPress});

  final TextEditingController? controller;

  final void Function(String)? handleSearch;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: onPress,
      controller: controller,
      enabled: true,
      onChanged: handleSearch,
      decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: AppColors.textHintColorGrey),
          prefixIcon: Icon(Icons.search, color: Theme.of(context).primaryColor),
          contentPadding: const EdgeInsets.all(14),
          fillColor: AppColors.backgroundTextFieldOpacity,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
          ),
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide:
                BorderSide(color: Theme.of(context).primaryColor, width: 1.0),
          )),
    );
  }
}
