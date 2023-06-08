import 'package:chatty/helper/helper_function.dart';
import 'package:chatty/pages/auth/register_page.dart';
import 'package:chatty/pages/home/DriverViews/CallTimer.dart';
import 'package:chatty/pages/home/DriverViews/DriverSelfProfile.dart';
import 'package:chatty/pages/home/DriverViews/GraphMap.dart';
import 'package:chatty/pages/home/DriverViews/HomePageDriver.dart';
import 'package:chatty/pages/home/DriverViews/Statistic.dart';
import 'package:chatty/pages/home/Home.dart';
import 'package:chatty/helper/galeryImage.dart';
import 'package:chatty/pages/home/HomeBody.dart';
import 'package:chatty/pages/home/SearchUser.dart';
import 'package:chatty/pages/home/test.dart';
import 'package:chatty/shared/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'pages/auth/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: Constants.apiKey,
            appId: Constants.appId,
            messagingSenderId: Constants.messagingSenderId,
            projectId: Constants.projectId));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isSignedIn = false;
  @override
  void initState() {
    super.initState();
    getUserLoggedInStatus();
  }

  void getUserLoggedInStatus() async {
    await HelperFunction.getUserLoggedInStatuts().then((value) {
      if (value != null) {
        setState(() {
          _isSignedIn = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: Constants().primaryColor,
          scaffoldBackgroundColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
        home:
            HomePageDriver() //_isSignedIn ? const HomePage() : const LoginPage(),
        );
  } // //
}
