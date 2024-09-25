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
                  HoverContainer(texto: 'ROBOTICA'),
                  HoverContainer(texto: 'S.M.P.'),
                  HoverContainer(texto: 'PROYECTO I'),
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

}
// Widget personalizado para cada HoverContainer
class HoverContainer extends StatefulWidget {
  final String texto;
  
  HoverContainer({required this.texto});
  
  @override
  _HoverContainerState createState() => _HoverContainerState();
}

class _HoverContainerState extends State<HoverContainer> {
  Color containerColor = Colors.grey;  // Color inicial

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => _updateColor(Colors.blue),  // Cambiar a rojo cuando el mouse entra
      onExit: (event) => _updateColor(Colors.grey), // Volver a verde cuando el mouse sale
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: containerColor,  // Cambia según el estado del hover
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Text(
          widget.texto,
          style: TextStyle(color: Colors.white),  // Estilizar el texto
        ),
      ),
    );
  }

  // Función para actualizar el color
  void _updateColor(Color color) {
    setState(() {
      containerColor = color;
    });
  }
}
