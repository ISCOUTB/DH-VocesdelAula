import 'package:flutter/material.dart';
import 'package:voces_de_aula/screens/Base%20de%20datos/database_services.dart';
import 'package:voces_de_aula/screens/logeado/Home/ProfesorScreen.dart';
import 'package:voces_de_aula/screens/logeado/Home/profile.dart';
import 'package:voces_de_aula/screens/main_screen.dart';

class Home_Profesor extends StatefulWidget {
  const Home_Profesor({super.key, required int userT5});

  @override
  State<Home_Profesor> createState() => _Home_Profesor();
}

class _Home_Profesor extends State<Home_Profesor> {
  //
  String tipoUsuario = '';
  int T5 = 0;
  bool isHovered = false;
  final TextEditingController _searchController = TextEditingController();
  List<String> professors = [];
  List<String> filteredProfessors = [];
  final DatabaseServices _databaseServices = DatabaseServices();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterItems);
    _initializeData();
  }

  Future<void> _initializeData() async {
    await Future.delayed(const Duration(seconds: 3));
    await _loadUserType();
    await _loadProfessors();
    setState(() {
      isLoading = false;
    });
  }

  Future<void> _loadUserType() async {
    if (T5 != 0) {
      Map<String, dynamic>? userInfo =
          await _databaseServices.getUserDetail(T5);
      setState(() {
        tipoUsuario = userInfo?['Tipo_usuario'] ?? '';
      });
    }
  }

  Future<void> _loadProfessors() async {
    professors = await _databaseServices.getProfessors();
    setState(() {
      filteredProfessors = professors;
    });
  }

  void _filterItems() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredProfessors = professors
          .where((item) => item.toLowerCase().contains(query))
          .toList();
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
                        end: Alignment.bottomRight)),
                child: AppBar(
                    title: Row(children: <Widget>[
                      SizedBox(
                          width: 24,
                          height: 24,
                          child: Image.asset('assets/logo_v.png',
                              fit: BoxFit.contain)),
                      const SizedBox(width: 8),
                      const Text('Voces de aula',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              letterSpacing: 2.2,
                              color: Colors.white,
                              fontSize: 20))
                    ]),
                    backgroundColor: Colors.transparent))),
        body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.white, Color.fromARGB(255, 238, 233, 233)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight)),
            child: Stack(children: [
              Positioned(
                  top: 100,
                  right: -10,
                  bottom: 100,
                  child: MouseRegion(
                      onEnter: (_) => setState(() => isHovered = true),
                      onExit: (_) => setState(() => isHovered = false),
                      child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 500),
                          opacity: isHovered
                              ? 1.0
                              : 0.2, //Cada vez que paso el maus por acá vuelve y se actualiza
                          child: Container(
                              width: 250,
                              height: 750,
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 43, 185, 217),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ElevatedButton.icon(
                                            onPressed: () {},
                                            icon: const Icon(Icons.settings,
                                                size: 24),
                                            label:
                                                const Text('Configuraciones')),
                                        const SizedBox(height: 20),
                                        //No entra al perfil
                                        ElevatedButton.icon(
                                            onPressed: T5 != 0
                                                ? () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                ProfileScreen(
                                                                    userT5:
                                                                        T5)));
                                                  }
                                                : null,
                                            icon: const Icon(Icons.person,
                                                size: 24),
                                            label: const Text('Perfil')),
                                        const SizedBox(height: 20),
                                        ElevatedButton.icon(
                                            onPressed: () {},
                                            icon: const Icon(Icons.book,
                                                size: 20),
                                            label: const Text('Asignatura')),
                                        const SizedBox(height: 20),
                                        ElevatedButton.icon(
                                            onPressed: () {},
                                            icon: const Icon(Icons.grade,
                                                size: 24),
                                            label:
                                                const Text('Calificaciones')),
                                      ])))))),
              Column(children: [
                const SizedBox(height: 25), // Espacio superior
                Container(
                    margin: const EdgeInsets.only(left: 25),
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    width: size.width * 0.8,
                    child: const Text('¿A quien buscas?',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2f4f8d)))),
                const SizedBox(
                    height:
                        5), // Espacio entre el título y la barra de búsqueda
                Container(
                    margin: const EdgeInsets.only(left: 25),
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    width: size.width * 0.8,
                    child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0xFFeeeeee),
                            hintText: 'Buscar...',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)),
                            prefixIcon: const Icon(Icons.search)))),
                const SizedBox(height: 5),
                if (_searchController.text.isNotEmpty)
                  Expanded(
                      child: Center(
                          child: Container(
                              width: size.width * 0.7,
                              constraints: const BoxConstraints(
                                  minHeight: 100), // Altura mínima
                              child: ListView.builder(
                                  itemCount: filteredProfessors.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 20),
                                        decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                255, 238, 233, 233),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                  spreadRadius: 2,
                                                  blurRadius: 5,
                                                  offset: const Offset(0, 3))
                                            ]),
                                        child: ListTile(
                                            leading: const Icon(Icons.person,
                                                color: Color(0xFF2f4f8d)),
                                            title: Text(
                                                filteredProfessors[index],
                                                style: const TextStyle(
                                                    color: Color(0xFF2f4f8d),
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            trailing: IconButton(
                                                icon: const Icon(
                                                    Icons.arrow_forward,
                                                    color: Color(0xFF2f4f8d)),
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              ProfesorsScreen(
                                                                nombreProfesor:
                                                                    filteredProfessors[
                                                                        index],
                                                                nombreAsignatura:
                                                                    '',
                                                                nombreFacultad:
                                                                    '',
                                                                notas: '',
                                                                calificaciones:
                                                                    '',
                                                                T5: T5,
                                                              )));
                                                }),
                                            onTap: () {
                                              //Navegación según el profesor seleccionado
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ProfesorsScreen(
                                                            nombreProfesor:
                                                                filteredProfessors[
                                                                    index],
                                                            nombreAsignatura:
                                                                '',
                                                            nombreFacultad: '',
                                                            notas: '',
                                                            calificaciones: '',
                                                            T5: T5,
                                                          )));
                                            }));
                                  }))))
              ]),
              SafeArea(
                  child: Container(
                      margin: const EdgeInsets.only(top: 0),
                      width: double.infinity,
                      child: Align(
                          alignment: Alignment.topRight,
                          child: Row(mainAxisSize: MainAxisSize.min, children: [
                            IconButton(
                                icon: const Icon(Icons.exit_to_app,
                                    color: Colors.black, size: 50),
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const MainEscreen()));
                                })
                          ]))))
            ])));
  }
}
