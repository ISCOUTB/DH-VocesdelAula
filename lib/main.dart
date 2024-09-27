import 'package:flutter/material.dart';
import 'package:voces_de_aula/Inicio/assets/Login_screens.dart';

void main() => runApp(const Voces_del_Aula());

// ignore: camel_case_types
class Voces_del_Aula extends StatelessWidget {
  const Voces_del_Aula({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Voces de Aula',
      home: LoginScreens(),
    );
  }
}
