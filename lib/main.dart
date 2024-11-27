import 'package:flutter/material.dart';
import 'screens/home_screen.dart'; // Asegúrate de importar correctamente el archivo de la pantalla principal

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Desactiva el banner de depuración
      title: 'Clone de X',
     theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white, // Fondo blanco global
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white, // Fondo blanco para el AppBar
          elevation: 0, // Sin sombra
        ),
      ),
      home: HomeScreen(), // Esta es la pantalla principal que hemos creado
    );
  }
}
