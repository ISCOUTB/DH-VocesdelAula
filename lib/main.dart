import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
//----------------------------------------------------------------
//----WEB!!!!!---------//
import 'package:voces_de_aula/screens/login_screen.dart';
import 'package:voces_de_aula/screens/main_screen.dart';
import 'package:voces_de_aula/screens/profesor2.dart';
import 'package:voces_de_aula/screens/profesor3.dart';
import 'package:voces_de_aula/screens/profesor4.dart';
import 'package:voces_de_aula/screens/profile_screen.dart';
import 'package:voces_de_aula/screens/register_screen.dart';
import 'package:voces_de_aula/screens/home.dart';
import 'package:voces_de_aula/screens/asignaturas.dart';
import 'package:voces_de_aula/screens/visualizacionProfesores.dart';

//----------MOVIL!!!!!-------------//

//----------------------------------------------------------------
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Voces de aula',
      routes: {
        '/main': (_) => const MainEscreen(),
        '/login': (_) => const LoginScreen(),
        '/register': (_) => const RegisterScreen(),
        '/profesor': (_) => const ProfesorRatingApp(),
        '/home': (_) => const Home(),
        '/profesor2': (_) => const ProfesorRatingApp2(),
        '/profesor3': (_) => const ProfesorRatingApp3(),
        '/profesor4': (_) => const ProfesorRatingApp4(),
        '/profile': (_) => const ProfileScreen(),
        '/asignaturas': (_) => const Asignaturas(),
      },
      initialRoute: kIsWeb
          ? '/main'
          : '/asignaturas', // Usa rutas diferentes para web y móvil
    );
  }
}
