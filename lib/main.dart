import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trackmy_mentor/ui/splashscreen.dart';
import 'package:trackmy_mentor/ui/theme/color_schemes.g.dart';
import 'package:trackmy_mentor/view_model/auth_view_model.dart';

import 'model/storage/shared_prefs.dart';
import 'view_model/helper_view_model.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays(
      [SystemUiOverlay.top, SystemUiOverlay.bottom]).then((_) {
    SharedPreferences.getInstance().then((prefs) {
      var darkModeOn = prefs.getBool('darkMode') ?? false;
      runApp(MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => SharedPrefs()),
          ChangeNotifierProvider(create: (_) => AuthViewModel()),
          ChangeNotifierProvider(create: (_) => HelperViewModel()),
        ],
        child: MyApp(),
      ));
      // runApp(MyApp(darkModeOn: darkModeOn,));
    });
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SharedPrefs().init();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: SharedPrefs.navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'Track My Mentor',
        theme: lightthemeData(context),
        themeMode: ThemeMode.light,
        home: SafeArea(
            child:
                // UserProfile()
                //Homepage()
                // Login()
                SplashScreen()
            // ProjectDetails('Lorem Ipsum Project Title')
        )
    );
  }
}
