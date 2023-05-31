import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'sign_up_state.dart';

class FavoriteActivity {
  AssetImage image;
  int id;
  String name;
  FavoriteActivity({required this.image, required this.id, required this.name});
}

class ItemGender {
  final String genderName;
  final int id;

  ItemGender({required this.genderName, required this.id});
}

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(const SignUpState.initial());
  final PageController _pageController = PageController(initialPage: 0);

  int _activePage = 0;

  int get activePage => _activePage;
  PageController get pageController => _pageController;

  void onChangePage(int page) {
    _activePage = page;
  }

  void onAnimateToPage(int page) {
    onChangePage(page);
    _pageController.animateToPage(page,
        duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  void onUpdateStep1(
    String email,
    String password,
    String confirmPassword,
  ) {
    email = email;
    password = password;
    confirmPassword = confirmPassword;
    emit(state.copyWith(
        email: email, password: password, confirmPassword: confirmPassword));

    onAnimateToPage(1);
  }

  void onUpdateStep2(
    String name,
    DateTime dateOfBirth,
    ItemGender gender,
  ) {
    name = name;
    dateOfBirth = dateOfBirth;
    gender = gender;
    emit(state.copyWith(name: name, dateOfBirth: dateOfBirth, gender: gender));
    onAnimateToPage(2);
  }

  void updateFavoriteListSelected(FavoriteActivity activity) {
    List<FavoriteActivity> newFavoriteList = [...?state.favoriteList];
    if (isSelected(activity.id)) {
      newFavoriteList.removeWhere((element) => element.id == activity.id);
    } else {
      newFavoriteList.insert(0, activity);
    }
    emit(state.copyWith(favoriteList: newFavoriteList));
  }

  bool isSelected(int id) =>
      state.favoriteList!.any((element) => element.id == id);
}
