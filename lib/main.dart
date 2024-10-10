import 'package:flutter/material.dart';
import 'package:voces_de_aula/screens/login_screen.dart';
import 'package:voces_de_aula/screens/main_screen.dart';
import 'package:voces_de_aula/screens/register_screen.dart';


import 'screens/visualizacionProfesores.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Voces de aula',
      routes: {
        '/main' : (_) => const MainEscreen(),
        '/login' : (_) => const LoginScreen(),
        '/register' : (_) => const RegisterScreen(),
        '/prfesor' : (_) => const ProfesorRatingApp(),
      },

      initialRoute: '/main',



    );



  }
}