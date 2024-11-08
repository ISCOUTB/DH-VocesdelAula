import 'package:flutter/material.dart';

class Asignaturas extends StatefulWidget {
  const Asignaturas({super.key});

  @override
  State<Asignaturas> createState() => _AsignaturasState();
}

class _AsignaturasState extends State<Asignaturas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF2b448c), Color(0xFF2f4f8d)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: AppBar(
              title: Row(
                children: <Widget>[
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: Image.asset(
                      'assets/logo_v.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Voces de aula',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      letterSpacing: 2.2,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              backgroundColor: Colors.transparent,
            ),
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Color.fromARGB(255, 238, 233, 233)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xFF088c5c),
                        borderRadius: BorderRadius.circular(20)),
                    margin: EdgeInsets.all(20),
                    padding: const EdgeInsets.only(
                        left: 26, right: 26, top: 10, bottom: 10),
                    child: Text(
                      'Asignaturas:',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const MenuDesplegable(
                    title: 'Robótica',
                    options: ['Profesor1'],
                  ),
                  const MenuDesplegable(
                    title: 'Ciudadania global',
                    options: ['Profesor2'],
                  ),
                  const MenuDesplegable(
                    title: 'Escritura Etnografica',
                    options: ['Profesor2'],
                  ),
                  const MenuDesplegable(
                    title: 'Etica',
                    options: ['Profesor2'],
                  ),
                  const MenuDesplegable(
                    title: 'Constitución politica',
                    options: ['Profesor2'],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 125),
                  const MenuDesplegable(
                    title: 'Fisica',
                    options: ['Profesor1'],
                  ),
                  const MenuDesplegable(
                    title: 'S.M.P',
                    options: ['Profesor1'],
                  ),
                  const MenuDesplegable(
                    title: 'SAP',
                    options: ['Profesor1'],
                  ),
                  const MenuDesplegable(
                    title: 'Calculo I',
                    options: ['Profesor3', 'Profesor4'],
                  ),
                  const MenuDesplegable(
                    title: 'Calculo II',
                    options: ['Profesor3', 'Profesor4'],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 125),
                  const MenuDesplegable(
                    title: 'Algebra lineal',
                    options: ['Profesor3'],
                  ),
                  const MenuDesplegable(
                    title: 'Ecuaciones diferenciales',
                    options: ['Profesor3'],
                  ),
                  const MenuDesplegable(
                    title: 'Matematicas basica',
                    options: ['Profesor3'],
                  ),
                  const MenuDesplegable(
                    title: 'Calculo III',
                    options: ['Profesor3'],
                  ),
                ],
              )
            ],
          ),
        ));
  }
}

class MenuDesplegable extends StatelessWidget {
  final String title;
  final List<String> options;

  const MenuDesplegable({
    Key? key,
    required this.title,
    required this.options,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        // Muestra un cuadro de diálogo con las opciones
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                title,
                style: TextStyle(
                  fontSize: 20, // Tamaño del título
                  fontWeight: FontWeight.bold, // Negrita
                  color: Color(0xFF2b448c), // Color del título
                ),
              ),
              contentPadding: const EdgeInsets.all(
                  0), // Para quitar el padding predeterminado
              content: Container(
                width: 400, // Ancho del diálogo
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12), // Bordes redondeados
                  color: Colors.white, // Fondo blanco
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: options.map<Widget>((String option) {
                    return ListTile(
                      title: Text(option),
                      onTap: () {
                        // Navegar según la opción seleccionada
                        Navigator.pop(context); // Cierra el diálogo
                        switch (option) {
                          case 'Profesor1':
                            Navigator.pushNamed(context, '/profesor');
                            break;
                          case 'Profesor2':
                            Navigator.pushNamed(context, '/profesor2');
                            break;
                          case 'Profesor3':
                            Navigator.pushNamed(context, '/profesor3');
                            break;
                          case 'Profesor4':
                            Navigator.pushNamed(context, '/profesor4');
                            break;
                          default:
                            break;
                        }
                      },
                    );
                  }).toList(),
                ),
              ),
            );
          },
        );
      },
      child: Container(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 10,
          bottom: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), // Bordes redondeados
          color: Color.fromARGB(255, 43, 185, 217), // Fondo blanco
        ),
        margin: EdgeInsets.all(20),
        child: Text(
          title, // El título que aparecerá en el botón
          style: TextStyle(
            color: Colors.white, //
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
