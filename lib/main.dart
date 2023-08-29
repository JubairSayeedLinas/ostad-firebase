import 'package:firebase_assignment/score_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'homescreen.dart';





Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
);

runApp(const MatchScoreApp());
}

class MatchScoreApp extends StatelessWidget {
  const MatchScoreApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen()
    );
  }
}



