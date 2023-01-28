import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:login_page/controller/auth_controller.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

@override
class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    // final authController = Provider.of<AuthController>(context);
    super.initState();

    Timer(Duration(seconds: 3), () {
      uservaliditey(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Title(color: Colors.black, child: const Text('welcome'))),
    );
  }
}
