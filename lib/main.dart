import 'package:adhicene/firebase_auth/check_page.dart';
import 'package:adhicene/screens/dashboard.dart';
import 'package:adhicene/screens/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        backgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: CheckPage(),
    );
  }
}
