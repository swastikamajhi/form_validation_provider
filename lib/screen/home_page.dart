import 'package:flutter/material.dart';
import 'package:form_validation_provider/validation_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final formProvider = context.watch<ValidationProvider>();
    return Scaffold(
      appBar: AppBar(title: Text("HomePage"), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 5,
          children: [
            Text("Your Form Data is:"),
            Text(formProvider.getUserName),
            Text(formProvider.getEmail),
            Text(formProvider.getPassword),
            Text(formProvider.getPhoneNumber),
          ],
        ),
      ),
    );
  }
}