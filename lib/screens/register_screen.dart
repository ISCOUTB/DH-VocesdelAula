import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<RegisterScreen> {
  final _registerKey = GlobalKey<FormState>();



  // Variables para almacenar las credenciales
  String _email = '';
  String _password = '';
  String _name = '';
  String _code = '';

  // Función para registrar al usuario
  void _register() async {
    if (_registerKey.currentState!.validate()) {
      _registerKey.currentState!.save();

      // Guardar credenciales en SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('email', _email);
      await prefs.setString('password', _password);
      await prefs.setString('name', _name);
      await prefs.setString('code', _code);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registro exitoso para $_name')),
      );

      // Redirigir o realizar alguna acción después del registro (opcional)
      Navigator.pushNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      //|--------------AppBar--------------|
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
                // Logo a la izquierda
                SizedBox(
                  width: 24,
                  height: 24,
                  child: Image.asset(
                    'assets/logo_v.png',
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(width: 8), // Espacio entre el logo y el título
                const Text(
                  'Registrate',
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

      //|--------------Body--------------|
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
                margin: const EdgeInsets.only(top: 0),
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
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: const EdgeInsets.only(top: 120, left: 20, right: 20),
                      width: 500,
                      height: 450,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFFffffff),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 15,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Form(
                        key: _registerKey,
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
                                decoration: const InputDecoration(labelText: 'Password'),
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
                            // Name
                            Container(
                              margin: const EdgeInsets.only(top: 30),
                              width: 400,
                              child: TextFormField(
                                decoration: const InputDecoration(labelText: 'Nombre'),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Por favor ingresa tu nombre';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _name = value ?? '';
                                },
                              ),
                            ),
                            // Código T000
                            Container(
                              margin: const EdgeInsets.only(top: 30),
                              width: 400,
                              child: TextFormField(
                                decoration: const InputDecoration(labelText: 'Código T000'),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Por favor ingresa tu código';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _code = value ?? '';
                                },
                              ),
                            ),
                            const SizedBox(height: 40),
                            // Botón de registro
                            SizedBox(
                              width: 150,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: _register,
                                style: TextButton.styleFrom(
                                  backgroundColor: const Color(0xFF2b448c),
                                ),
                                child: const Text(
                                  'Register',
                                  style: TextStyle(
                                    letterSpacing: 2.2,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
