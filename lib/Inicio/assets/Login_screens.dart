//Packages
// ignore: unused_import
//import 'package:flutter_swiper_null_safety_flutter3/flutter_swiper_null_safety_flutter3.dart';

import 'package:flutter/material.dart';
import 'package:voces_de_aula/Inicio/assets/Login_Page.dart';

class LoginScreens extends StatelessWidget {
  const LoginScreens({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: SizedBox(
      width: double.infinity, //ancho
      height: double.infinity, //altura
      child: Stack(
        children: [
          Container(
            //Contenedor de widget
            decoration: const BoxDecoration(
                //Siempre usar const para boxDecoration
                gradient: LinearGradient(colors: [
              //Verde (255, 183, 217, 61) Ázul (255, 43, 185, 217
              Color.fromARGB(255, 43, 185, 217),
              Color.fromARGB(255, 183, 217, 61)
            ])),
            width: double.infinity, //Ancho completo
            height: size.height * 0.12,
          ),
          Positioned(
            top: 5, // Establecer la posición en la parte superior
            left: 5, // Establecer la posición en la parte izquierda
            child: Image.asset(
              'assets/Logo.png',
              width: 200, // Ajustar el ancho según sea necesario
              height: 100, // Ajustar la altura según sea necesario
              fit: BoxFit.contain, // Mantiene las proporciones de la imagen
            ),
          ),

          //Cuadros izquierdo, no mover
          //Cuadro verde debajo del blanco
          Positioned(
            bottom: 0, //Solo se ve medio cuadro
            left:
                0, //Posición negativa para mostrar solo la mitad derecha del cuadro
            child: Container(
              color: const Color.fromARGB(255, 183, 217, 61),
              width: size.width * 0.3, //La mitad del ancho de la pantalla
              height: size.height * 0.4, //Ajustar tamaño del cuadro
            ),
          ),
          //Cuadro blanco arriba del cuadro verde
          Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                color: const Color.fromARGB(255, 242, 242, 242), //Color blanco
                width: size.width * 0.25,
                height: size.height * 0.3,
              )),
          Positioned(
            bottom: 0,
            right: -size.height * 0.25,
            width: size.width * 0.2,
            height: size.height * 0.1,
            child: Container(color: const Color.fromARGB(255, 183, 217, 61)),
          ),

          //Posición de las letras y el rectángulo
          Positioned(
            top: 300, //Posición desde la parte superior de la pantalla
            left: 500, //Posición desde el lado izquierdo
            child: Container(
              width: 800, //Ancho del rectángulo
              height: 150, //Altura del rectángulo
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(
                    10), //Bordes redondos con rádio de 10 pixel
              ),
            ),
          ),
          //Texto encima de ambos cuadros
          const Positioned(
              top: 350, //Posición desde la parte superior de la pantalla
              left: 550, //Posición desde el lado izquierdo
              child: Text(
                'Si estás buscando universidad en Cartagena, acreditada con alta calidad\n'
                "y que te permitan alcanzar tus objetivos profesionales....\n"
                "La Universidad Tecnológica de Bolívar, puede hacerlo posible",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, //Color del texto
                ),
                textAlign: TextAlign.center,
              )),
          const Positioned(
            top: 300, //Posición desde la parte superior de la pantalla
            left: 600, //Posición desde el lado izquierdo
            child: Text(
              'Ingresa a la plataforma de la universidad',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                //Verde (255, 183, 217, 61) Ázul (255, 43, 185, 217
                color: Color.fromARGB(255, 43, 185, 217), //Color del texto
              ),
            ),
          ),
          //Hasta aquí

          //Icono del usuario en la parte superior
          const Positioned(
            top: 70,
            right: 9.5,
            child: Text(
              'Logín',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.right,
            ),
          ),
          SafeArea(
            child: Container(
                margin: const EdgeInsets.only(top: 20),
                width: double.infinity, //
                child: Align(
                    alignment: Alignment.topRight,
                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                      //ïcono del inicio
                      IconButton(
                        icon: const Icon(
                          Icons.home,
                          color: Colors.black,
                          size: 50,
                        ),
                        onPressed: () {
                          //Acción al presionar el ícono del inicio
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreens()),
                          ); //Redirigir a Homepage
                        },
                      ),
                      const SizedBox(width: 10), //Espacio entre los íconos
                      IconButton(
                        icon: const Icon(
                          Icons.person_pin,
                          size: 50,
                        ),
                        onPressed: () {
                          //Acción al presionar el ícono del usuario
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                          );
                        },
                      )
                    ]))),
          ),
        ],
      ),
    ));
  }
}
