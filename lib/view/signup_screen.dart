import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:login_page/controller/auth_controller.dart';
import 'package:login_page/util/spacer.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var authController = Provider.of<AuthController>(context);

    return Scaffold(
      body: SafeArea(
          child: Form(
        key: authController.formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text('Sign Up'),
              TextFormField(
                controller: authController.name,
                validator: (value) {
                  authController.fieldCheaking(value);
                },
              ),
              height10,
              TextFormField(
                controller: authController.mobile,
                validator: (value) {
                  authController.fieldCheaking(value);
                },
              ),
              height10,
              TextFormField(
                controller: authController.mail,
                validator: (value) {
                  authController.fieldCheaking(value);
                },
              ),
              height10,
              TextFormField(
                controller: authController.password,
                validator: (value) {
                  authController.fieldCheaking(value);
                },
              ),
              TextFormField(
                controller: authController.confirmpassword,
                validator: (value) {
                  authController.fieldCheaking(value);
                },
              ),
              height10,
              height10,
              ElevatedButton(
                  onPressed: () {
                    if (authController.formKey.currentState!.validate()) {
                      authController.FormVerification(context);
                    }
                  },
                  child: Text('Submit'))
            ],
          ),
        ),
      )),
    );
  }
}
