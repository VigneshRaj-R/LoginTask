import 'package:flutter/material.dart';
import 'package:login_page/model/profile_model.dart';
import 'package:login_page/view/home_screen.dart';
import 'package:login_page/view/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends ChangeNotifier {
  String? userNameUI;
  String? userMobileUI;
  String? userMailUI;

  var formKey = GlobalKey<FormState>();
  //Sign up
  final TextEditingController name = TextEditingController();
  final TextEditingController mobile = TextEditingController();
  final TextEditingController mail = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmpassword = TextEditingController();
  final TextEditingController loginUserName = TextEditingController();
  final TextEditingController loginPassword = TextEditingController();

  Profile? userData;
  fieldCheaking(value) {
    print(value);
  }

  String? FormVerification(context) {
    if (name.text == null && name.text.isEmpty ||
        mobile.text == null && mobile.text.isEmpty ||
        mail.text == null && mail.text.isEmpty ||
        password.text == null && password.text.isEmpty ||
        confirmpassword.text == null && confirmpassword.text.isEmpty) {
      return 'Fill your Detailos';
    } else {
      signUpUser(context);
      return null;
    }
  }

  signUpUser(context) async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    userData = Profile(
        name: name.text,
        mobile: mobile.text,
        mail: mail.text,
        password: password.text,
        confirmpassword: confirmpassword.text);

    prefs.setString("userName", name.text);
    prefs.setString("mobile", mobile.text);
    prefs.setString("email", mail.text);
    prefs.setString("password", password.text);
    forUi();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  loginUser(context) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("LoginUserName", loginUserName.text);
    prefs.setString("LoginUserPassword", loginPassword.text);
    final userName = prefs.getString("LoginUserName");
    final password = prefs.getString("LoginUserPassword");
    if (userName == loginUserName.text && password == loginPassword.text) {
      forUi();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    }
  }


  forUi() async {
    final prefs = await SharedPreferences.getInstance();

    userNameUI = prefs.getString("userName");
    userMobileUI = prefs.getString("mobile");
    userMailUI = prefs.getString("email");
  }

  logOut() async {
    final prefs = await SharedPreferences.getInstance();

    // Remove data for the 'counter' key.
    final field1 = await prefs.remove('userName');
    final field2 = await prefs.remove('mobile');
    final field3 = await prefs.remove('email');
    final field4 = await prefs.remove('LoginUserName');
    final field5 = await prefs.remove('LoginUserPassword');
  }
}

uservaliditey(context) async {
  final prefs = await SharedPreferences.getInstance();

  final userName = prefs.getString("LoginUserName");
  // final mobile = prefs.getString("mobile");
  final password = prefs.getString("LoginUserPassword");
  if (userName == null ||
      userName.toString().isEmpty && password.toString().isEmpty ||
      password == null) {
  
    final authController = Provider.of<AuthController>(context, listen: false);
    authController.forUi();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  } else {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }
}
