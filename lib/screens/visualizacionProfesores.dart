import 'package:flutter/material.dart';

void main() => runApp(const ProfesorRatingApp());

class ProfesorRatingApp extends StatefulWidget {
  const ProfesorRatingApp({super.key});

  @override
  State<ProfesorRatingApp> createState() => _ProfesorRatingAppState();
}

class _ProfesorRatingAppState extends State<ProfesorRatingApp> {
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

class ProfesorRatingPage extends StatefulWidget {
  const ProfesorRatingPage({super.key});

  @override
  State<ProfesorRatingPage> createState() => _ProfesorRatingPageState();
}

class _ProfesorRatingPageState extends State<ProfesorRatingPage> {
  final TextEditingController _commentController = TextEditingController();
  final List<String> _comments = []; // Lista de comentarios

  void _addComment() {
    setState(() {
      if (_commentController.text.isNotEmpty) {
        _comments.add(_commentController.text);
        _commentController
            .clear(); // Limpiar el campo de texto después de enviar
      }
    });
  }

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
                      'Nombre del Profesor',
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
                    _buildStars(5, filledStars: 4), // Calificación general
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
                _buildClassBox('Robótica', boxColor: Colors.grey[400]!),
                _buildClassBox('Física', boxColor: Colors.grey[400]!),
                _buildClassBox('S.M.P.', boxColor: Colors.grey[400]!),
                _buildClassBox('Proyecto I', boxColor: Colors.grey[400]!),
                _buildClassBox('S.A.P', boxColor: Colors.grey[400]!),
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
            // Campo de entrada y botón de enviar
            SizedBox(
              width: 600,
              child: TextField(
                controller: _commentController,
                decoration: InputDecoration(
                  hintText: 'Escribe tu comentario...',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.comment),
                    onPressed: _addComment,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Mostrar comentarios
            ..._comments.map((comment) => SizedBox(
                  width: 700,
                  child: Container(
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
                    child: Text(
                      comment,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                )),
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
