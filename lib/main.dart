import 'package:flutter/material.dart';
import 'package:trackmy_mentor/homepage/homepage.dart';
import 'package:trackmy_mentor/login/login.dart';
import 'package:trackmy_mentor/login/signup.dart';
import 'package:trackmy_mentor/splashscreen.dart';
import 'package:trackmy_mentor/theme/color_schemes.g.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Track My Mentor',
      theme: lightthemeData(context),
      themeMode: ThemeMode.light,
      
      home: 
      SplashScreen(),
      //Homepage()
      // Login()
      // Signup()
    );
  }
}
