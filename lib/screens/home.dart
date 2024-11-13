import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isHovered = false;
  TextEditingController _searchController = TextEditingController();
  List<String> items = ['Profesor1', 'Profesor2', 'Profesor3', 'Profesor4'];
  List<String> filteredItems = [];

  @override
  void initState() {
    super.initState();
    filteredItems = items;
    _searchController.addListener(_filterItems);
  }

  void _filterItems() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredItems =
          items.where((item) => item.toLowerCase().contains(query)).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
        child: Stack(
          children: [
            Positioned(
              top: 100,
              right: -10,
              bottom: 100,
              child: MouseRegion(
                onEnter: (_) => setState(() => isHovered = true),
                onExit: (_) => setState(() => isHovered = false),
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 500),
                  opacity: isHovered ? 1.0 : 0.2,
                  child: Container(
                    width: 250,
                    height: 750,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 43, 185, 217),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ElevatedButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.settings, size: 24),
                              label: const Text('Configuraciones')),
                          const SizedBox(height: 20),
                          ElevatedButton.icon(
                              onPressed: () {
                                Navigator.pushNamed(context, '/profile');
                              },
                              icon: const Icon(Icons.person, size: 24),
                              label: const Text('Perfil')),
                          const SizedBox(height: 20),
                          ElevatedButton.icon(
                              onPressed: () {
                                Navigator.pushNamed(context, '/asignaturas');
                              },
                              icon: const Icon(Icons.book, size: 20),
                              label: const Text('Asignatura')),
                          const SizedBox(height: 20),
                          ElevatedButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.grade, size: 24),
                              label: const Text('Calificaciones')),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                const SizedBox(height: 25), // Espacio superior
                Container(
                  margin: EdgeInsets.only(left: 25),
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  width: size.width * 0.8,
                  child: const Text(
                    '¿A quien buscas?',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2f4f8d)),
                  ),
                ),
                const SizedBox(
                    height:
                        5), // Espacio entre el título y la barra de búsqueda
                Container(
                  margin: EdgeInsets.only(left: 25),
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  width: size.width * 0.8,
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFeeeeee),
                      hintText: 'Buscar...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      prefixIcon: const Icon(Icons.search),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                if (_searchController.text.isNotEmpty)
                  Expanded(
                    child: Center(
                      child: Container(
                        width: size.width * 0.7,
                        constraints:
                            BoxConstraints(minHeight: 100), // Altura mínima
                        child: ListView.builder(
                          itemCount: filteredItems.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 20),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 238, 233, 233),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: ListTile(
                                leading: Icon(
                                  Icons.person,
                                  color: Color(0xFF2f4f8d),
                                ),
                                title: Text(
                                  filteredItems[index],
                                  style: TextStyle(
                                    color: Color(0xFF2f4f8d),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onTap: () {
                                  if (filteredItems[index] == 'Profesor1') {
                                    Navigator.pushNamed(context, '/profesor');
                                  }
                                  if (filteredItems[index] == 'Profesor2') {
                                    Navigator.pushNamed(context, '/profesor2');
                                  }
                                  if (filteredItems[index] == 'Profesor3') {
                                    Navigator.pushNamed(context, '/profesor3');
                                  }
                                  if (filteredItems[index] == 'Profesor4') {
                                    Navigator.pushNamed(context, '/profesor4');
                                  }
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
