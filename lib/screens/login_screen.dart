import 'package:flutter/material.dart';
import 'package:voces_de_aula/screens/Base%20de%20datos/database_services.dart';
import 'package:voces_de_aula/screens/logeado/Home/Home/Home_Alumnos.dart';
import 'package:voces_de_aula/screens/logeado/Home/Home/Home_Profesor.dart';
import 'package:voces_de_aula/screens/logeado/Home/Home/home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final int T5;
  final _loginKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

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
                    //automaticallyImplyLeading: false,
                    title: Row(children: <Widget>[
                      SizedBox(
                          width: 24,
                          height: 24,
                          child: Image.asset('assets/logo_v.png',
                              fit: BoxFit.contain)),
                      const SizedBox(width: 8),
                      const Text('Iniciar sesión',
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
            decoration: const BoxDecoration(color: Color(0xFFf2f2f2)),
            child: Stack(children: [
              Container(
                  width: double.infinity,
                  height: size.height * 0.4,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xFF2b448c), Color(0xFF2f4f8d)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight))),
              SafeArea(
                  child: Container(
                      margin: const EdgeInsets.only(top: 2),
                      width: double.infinity,
                      child: const Icon(Icons.person_pin,
                          color: Colors.white, size: 100))),
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Align(
                    alignment: Alignment.center,
                    child: Container(
                        margin: const EdgeInsets.only(
                            top: 120, left: 20, right: 20),
                        width: 470,
                        height: 300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xFFFFFFFF),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 15,
                                  offset: Offset(0, 5))
                            ]),
                        child: Form(
                            key: _loginKey,
                            child: Column(children: <Widget>[
                              // Email
                              Container(
                                  margin: const EdgeInsets.only(top: 30),
                                  width: 400,
                                  child: TextFormField(
                                      autocorrect: true,
                                      controller: _emailController,
                                      decoration: const InputDecoration(
                                        hintText: "ejemplo@hotmail.com",
                                        labelText: "Email",
                                        prefixIcon: Icon(Icons.email),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Por favor, ingrese su correo electronico';
                                        }
                                        if (!RegExp(
                                                r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                                            .hasMatch(value)) {
                                          return 'Ingrese un correo electrónico válido';
                                        }
                                        return null;
                                      })),

                              // Password
                              Container(
                                  margin: const EdgeInsets.only(top: 30),
                                  width: 400,
                                  child: TextFormField(
                                      obscureText: !_isPasswordVisible,
                                      controller: _passwordController,
                                      decoration: InputDecoration(
                                          labelText: "Password",
                                          prefixIcon: const Icon(Icons.lock),
                                          suffixIcon: IconButton(
                                              icon: Icon(_isPasswordVisible
                                                  ? Icons.visibility
                                                  : Icons.visibility_off),
                                              onPressed: () {
                                                setState(() {
                                                  _isPasswordVisible =
                                                      !_isPasswordVisible;
                                                });
                                              })))),
                              const SizedBox(height: 40),

                              //Botón de inicio de sección
                              SizedBox(
                                  width: 100,
                                  height: 50,
                                  child: ElevatedButton(
                                      onPressed: () async {
                                        if (_loginKey.currentState!
                                            .validate()) {
                                          String email = _emailController.text;
                                          String password =
                                              _passwordController.text;

                                          try {
                                            DatabaseServices db =
                                                DatabaseServices();

                                            //Obtén el T5 después de validar el Logín
                                            int? t5 = await db.EnterUser(
                                                email, password);

                                            if (t5 != null) {
                                              var userDetails =
                                                  await db.getUserDetail(t5);
                                              if (userDetails != null) {
                                                String userType =
                                                    userDetails['Tipo_usuario'];

                                                if (userType == 'Profesor') {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              Home_Profesor(
                                                                  userT5: t5)));
                                                } else if (userType ==
                                                    'Alumno') {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              Home_Alumno(
                                                                  userT5: t5)));
                                                }
                                              }
                                            } else {
                                              //Si los datos son incorrectos
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                      content: Text(
                                                          'Correo o clave incorrectos...')));
                                            }
                                          } catch (e) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                                    content: Text(
                                                        'Intente de nuevo')));
                                          }
                                        }
                                      },
                                      style: TextButton.styleFrom(
                                          backgroundColor:
                                              const Color(0xFF2b448c)),
                                      child: const Text('Login',
                                          style: TextStyle(
                                              letterSpacing: 1.5,
                                              color: Colors.white,
                                              fontSize: 16))))
                            ]))))
              ])
            ])));
  }
}
