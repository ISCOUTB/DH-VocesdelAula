import 'package:flutter/material.dart';

void main() => runApp(const ProfesorRatingApp());

class ProfesorRatingApp extends StatelessWidget {
  const ProfesorRatingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clasificación de Profesores',
      theme: ThemeData(
        primaryColor: const Color(0xFF2b448c),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xFF2f4f8d),
        ),
      ),
      home: const ProfesorDetailPage(),
    );
  }
}

class ProfesorDetailPage extends StatelessWidget {
  const ProfesorDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // AppBar con diseño flexible
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF2b448c), Color(0xFF2f4f8d)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
              title: const Row(
                children: [
                  SizedBox(width: 8),
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/logo_v.png'),
                    radius: 16,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Perfil del Profesor',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
          // Contenido principal
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Información del profesor
                  Card(
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          // Foto del profesor
                          CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.grey[300],
                            backgroundImage: 
                                const AssetImage('assets/foto_usuario.png'),
                          ),
                          const SizedBox(height: 16),
                          // Nombre y facultad
                          const Text(
                            'Nombre del Profesor #2',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Facultad de Ingeniería',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 16),
                          // Calificación
                          _buildRatingStars(5),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Sección de clases
                  const Text(
                    'Clases Impartidas',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildClassesGrid(),
                  const SizedBox(height: 24),

                  // Sección de comentarios
                  const Text(
                    'Comentarios de Estudiantes',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildCommentsList(),
                ],
              ),
            ),
          ),
        ],
      ),
      // FAB para agregar nuevo comentario
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF2b448c),
        child: const Icon(Icons.add_comment),
      ),
    );
  }

  Widget _buildRatingStars(int rating) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return Icon(
          index < rating ? Icons.star : Icons.star_border,
          color: Colors.amber,
          size: 24,
        );
      }),
    );
  }

  Widget _buildClassesGrid() {
    final classes = [
      'Ética',
      'Ciudadanía global',
      'Constitución política',
      'Escritura etnográfica',
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 2.5,
      ),
      itemCount: classes.length,
      itemBuilder: (context, index) {
        return Card(
          color: Colors.grey[300],
          child: Center(
            child: Text(
              classes[index],
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    );
  }

  Widget _buildCommentsList() {
    return Column(
      children: List.generate(2, (index) {
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey[300],
                      child: const Icon(Icons.person),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Text(
                        'Estudiante ${1}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 43, 185, 217),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const Text(
                  'Excelente profesor, explica los temas de forma clara y siempre está dispuesto a resolver dudas. Recomiendo asistir a sus clases y participar activamente.',
                  style: TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton.icon(
                      icon: const Icon(Icons.thumb_up_outlined),
                      label: const Text('Útil'),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}