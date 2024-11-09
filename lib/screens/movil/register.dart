import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RegisterPage(),
    );
  }
}

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2C4293), // Fondo con color #2C4293
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Icono de usuario en un contenedor circular
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person_add,
                  size: 50,
                  color: Color(0xFF2C4293),
                ),
              ),
              SizedBox(height: 20),
              
              // Contenedor para los campos de entrada
              Container(
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Nombre',
                        border: OutlineInputBorder(),
                        hintText: 'Ingresa tu nombre',
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                        hintText: 'Ingresa tu email',
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                        hintText: 'Ingresa tu contraseña',
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Codigo T000',
                        border: OutlineInputBorder(),
                        hintText: 'Ingresa tu código T000',
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF2C4293), // Color del botón #2C4293
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 15),
                        ),
                        onPressed: () {
                          // Acción del botón de registro
                        },
                        child: Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
