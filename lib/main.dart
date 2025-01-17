import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:n3imn_project_team/dep_injection/dependency_injection.dart';
import 'package:n3imn_project_team/routes/routes.dart';
import 'package:n3imn_project_team/themes/data_theme.dart';
import 'package:n3imn_project_team/view/general_screens/login_screen.dart';
import 'package:n3imn_project_team/view/general_screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyDgpylFPQVrObJTnQfEVvZhYflmm6F6hAw",
              appId: "1:1006559214963:android:b08141c610d1b49a5f5906",
              messagingSenderId: "131339357139",
              projectId: "na3imn-project",
              storageBucket: 'na3imn-project.appspot.com'
              
              ))
      : Firebase.initializeApp();
  setupDependncyInjection();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: AppTheme.getAppTheme(),
        debugShowCheckedModeBanner: false,
        home: const splashScreen(),
        routes: Routes.getAllRoutes());
  }
}
