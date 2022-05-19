import 'package:flutter/material.dart';
import 'package:foodguru_login/Screens/forgot_pass_screen.dart';
import 'package:foodguru_login/Screens/welcome_screen.dart';
import 'Screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/login",
      routes: {
        "/login" : (context)=> Login(),
         "/welcome" : (context)=>Welcome("sample@gmail.com")
      },
      home: Scaffold(
        body: Login(),
      ),
    );
  }
}

