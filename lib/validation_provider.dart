
import 'package:flutter/material.dart';
import 'package:form_validation_provider/save_data.dart';
import 'package:form_validation_provider/screen/home_page.dart';
import 'package:form_validation_provider/screen/regex_extensions.dart';

class ValidationProvider with ChangeNotifier {
  String _userName = "";
  String _email = "";
  String _password = "";
  String _phoneNumber = "";

  //getter method
  String get getUserName => _userName;
  String get getEmail => _email;
  String get getPassword => _password;
  String get getPhoneNumber => _phoneNumber;

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

  //this function to check and validate form..... also save and naviagete to homepage....
  void validateForm(BuildContext ctx) {
    if (_userName.isValidName &&
        _email.isValidEmail &&
        _password.isValidPassword &&
        _phoneNumber.isValidPhone) {
      SaveData.saveFormData(_userName, _email, _password, _phoneNumber);

      Navigator.of(ctx).pushReplacement(
        MaterialPageRoute(
          builder: (context) {
            return HomePage();
          },
        ),
      );

      ScaffoldMessenger.of(ctx).showSnackBar(
        const SnackBar(
          behavior: SnackBarBehavior.fixed,
          content: Text('Form submit successful'),
          backgroundColor: Colors.green,
          duration: Duration(milliseconds: 500),
        ),
      );
      notifyListeners();
    } else {
      ScaffoldMessenger.of(ctx).showSnackBar(
        const SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text('Form Error '),
          backgroundColor: Colors.red,
          duration: Duration(milliseconds: 500),
        ),
      );
      notifyListeners();
    }
  }

  //below method is to check userinput text is in correct pattern or not....
  String? emailCorrection(String email) {
    if (email == '') {
      return 'Email cannot be empty'; //we are passing the error here
    } else if (!email.isValidEmail) {
      return "Email Does not Match";
    } else {
      return null; //this means no error as occured
    }
  }

  String? userNameCorrection(String username) {
    if (username == '') {
      return 'Username cannot be empty'; //we are passing the error here
    } else if (!username.isValidName) {
      return "Username Does not Match";
    } else {
      return null; //this means no error as occured
    }
  }

  String? passwordCorrection(String password) {
    if (password == '') {
      return 'Password cannot be empty'; //we are passing the error here
    } else if (!password.isValidPassword) {
      return "Password Does not Match";
    } else {
      return null; //this means no error as occured
    }
  }

  String? phNumberCorrection(String num) {
    if (num == '') {
      return 'Number cannot be empty'; //we are passing the error here
    } else if (!num.isValidPhone) {
      return "Number Does not Match";
    } else {
      return null; //this means no error as occured
    }
  }
}
