import 'package:flutter/material.dart';
import 'package:voces_de_aula/screens/Base%20de%20datos/database_services.dart';
import 'package:voces_de_aula/screens/logeado/Home/Home/Home_Alumnos.dart';
import 'package:voces_de_aula/screens/logeado/Home/Home/Home_Profesor.dart';

class Home extends StatefulWidget {
  final String userType;
  final int userT5;
  const Home({super.key, required this.userType, required this.userT5});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  String tipoUsuario = '';
  late int T5;
  bool isLoading = true;

  final TextEditingController _searchController = TextEditingController();
  List<String> professors = [];
  List<String> filteredProfessors = [];
  final DatabaseServices _databaseServices = DatabaseServices();

  @override
  void initState() {
    super.initState();
    T5 = widget.userT5;
    _searchController.addListener(_filterItems);
    _controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this)
          ..repeat();
    _initializeData();
  }

  Future<void> _initializeData() async {
    await _loadUserType();
    await _loadProfessors();
    if (!mounted) return;
    setState(() {
      isLoading = false;
    });
    _navigateToHome(); // Navegar una vez que los datos están listos
  }

  void _navigateToHome() {
    // Solo navega si isLoading es falso y el tipo de usuario está definido
    if (!isLoading && tipoUsuario.isNotEmpty) {
      if (tipoUsuario == 'profesor') {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return Home_Profesor(userT5: T5);
        }));
      } else if (tipoUsuario == 'alumno') {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return Home_Alumno(userT5: T5);
        }));
      }
    }
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
    _controller.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
          backgroundColor: Colors.white,
          body: Center(
              child: Stack(alignment: Alignment.center, children: [
            Align(
                alignment: Alignment.topCenter,
                child: Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Image.asset('assets/utb_logo.png',
                        width: 400, fit: BoxFit.contain))),
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              RotationTransition(
                  turns: _controller,
                  child: const Icon(Icons.autorenew,
                      size: 120, color: Colors.blueAccent)),
              const SizedBox(height: 20),
              const Text('Cargando...',
                  style: TextStyle(fontSize: 22, color: Colors.grey))
            ])
          ])));
    } else {
      _navigateToHome();
    }
    return const SizedBox.shrink();
  }
}
