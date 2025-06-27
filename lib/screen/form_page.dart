import 'package:flutter/material.dart';
import 'package:form_validation_provider/validation_provider.dart';
import 'package:provider/provider.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});
  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  TextEditingController userController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Form Fill up:"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Form(
          child: Column(
            spacing: 25,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(radius: 35, child: Icon(Icons.person)),
              Text(
                'Login Screen',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),

              //username......
              TextFormField(
                controller: userController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  return context.watch<ValidationProvider>().userNameCorrection(
                    userController.text,
                  );
                },
                onChanged: (value) {
                  context.read<ValidationProvider>().setUserName(value);
                },
                decoration: InputDecoration(
                  hintText: 'Username',
                  border: OutlineInputBorder(),
                ),
              ),

              //emaill......
              TextFormField(
                controller: emailController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  return context.watch<ValidationProvider>().emailCorrection(
                    emailController.text,
                  );
                },
                onChanged: (value) {
                  context.read<ValidationProvider>().setEmail(value);
                },
                decoration: InputDecoration(
                  hintText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),

              //password......
              TextFormField(
                controller: passwordController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  return context.watch<ValidationProvider>().passwordCorrection(
                    passwordController.text,
                  );
                },
                onChanged: (value) {
                  context.read<ValidationProvider>().setPassword(value);
                },
                obscureText: true, //hides the text while typing
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),

              //phone......
              TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.number,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  return context.watch<ValidationProvider>().phNumberCorrection(
                    phoneController.text,
                  );
                },
                onChanged: (value) {
                  context.read<ValidationProvider>().setPhoneNumber(value);
                },
                decoration: InputDecoration(
                  hintText: 'PhoneNumber',
                  border: OutlineInputBorder(),
                ),
              ),

              //Submit buttons......
              ElevatedButton(
                onPressed: () {
                  context.read<ValidationProvider>().validateForm(context);
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}