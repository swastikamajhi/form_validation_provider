
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:form_validation_provider/save_data.dart';
import 'package:form_validation_provider/screen/form_page.dart';
import 'package:form_validation_provider/screen/home_page.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late Future<bool> isDataLoaded;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //laod data, and load data is a bool to so return true or false after loaded.
    SaveData.loadFormData(context).then((haveData) {
      if (haveData) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) {
              return HomePage();
            },
          ),
        );
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) {
              return FormPage();
            },
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      color: Colors.black,
      child: const Center(
        child: Text(
          "Loading...",
          style: TextStyle(color: Colors.purple, fontSize: 25),
        ),
      ),
    );
  }
}
