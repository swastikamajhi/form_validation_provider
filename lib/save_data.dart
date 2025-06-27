import 'package:flutter/material.dart';
import 'package:form_validation_provider/validation_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SaveData {
  static const String _nameKey = "UserNameKey";
  static const String _emailKey = "EmailKey";
  static const String _passwordKey = "PasswordKey";
  static const String _phoneKey = "PhoneKey";

  static Future<void> saveFormData(
    String name,
    String email,
    String password,
    String phone,
  ) async {
    final SharedPreferences data = await SharedPreferences.getInstance();

    await data.setString(_nameKey, name);
    await data.setString(_emailKey, email);
    await data.setString(_passwordKey, password);
    await data.setString(_phoneKey, phone);
  }

  static Future<bool> loadFormData(BuildContext ctx) async {
    final SharedPreferences data = await SharedPreferences.getInstance();
    final validationProvider = ctx.read<ValidationProvider>();

    final name = data.getString(_nameKey);
    final email = data.getString(_emailKey);
    final password = data.getString(_passwordKey);
    final phn = data.getString(_phoneKey);

    if ((name != null || name == "") &&
        (email != null || email == "") &&
        (password != null || password == "") &&
        (phn != null || phn == "")) {
      validationProvider.setEmail(email!);
      validationProvider.setUserName(name!);
      validationProvider.setPassword(password!);
      validationProvider.setPhoneNumber(phn!);

      return true; //this means have data and load pass so naviagete to homepage. directly.
    } else {
      return false; //this means  doesnot have data and not load so naviagete to formpage.
    }
  }
}