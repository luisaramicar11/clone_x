import 'package:flutter/material.dart';
import 'screens/home_screen.dart'; 

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      title: 'Clone de X',
     theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white, 
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white, 
          elevation: 0, 
        ),
      ),
      home: const HomeScreen(), 
    );
  }
}
