import 'package:flutter/material.dart';
import 'package:login_page/controller/auth_controller.dart';
import 'package:login_page/view/login_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Provider.of<AuthController>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Text("userName"),
                Spacer(),
                Text(authController.userNameUI.toString()),
              ],
            ),
            Row(
              children: [
                Text("Mobile"),
                Spacer(),
                Text(authController.userMobileUI.toString()),
              ],
            ),
            Row(
              children: [
                Text("Mail"),
                Spacer(),
                Text(authController.userMailUI.toString()),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  authController.logOut();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                child: Text('LogOut'))
          ],
        ),
      ),
    );
  }
}
