import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  // Simulación de autenticación
  void _login() {
    if (_loginKey.currentState!.validate()) {
      _loginKey.currentState!.save();

      // Simulación de autenticación (puedes conectar a un backend real)
      if (_email == 'admin@admin.com' && _password == '1234') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login exitoso')),
        );

        // Navegar a la pantalla principal
        Navigator.pushNamed(context, '/temporal');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Correo o contraseña incorrectos')),
        );
      }
    }
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
                  'Iniciar sesión',
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
        decoration: const BoxDecoration(color: Color(0xFFf2f2f2)),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: size.height * 0.4,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF2b448c), Color(0xFF2f4f8d)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            SafeArea(
              child: Container(
                margin: const EdgeInsets.only(top: 2),
                width: double.infinity,
                child: const Icon(
                  Icons.person_pin,
                  color: Colors.white,
                  size: 100,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: const EdgeInsets.only(top: 120, left: 20, right: 20),
                    width: 470,
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFFFFFFFF),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 15,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Form(
                      key: _loginKey,
                      child: Column(
                        children: <Widget>[
                          // Email
                          Container(
                            margin: const EdgeInsets.only(top: 30),
                            width: 400,
                            child: TextFormField(
                              decoration: const InputDecoration(labelText: 'Email'),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Por favor ingresa tu correo';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _email = value ?? '';
                              },
                            ),
                          ),
                          // Password
                          Container(
                            margin: const EdgeInsets.only(top: 30),
                            width: 400,
                            child: TextFormField(
                              decoration: const InputDecoration(labelText: 'Contraseña'),
                              obscureText: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Por favor ingresa tu contraseña';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _password = value ?? '';
                              },
                            ),
                          ),
                          const SizedBox(height: 40),
                          // Botón de login
                          SizedBox(
                            width: 100,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: _login,
                              style: TextButton.styleFrom(
                                backgroundColor: const Color(0xFF2b448c),
                              ),
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                  letterSpacing: 1.5,
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
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

// Pantalla principal
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página Principal'),
      ),
      body: Center(
        child: Text('Bienvenido a la página principal!'),
      ),
    );
  }
}
