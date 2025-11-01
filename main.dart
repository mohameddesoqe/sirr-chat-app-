import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'settings_screen.dart';

void main() {
  // Set preferred orientations
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sirr Settings',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF7F7F7),
        fontFamily: 'SF Pro Text',
      ),
      home: const SettingsScreen(),
    );
  }
}

