import 'package:flutter/material.dart';
import 'package:tempo_app/loading_screen.dart';
import 'package:tempo_app/login_page.dart';
import 'package:tempo_app/home_screen.dart';
import 'package:tempo_app/notifications.dart';
import 'package:tempo_app/profile.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tempo',
      debugShowCheckedModeBanner: false,
      home: LoadingScreen(),
      initialRoute: LoadingScreen.id,
      routes: {
        LoadingScreen.id: (context) => LoadingScreen(),
        Login.id: (context) => Login(),
        HomeScreen.id: (context) => HomeScreen(),
        Notifications.id: (context) => Notifications(),
        Profile.id: (context) => Profile(),
      },
    );
  }
}
