import 'package:flutter/material.dart';

class ValidationProvider with ChangeNotifier {
  String _userName = "";
  String _email = "";
  String _password = "";
  String _phoneNumber = "";

  final userNameRegex = RegExp(r'^[A-Z][a-zA-Z0-9]+$');
  final emailRegex = RegExp(r'^[A-Z][a-zA-Z0-9]+$');
  final passwordRegex = RegExp(r'^[A-Z][a-zA-Z0-9]+$');
  final phoneRegex = RegExp(r'^[0-9]{10}$');

  void setUserName(String newName) {
    _userName = newName;
    notifyListeners();
  }

  void setEmail(String newEmail) {
    _email = newEmail;
    notifyListeners();
  }

  void setPassword(String newPass) {
    _password = newPass;
    notifyListeners();
  }

  void setPhoneNumber(String newNumber) {
    _phoneNumber = newNumber;
    notifyListeners();
  }

  bool validateForm() {
    if (userNameRegex.hasMatch(_userName) &&
        emailRegex.hasMatch(_email) &&
        passwordRegex.hasMatch(_password) &&
        phoneRegex.hasMatch(_phoneNumber)) {
      return true;
    } else {
      return false;
    }
  }

  bool userNameCorrection(String name) {
    if (userNameRegex.hasMatch(name)) {
      return true;
    } else {
      return false;
    }
  }

  bool phoneCorrection(String phoneNum) {
    if (phoneRegex.hasMatch(phoneNum)) {
      return true;
    } else {
      return false;
    }
  }

  bool emailCorrection(String email) {
    if (emailRegex.hasMatch(email)) {
      return true;
    } else {
      return false;
    }
  }

  bool passwordCorrection(String pass) {
    if (passwordRegex.hasMatch(pass)) {
      return true;
    } else {
      return false;
    }
  }
}