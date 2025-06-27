import 'package:flutter/material.dart';
import 'package:form_validation_provider/screen/regex_extensions.dart';

class FormProvider with ChangeNotifier {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNoController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  GlobalKey<FormState> get formKey => _formKey;

  String? nameValidator(String? name) {
    if (name == '' || name == null) {
      return 'Name cannot be empty';
    } else if (!name.isValidName) {
      return 'Invalid Name';
    } else {
      return null;
    }
  }

  String? emailValidator(String? email) {
    if (email == '' || email == null) {
      return 'Email cannot be empty';
    } else if (!email.isValidEmail) {
      return 'Invalid Email';
    } else {
      return null;
    }
  }

  String? phoneNoValidator(String? phoneNo) {
    if (phoneNo == '' || phoneNo == null) {
      return 'Phone No cannot be empty';
    } else if (!phoneNo.isValidPhone) {
      return 'Invalid Phone No';
    } else {
      return null;
    }
  }

  String? passwordValidator(String? password) {
    if (password == '' || password == null) {
      return 'Password cannot be empty';
    } else if (!password.isValidPassword) {
      return 'Invalid Password';
    } else {
      return null;
    }
  }
}



