import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Voces de Aula',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF2b448c),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xFF2f4f8d),
        ),
      ),
      // Definimos las rutas de navegación
      routes: {
        '/': (context) => const AsignaturasMobile(),
        '/profesor': (context) => const Placeholder(), // Reemplazar con tu página de Profesor1
        '/profesor2': (context) => const Placeholder(), // Reemplazar con tu página de Profesor2
        '/profesor3': (context) => const Placeholder(), // Reemplazar con tu página de Profesor3
        '/profesor4': (context) => const Placeholder(), // Reemplazar con tu página de Profesor4
      },
    );
  }
}

class AsignaturasMobile extends StatefulWidget {
  const AsignaturasMobile({super.key});

  @override
  State<AsignaturasMobile> createState() => _AsignaturasMobileState();
}

class _AsignaturasMobileState extends State<AsignaturasMobile> {
  // Lista de categorías de asignaturas
  final List<Map<String, List<String>>> categorias = [
    {
      'Humanidades': ['Ciudadania global', 'Escritura Etnografica', 'Etica', 'Constitución politica'],
    },
    {
      'Ingenierías': ['Robótica', 'Fisica', 'S.M.P', 'SAP'],
    },
    {
      'Matemáticas': [
        'Calculo I',
        'Calculo II',
        'Calculo III',
        'Algebra lineal',
        'Ecuaciones diferenciales',
        'Matematicas basica',
      ],
    },
  ];

  // Mapa de profesores por asignatura
  final Map<String, List<String>> profesoresPorAsignatura = {
    'Robótica': ['Profesor1'],
    'Ciudadania global': ['Profesor2'],
    'Escritura Etnografica': ['Profesor2'],
    'Etica': ['Profesor2'],
    'Constitución politica': ['Profesor2'],
    'Fisica': ['Profesor1'],
    'S.M.P': ['Profesor1'],
    'SAP': ['Profesor1'],
    'Calculo I': ['Profesor3', 'Profesor4'],
    'Calculo II': ['Profesor3', 'Profesor4'],
    'Calculo III': ['Profesor3'],
    'Algebra lineal': ['Profesor3'],
    'Ecuaciones diferenciales': ['Profesor3'],
    'Matematicas basica': ['Profesor3'],
  };

  // Variable para almacenar el texto de búsqueda
  String searchQuery = '';

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
              children: [
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
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Color.fromARGB(255, 238, 233, 233)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Asignaturas',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Barra de búsqueda
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    searchQuery = value.toLowerCase();
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Buscar asignatura...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Lista expandible de asignaturas
            Expanded(
              child: ListView.builder(
                itemCount: categorias.length,
                itemBuilder: (context, index) {
                  String categoria = categorias[index].keys.first;
                  List<String> asignaturas = categorias[index].values.first;
                  
                  // Filtrar asignaturas según la búsqueda
                  List<String> asignaturasFiltradas = asignaturas
                      .where((asignatura) => 
                          asignatura.toLowerCase().contains(searchQuery))
                      .toList();

                  // Solo mostrar categorías que tienen asignaturas que coinciden con la búsqueda
                  if (asignaturasFiltradas.isEmpty && searchQuery.isNotEmpty) {
                    return Container();
                  }

                  return ExpansionTile(
                    title: Text(
                      categoria,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2b448c),
                      ),
                    ),
                    children: asignaturasFiltradas.map((asignatura) {
                      return AsignaturaCard(
                        asignatura: asignatura,
                        profesores: profesoresPorAsignatura[asignatura] ?? [],
                      );
                    }).toList(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implementar funcionalidad para agregar asignatura
        },
        backgroundColor: const Color(0xFF2b448c),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class AsignaturaCard extends StatelessWidget {
  final String asignatura;
  final List<String> profesores;

  const AsignaturaCard({
    super.key,
    required this.asignatura,
    required this.profesores,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            builder: (context) => ProfesoresBottomSheet(
              asignatura: asignatura,
              profesores: profesores,
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  asignatura,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfesoresBottomSheet extends StatelessWidget {
  final String asignatura;
  final List<String> profesores;

  const ProfesoresBottomSheet({
    super.key,
    required this.asignatura,
    required this.profesores,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            asignatura,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2b448c),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Profesores disponibles:',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          ...profesores.map((profesor) => ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Color(0xFF2b448c),
                  child: Icon(Icons.person, color: Colors.white),
                ),
                title: Text(profesor),
                onTap: () {
                  Navigator.pop(context);
                  switch (profesor) {
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
                  }
                },
              )),
        ],
      ),
    );
  }
}