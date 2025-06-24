import 'package:flutter/material.dart';
import 'package:form_validation_provider/home_page.dart';
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
      appBar: AppBar(title: Text("Form :"), centerTitle: true),
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
                  if (value == '' || value == null) {
                    return 'Name cannot be empty'; //we are passing the error here
                  } else if (!context
                      .read<ValidationProvider>()
                      .userNameCorrection(value)) {
                    return 'First Letter always Capital';
                  } else {
                    return null; //this means no error as occured
                  }
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
                  if (value == '' || value == null) {
                    return 'Email cannot be empty'; //we are passing the error here
                  } else if (!context
                      .read<ValidationProvider>()
                      .emailCorrection(value)) {
                    return "Enter Capital letter first";
                  } else {
                    return null; //this means no error as occured
                  }
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
                  if (value == '' || value == null) {
                    return 'Password cannot be empty';
                  } else if (!context
                      .read<ValidationProvider>()
                      .passwordCorrection(value)) {
                    return "Enter Capital letter first";
                  } else if (value.length < 8) {
                    return 'Password is short';
                  } else {
                    return null;
                  }
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
                  if (value == '' || value == null) {
                    return 'phoneNumber cannot be empty'; //we are passing the error here
                  } else if (!context
                      .read<ValidationProvider>()
                      .phoneCorrection(value)) {
                    return "Enter 10 number with contrycode";
                  } else {
                    return null; //this means no error as occured
                  }
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
                  if (context.read<ValidationProvider>().validateForm()) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return HomePage();
                        },
                      ),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        behavior: SnackBarBehavior.fixed,
                        content: Text('Form submit successful'),
                        backgroundColor: Colors.green,
                        duration: Duration(milliseconds: 500),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        behavior: SnackBarBehavior.floating,
                        content: Text('Form Error '),
                        backgroundColor: Colors.red,
                        duration: Duration(milliseconds: 700),
                      ),
                    );
                  }
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
