import 'package:flutter/material.dart';
import 'package:voces_de_aula/screens/main_screen.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Voces de aula',
      routes: {
        'main' : (_) => const MainEscreen(), 
      },

      initialRoute: 'main',



    );



  }
}