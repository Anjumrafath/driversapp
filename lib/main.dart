import 'package:driversapp/firebase_options.dart';
import 'package:driversapp/global.dart';
import 'package:driversapp/info/app_info.dart';
import 'package:driversapp/pages/dashboard.dart';

import 'package:driversapp/screens/car_info_screen.dart';
import 'package:driversapp/screens/loginscreen.dart';
import 'package:driversapp/splash/splashscreen.dart';
import 'package:driversapp/themesp/themeprovider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await fetchCurrentUserInfo();
  await Permission.locationWhenInUse.isDenied.then((valueOfPermission) {
    if (valueOfPermission) {
      Permission.locationWhenInUse.request();
    }
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppInfo(),
      child: MaterialApp(
        title: 'driversapp',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: MyThemes.lightTheme,
        darkTheme: MyThemes.darkTheme,
        home: SplashScreen(),
      ),
    );
  }
}
