import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trackmy_mentor/ui/splashscreen.dart';
import 'package:trackmy_mentor/ui/theme/color_schemes.g.dart';
import 'package:trackmy_mentor/view_model/auth_view_model.dart';
import 'package:trackmy_mentor/view_model/banner_view_model.dart';
import 'package:trackmy_mentor/view_model/chat_view_model.dart';
import 'package:trackmy_mentor/view_model/project_view_model.dart';
import 'package:trackmy_mentor/view_model/quotation_view_model.dart';
import 'package:trackmy_mentor/view_model/rating_view_model.dart';
import 'package:trackmy_mentor/view_model/teacher_view_model.dart';

import 'model/storage/shared_prefs.dart';
import 'view_model/helper_view_model.dart';

Future<void> main() async {
  Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  SystemChrome.setEnabledSystemUIOverlays(
      [SystemUiOverlay.top, SystemUiOverlay.bottom]).then((_) {
    SharedPreferences.getInstance().then((prefs) async {
      //var darkModeOn = prefs.getBool('darkMode') ?? false;
      runApp(MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => SharedPrefs()),
          ChangeNotifierProvider(create: (_) => AuthViewModel()),
          ChangeNotifierProvider(create: (_) => HelperViewModel()),
          ChangeNotifierProvider(create: (_) => TeacherViewModel()),
          ChangeNotifierProvider(create: (_) => ProjectViewModel()),
          ChangeNotifierProvider(create: (_) => BannerViewModel()),
          ChangeNotifierProvider(create: (_) => RatingViewModel()),
          ChangeNotifierProvider(create: (_) => QuotationViewModel()),
          ChangeNotifierProvider(create: (_) => ChatViewModel()),
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
