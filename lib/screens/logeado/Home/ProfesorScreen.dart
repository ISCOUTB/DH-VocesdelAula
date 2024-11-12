import 'package:flutter/material.dart';
import 'package:voces_de_aula/screens/Base%20de%20datos/database_services.dart';
import 'package:voces_de_aula/screens/logeado/Home/Home/Home_Alumnos.dart';
import 'package:voces_de_aula/screens/logeado/Home/Home/Home_Profesor.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfesorsScreen extends StatefulWidget {
  final String nombreProfesor;
  final String nombreAsignatura;
  final String nombreFacultad;
  final String notas;
  final String calificaciones;
  final int T5;

  const ProfesorsScreen(
      {super.key,
      required this.nombreProfesor,
      required this.nombreAsignatura,
      required this.nombreFacultad,
      required this.notas,
      required this.calificaciones,
      required this.T5});

  @override
  // ignore: library_private_types_in_public_api
  _ProfesorsScreen createState() => _ProfesorsScreen();
}

class _ProfesorsScreen extends State<ProfesorsScreen> {
  late final String nombreProfesor;
  late final String nombreAsignatura;
  late final String nombreFacultad;
  late final String notas;
  late final String calificaciones;
  late final int T5;
  late String tipoUsuario;

  @override
  void initState() {
    super.initState();
    nombreProfesor = widget.nombreProfesor;
    nombreAsignatura = widget.nombreAsignatura;
    nombreFacultad = widget.nombreFacultad;
    notas = widget.notas;
    calificaciones = widget.calificaciones;
    T5 = widget.T5;

    _getTipoUsuario();
  }

  //Método para obtener el tipo de usuario y mostrarlo
  Future<void> _getTipoUsuario() async {
    DatabaseServices databaseServices = DatabaseServices();
    var userDetails = await databaseServices.getTipoUsuario(T5);
    // ignore: unnecessary_null_comparison
    if (userDetails != null && userDetails.containsKey('Tipo_usuario')) {
      setState(() {
        tipoUsuario = userDetails['Tipo_usuario'] ?? 'Desconocido';
      });
    } else {
      setState(() {
        tipoUsuario = 'Desconocido';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // ignore: unused_local_variable
    final database = DatabaseServices();
    return Scaffold(
        body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Stack(children: <Widget>[
              // Fondo de la pantalla
              Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xFF2b448c), Color(0xFF2f4f8d)])),
                  width: double.infinity,
                  height: size.height * 0.10),

              // Logo en la esquina superior izquierda
              Positioned(
                  top: 0,
                  left: 0,
                  child: Image.asset('assets/logo_v.png',
                      width: 100, height: 100, fit: BoxFit.contain)),

              // Información del profesor (Nombre)
              Positioned(
                  top: 10,
                  right: 10,
                  child: Text('Información de $nombreProfesor',
                      style:
                          const TextStyle(fontSize: 16, color: Colors.white))),

              // Contenedor gris para los detalles del profesor
              Positioned(
                  top: 150, // Ajuste de la posición
                  left: 50,
                  child: Container(
                      width: size.width - 100, // Ajuste de tamaño
                      height: size.height - 200,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(children: [
                        const SizedBox(height: 20),
                        const Icon(Icons.person, color: Colors.black, size: 50),
                        const SizedBox(height: 20),
                        Text('Nombre: $nombreProfesor',
                            style: const TextStyle(
                                fontSize: 25, color: Colors.black)),
                        const SizedBox(height: 30),
                      ]))),

              Positioned(
                  //Aquí insertar calificaciones
                  top: 200,
                  right: 800,
                  child: Column(children: [
                    const Icon(LineAwesomeIcons.star_solid, size: 10),
                    const SizedBox(height: 5),
                    Text('Calificaciones: $calificaciones',
                        style:
                            const TextStyle(fontSize: 15, color: Colors.black))
                  ])),

              Positioned(
                  top: 350,
                  left: 80,
                  child: Column(
                    children: [
                      const Icon(Icons.person_2_rounded,
                          color: Colors.black, size: 40),
                      const SizedBox(height: 5),
                      Text("T$T5")
                    ],
                  )),

              Positioned(
                  top: 350,
                  left: 80,
                  child: Column(children: [
                    const Icon(Bootstrap.book, color: Colors.black, size: 40),
                    const SizedBox(height: 5),
                    Text('Asignatura: $nombreAsignatura',
                        style:
                            const TextStyle(fontSize: 20, color: Colors.black))
                  ])),

              Positioned(
                  top: 350,
                  left: 400,
                  child: Column(children: [
                    const Icon(LineAwesome.university_solid,
                        color: Colors.black, size: 40),
                    const SizedBox(height: 5),
                    Text('Facultad: $nombreFacultad',
                        style:
                            const TextStyle(fontSize: 20, color: Colors.black))
                  ])),

              Positioned(
                  //Aquí insertar comentarios
                  top: 450,
                  left: 80,
                  child: Column(children: [
                    const Icon(LineAwesome.text_height_solid,
                        color: Colors.black, size: 40),
                    const SizedBox(height: 5),
                    Text('Comentarios: $notas',
                        style:
                            const TextStyle(fontSize: 20, color: Colors.black))
                  ])),

              // Botón de inicio
              SafeArea(
                  child: Container(
                      margin: const EdgeInsets.only(top: 25),
                      width: double.infinity,
                      child: Align(
                          alignment: Alignment.topRight,
                          child: Row(mainAxisSize: MainAxisSize.min, children: [
                            IconButton(
                                icon: const Icon(Icons.home,
                                    color: Colors.black, size: 50),
                                onPressed: () async {
                                  DatabaseServices db = DatabaseServices();
                                  var userDetails = await db.getTipoUsuario(T5);

                                  print(
                                      "Detalles del usuario: $userDetails"); // Agregar print para verificar los datos obtenidos

                                  if (userDetails != null &&
                                      userDetails.containsKey('Tipo_usuario')) {
                                    String tipoUsuario =
                                        userDetails['Tipo_usuario'] ??
                                            'Desconocido';
                                    print(
                                        "Tipo de usuario: $tipoUsuario"); // Verifica el tipo de usuario

                                    // Dependiendo del tipo de usuario, navega a la pantalla correspondiente
                                    if (tipoUsuario == 'Profesor') {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Home_Profesor(userT5: T5)));
                                    } else if (tipoUsuario == 'Alumno') {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Home_Alumno(userT5: T5)));
                                    } else {
                                      // Si el tipo de usuario no es válido, muestra un mensaje
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text(
                                                  'Tipo de usuario no válido')));
                                    }
                                  } else {
                                    // En caso de que no se obtengan detalles, muestra un mensaje de error
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'Error al obtener tipo de usuario')));
                                  }
                                })
                          ]))))
            ])));
  }
}
