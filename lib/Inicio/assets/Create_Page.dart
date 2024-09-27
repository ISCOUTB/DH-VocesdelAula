// ignore: file_names
import 'package:flutter/material.dart';
import 'package:voces_de_aula/Inicio/assets/Registro/Formulario.dart';
import 'package:voces_de_aula/Inicio/assets/Login_Page.dart';
// ignore: unused_import
import '/Inicio/screens/bases de datos/data_base/database_services.dart';

void main() => runApp(const Createpage());

class Createpage extends StatelessWidget {
  const Createpage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          //Parte de arriba
          Container(
            decoration: const BoxDecoration(
                gradient:
                    //Verde (255, 183, 217, 61) Ázul (255, 43, 185, 217
                    LinearGradient(colors: [
              Color.fromARGB(255, 43, 185, 217),
              Color.fromARGB(255, 183, 217, 61)
            ])),
            width: double.infinity,
            height: size.height * 0.12,
          ),
          Positioned(
              top: 5,
              left: 5,
              child: Image.asset(
                'assets/Logo.png',
                width: 200,
                height: 100,
                fit: BoxFit.contain,
              )),

          Positioned(
              top: 300,
              left: -50,
              child: Container(
                width: 400,
                height: 600,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 183, 217, 61),
                  borderRadius: BorderRadius.circular(20),
                ),
              )),
          Positioned(
              top: 350,
              left: -50,
              child: Container(
                width: 300,
                height: 500,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 242, 242, 242),
                  borderRadius: BorderRadius.circular(20),
                ),
              )),

          Positioned(
              top: 700,
              right: -50,
              child: Container(
                width: 350,
                height: 500,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 183, 217, 61),
                  borderRadius: BorderRadius.circular(20),
                ),
              )),
          Positioned(
              top: 760,
              right: -20,
              child: Container(
                width: 200,
                height: 300,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 242, 242, 242),
                  borderRadius: BorderRadius.circular(20),
                ),
              )),

          //Contenedor principal del formulario de registro
          Positioned(
              top: 150,
              left: size.width * 0.1,
              child: Container(
                width: size.width * 0.8,
                height: size.height * 0.5,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 43, 185, 217), //Azul
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 15,
                        offset: const Offset(0, 5),
                      )
                    ]),
                child: const RegistrationForm(),
              )),

          SafeArea(
              child: Container(
            margin: const EdgeInsets.only(top: 20),
            width: double.infinity,
            child: Align(
                alignment: Alignment.topRight,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(width: 10),
                    IconButton(
                      icon: const Icon(
                        Icons.person_pin,
                        size: 50,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                        );
                      },
                    )
                  ],
                )),
          ))
        ],
      ),
    ));
  }
}
