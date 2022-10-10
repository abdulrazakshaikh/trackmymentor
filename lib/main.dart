import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trackmy_mentor/homepage/homepage.dart';
import 'package:trackmy_mentor/login/login.dart';
import 'package:trackmy_mentor/login/step_four.dart';
import 'package:trackmy_mentor/profile/userprofile.dart';
import 'package:trackmy_mentor/splashscreen.dart';
import 'package:trackmy_mentor/theme/color_schemes.g.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays(
      [SystemUiOverlay.top, SystemUiOverlay.bottom]).then((_) {
    runApp(const MyApp());
  });

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
      home: SafeArea(
        child: 
        // UserProfile()
        Homepage()
        // SplashScreen()
      )
    );
  }
}
