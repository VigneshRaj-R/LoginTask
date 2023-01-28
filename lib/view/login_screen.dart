import 'package:flutter/material.dart';
import 'package:login_page/controller/auth_controller.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var authController = Provider.of<AuthController>(context);

    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Text('Login'),
          TextField(
            controller: authController.loginUserName,
          ),
          TextField(
            controller: authController.loginPassword,
          ),
          ElevatedButton(
              onPressed: () {
                authController.loginUser(context);
              },
              child: Text('Login'))
        ],
      )),
    );
  }
}
