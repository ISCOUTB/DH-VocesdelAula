// ignore: file_names
import 'package:flutter/material.dart';
import 'package:voces_de_aula/Inicio/assets/Create_Page.dart';
import 'package:voces_de_aula/Inicio/assets/Login_screens.dart';

void main() => runApp(const LoginPage());

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controla la proporción de tamaño entre Login y Create
  double loginWidth = 0.5;
  double createWidth = 0.5;

  // Para saber si está pasando el cursor por Login o Create
  bool isHoveredLeft = false;
  bool isHoveredRight = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            // Fondo con gradiente
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 43, 185, 217), // Azul U
                    Color.fromARGB(255, 183, 217, 61), // Verde U
                  ],
                ),
              ),
              width: double.infinity,
              height: size.height,
            ),

            // Paneles de Login y Create
            Row(
              children: [
                // Panel de Login
                Expanded(
                  flex: (loginWidth * 100).toInt(),
                  child: MouseRegion(
                    onEnter: (_) => setState(() {
                      loginWidth = 0.7;
                      createWidth = 0.3;
                      isHoveredLeft = true;
                      isHoveredRight = false;
                    }),
                    onExit: (_) => setState(() {
                      loginWidth = 0.5;
                      createWidth = 0.5;
                      isHoveredLeft = false;
                      isHoveredRight = false;
                    }),
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 5),
                      curve: Curves.easeInOut,
                      color: const Color.fromARGB(255, 43, 185, 217),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Welcome Back!",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: isHoveredLeft ? 36 : 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 40),
                            AnimatedOpacity(
                              duration: const Duration(seconds: 5),
                              opacity: isHoveredLeft ? 1.0 : 0.5,
                              child: ElevatedButton(
                                onPressed: () {
                                  // Lógica para Sign Up
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const Createpage(),
                                      ));
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 43, 185, 217),
                                  foregroundColor:
                                      const Color.fromARGB(255, 0, 0, 0),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 40,
                                    vertical: 15,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                child: const Text("Sign Up"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                // Panel de Create
                Expanded(
                  flex: (createWidth * 100).toInt(),
                  child: MouseRegion(
                    onEnter: (_) => setState(() {
                      loginWidth = 0.3;
                      createWidth = 0.7;
                      isHoveredLeft = false;
                      isHoveredRight = true;
                    }),
                    onExit: (_) => setState(() {
                      loginWidth = 0.5;
                      createWidth = 0.5;
                      isHoveredLeft = false;
                      isHoveredRight = false;
                    }),
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 5),
                      curve: Curves.easeInOut,
                      color: const Color.fromARGB(255, 183, 217, 61),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Login to Account",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: isHoveredRight ? 28 : 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 40),
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: "Email",
                                  prefixIcon: Icon(Icons.email),
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 40),
                              child: TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  labelText: "Password",
                                  prefixIcon: Icon(Icons.lock),
                                  suffixIcon: Icon(Icons.visibility),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            TextButton(
                              onPressed: () {
                                // Lógica para "Forgot Password?"
                              },
                              child: const Text("Forgot Password?"),
                            ),
                            const SizedBox(height: 10),
                            AnimatedOpacity(
                              duration: const Duration(seconds: 5),
                              opacity: isHoveredRight ? 1.0 : 0.5,
                              child: ElevatedButton(
                                onPressed: () {
                                  // Lógica para Login
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 40,
                                    vertical: 15,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                child: const Text("Login"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Icono de inicio en la esquina superior derecha
            SafeArea(
              child: Container(
                margin: const EdgeInsets.only(top: 5),
                width: double.infinity,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Ícono del inicio
                      IconButton(
                        icon: const Icon(
                          Icons.home,
                          color: Colors.black,
                          size: 50,
                        ),
                        onPressed: () {
                          // Acción al presionar el ícono del inicio
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreens(),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
