import 'package:flutter/material.dart';

void main() => runApp(ProfesorRatingApp());

class ProfesorRatingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clasificación de Profesores',
      home: ProfesorRatingPage(),
    );
  }
}

class ProfesorRatingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clasificación de Profesores'),
        backgroundColor: Color(0xFF2C4293), // Azul oscuro
      ),
      body: Padding(
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
                  width: 90,
                  height: 110,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(width: 16),
                // Nombre del profesor y calificaciones
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Harold Rodriguez',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    _buildStars(5, filledStars: 4), // Calificación general
                    SizedBox(height: 8),
                    _buildStars(5, filledStars: 2), // Otra calificación
                  ],
                ),
              ],
            ),
            SizedBox(height: 30),
            
            // Sección de Clases
            Text(
              'Clases:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.all(10),         // Padding dentro del contenedor
                  margin: EdgeInsets.all(5),           // Margen externo del contenedor
                  decoration: BoxDecoration(
                    color: Colors.green,               // Color de fondo
                    borderRadius: BorderRadius.circular(10), // Bordes redondeados
                    boxShadow: [                       // Sombras alrededor del contenedor
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  child: Text('ROBOTICA'),
                ),
                Container(
                  padding: EdgeInsets.all(10),         // Padding dentro del contenedor
                  margin: EdgeInsets.all(5),           // Margen externo del contenedor
                  decoration: BoxDecoration(
                    color: Colors.green,               // Color de fondo
                    borderRadius: BorderRadius.circular(10), // Bordes redondeados
                    boxShadow: [                       // Sombras alrededor del contenedor
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  child: Text('S.M.P.'),
                ),
                Container(
                  padding: EdgeInsets.all(10),         // Padding dentro del contenedor
                  margin: EdgeInsets.all(5),           // Margen externo del contenedor
                  decoration: BoxDecoration(
                    color: Colors.green,               // Color de fondo
                    borderRadius: BorderRadius.circular(10), // Bordes redondeados
                    boxShadow: [                       // Sombras alrededor del contenedor
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  child: Text('PROYECTO I'),
                ),
              ],
            ),
            SizedBox(height: 30),
            
            // Sección de Comentarios
            Text(
              'Comentarios:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(12),
                color: Colors.grey[300],
                child: SingleChildScrollView(
                  child: Text(
                    'Aquí se mostrarían los comentarios que los estudiantes dejan sobre el profesor.',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
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
          color: index < filledStars ? Colors.yellow : Colors.grey,
        );
      }),
    );
  }

  // Widget para mostrar cada caja de clase
  Widget _buildClassBox(String className) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        className,
        style: TextStyle(
          fontSize: 14,
        ),
      ),
    );
  }
}
