import 'package:flutter/material.dart';
import 'package:hire_a_driver_test/API/user_login_api/api_service.dart';

import '../API/user_login_api/api_model.dart';

class LoginViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  bool _isVisible = false;
  bool _isLoading = false;
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  bool get isVisible => _isVisible;

  bool get isLoading => _isLoading;

  FocusNode get emailFocus => _emailFocus;

  FocusNode get passwordFocus => _passwordFocus;

  void toggleVisibility() {
    _isVisible = !_isVisible;
    notifyListeners();
  }

  void onFieldSubmitted(BuildContext context) {
    if (_emailFocus.hasFocus) {
      FocusScope.of(context).requestFocus(_passwordFocus);
    } else {
      FocusScope.of(context).unfocus();
    }
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
        .hasMatch(value)) {
      return 'Enter a valid email address';
    } else {
      return null;
    }
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    } else {
      return null;
    }
  }

  Future<List<Data>?> login(String email, String password, context) async {
    _isLoading = true;
    notifyListeners();

   final dataList = await _apiService.login(email, password, context);

    _isLoading = false;
    notifyListeners();
    return dataList;
  }
}





