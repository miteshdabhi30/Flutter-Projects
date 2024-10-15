import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegistrationViewModel extends ChangeNotifier {
  int _selectedValue = 1;
  bool _isVisible = false;
  final TextEditingController _userNameController = TextEditingController();

  final FocusNode _userNameFocusNode = FocusNode();
  final FocusNode _addressFocusNode = FocusNode();
  final FocusNode _postCodeFocusNode = FocusNode();
  final FocusNode _mobileNumberFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _licenceNumberFocusNode = FocusNode();

  /// Getters
  int get selectedValue => _selectedValue;

  bool get isVisible => _isVisible;

  TextEditingController get userNameController => _userNameController;

  FocusNode get userNameFocusNode => _userNameFocusNode;

  FocusNode get addressFocusNode => _addressFocusNode;

  FocusNode get postCodeFocusNode => _postCodeFocusNode;

  FocusNode get mobileNumberFocusNode => _mobileNumberFocusNode;

  FocusNode get emailFocusNode => _emailFocusNode;

  FocusNode get passwordFocusNode => _passwordFocusNode;

  FocusNode get licenceNumberFocusNode => _licenceNumberFocusNode;

  /// Functions
  void toggleVisibility() {
    _isVisible = !_isVisible;
    notifyListeners();
  }

  void moveToNextFocusNode(BuildContext context, FocusNode currentNode) {
    if (selectedValue == 1) {
      if (currentNode == _userNameFocusNode) {
        FocusScope.of(context).requestFocus(_addressFocusNode);
      } else if (currentNode == _addressFocusNode) {
        FocusScope.of(context).requestFocus(_postCodeFocusNode);
      } else if (currentNode == _postCodeFocusNode) {
        FocusScope.of(context).requestFocus(_mobileNumberFocusNode);
      } else if (currentNode == _mobileNumberFocusNode) {
        FocusScope.of(context).requestFocus(_emailFocusNode);
      } else if (currentNode == _emailFocusNode) {
        FocusScope.of(context).requestFocus(_passwordFocusNode);
      } else {
        FocusScope.of(context)
            .unfocus();
      }
    } else {
      if (currentNode == _userNameFocusNode) {
        FocusScope.of(context).requestFocus(_licenceNumberFocusNode);
      } else if (currentNode == _licenceNumberFocusNode) {
        FocusScope.of(context).requestFocus(_addressFocusNode);
      } else if (currentNode == _addressFocusNode) {
        FocusScope.of(context).requestFocus(_postCodeFocusNode);
      } else if (currentNode == _postCodeFocusNode) {
        FocusScope.of(context).requestFocus(_mobileNumberFocusNode);
      } else if (currentNode == _mobileNumberFocusNode) {
        FocusScope.of(context).requestFocus(_emailFocusNode);
      } else if (currentNode == _emailFocusNode) {
        FocusScope.of(context).requestFocus(_passwordFocusNode);
      } else {
        FocusScope.of(context)
            .unfocus();
      }
    }
  }

  radioToggleChange(value) {
    _selectedValue = value;
    notifyListeners();
  }

  String? validateUseName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter User Name';
    } else {
      return null;
    }
  }

  String? validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter address';
    } else {
      return null;
    }
  }

  String? validatePostCode(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter PostCode';
    } else {
      return null;
    }
  }

  String? validateNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter mobile number';
    } else {
      return null;
    }
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter email';
    } else {
      return null;
    }
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter password';
    } else {
      return null;
    }
  }
}
