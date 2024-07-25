import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wac_task/view/home_screen/home_screen.dart';
import 'package:wac_task/view_model/home_screen_view_model.dart';

import 'view_model/dashboard_view_model.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();

  runApp(const MainApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeScreenViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => DashboardViewModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
        home: const HomeScreen(),
      ),
    );
  }
}
