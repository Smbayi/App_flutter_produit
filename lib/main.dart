import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'views/auth/signup_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialisation Firebase
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mon Application',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: SignUpPage(), // page de départ
    );
  }
}
