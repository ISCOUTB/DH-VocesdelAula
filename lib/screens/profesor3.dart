import 'package:flutter/material.dart';

void main() => runApp(const ProfesorRatingApp3());

class ProfesorRatingApp3 extends StatefulWidget {
  const ProfesorRatingApp3({super.key});

  @override
  State<ProfesorRatingApp3> createState() => _ProfesorRatingAppState();
}

class _ProfesorRatingAppState extends State<ProfesorRatingApp3> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clasificación de Profesores',
      theme: ThemeData(
        primaryColor: const Color(0xFF2b448c),
        hintColor: const Color(0xFF2f4f8d),
        textTheme: TextTheme(
          bodyMedium: TextStyle(
            color: Colors.grey[800],
          ),
        ),
      ),
      home: const ProfesorRatingPage(),
    );
  }
}

class ProfesorRatingPage extends StatelessWidget {
  const ProfesorRatingPage({super.key});

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
            elevation: 0,
            backgroundColor: Colors.transparent,
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
                const SizedBox(width: 15),
                const Text(
                  'Clasificación del Profesor',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1.6,
                    color: Colors.white,
                    fontSize: 21,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Foto del profesor y nombre
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Imagen de perfil
                Container(
                  width: 100,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        spreadRadius: 3,
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'assets/foto_usuario.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                // Nombre del profesor y calificaciones
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Nombre del Profesor #3',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      "Facultad de Ingeniería",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 15),
                    _buildStars(5, filledStars: 1), // Calificación general
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),
            // Sección de Clases
            const Text(
              'Clases:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildClassBox('Calculo I', boxColor: Colors.grey[400]!),
                _buildClassBox('Calculo II', boxColor: Colors.grey[400]!),
                _buildClassBox('Matematicas basicas',
                    boxColor: Colors.grey[400]!),
                _buildClassBox('Algebra lineal', boxColor: Colors.grey[400]!),
                _buildClassBox('Ecuaciones Diferenciales',
                    boxColor: Colors.grey[400]!),
              ],
            ),
            const SizedBox(height: 30),
            // Sección de Comentarios
            const Text(
              'Comentarios:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 3,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nombre de la persona que hace el comentario',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 43, 185, 217)),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Excelente profesor, explica los temas de forma clara y siempre está dispuesto a resolver dudas. Recomiendo asistir a sus clases y participar activamente.',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nombre de la persona que hace el comentario',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 43, 185, 217)),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Excelente profesor, explica los temas de forma clara y siempre está dispuesto a resolver dudas. Recomiendo asistir a sus clases y participar activamente.',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget para mostrar las estrellas de calificación
  Widget _buildStars(int totalStars, {int filledStars = 0}) {
    return Row(
      children: List.generate(totalStars, (index) {
        return Icon(
          index < filledStars ? Icons.star : Icons.star_border,
          color: index < filledStars ? Colors.amber : Colors.grey,
          size: 20,
        );
      }),
    );
  }

  // Widget para mostrar cada caja de clase
  Widget _buildClassBox(String className, {Color boxColor = Colors.grey}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: boxColor, // Se define el color del contenedor
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 4,
          ),
        ],
      ),
      child: Text(
        className,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
