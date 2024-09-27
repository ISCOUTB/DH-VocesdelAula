import 'package:flutter/material.dart';
import 'package:voces_de_aula/Inicio/screens/bases%20de%20datos/data_base/database_services.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  bool _isPasswordVisible = false; //Controla la visibilidad de la contraseña
  String generatedCode = "T000000000";

  //Nuevo estado para el tipo de usuario
  // ignore: unused_field, non_constant_identifier_names
  String? _tp_usu;

  @override
  void initState() {
    super.initState();
    _generateCode(); //Generar código al inicio
  }

  void _generateCode() {
    //Genera un código automático basado en el formulario T000XXXXX
    final randomNumber =
        (10000 + (99999 - 10000) * (DateTime.now().millisecond / 999.0))
            .round();
    setState(() {
      generatedCode = 'T000$randomNumber';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
          key: _formKey,
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Código: $generatedCode",
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),

              const SizedBox(height: 20),

              //Campo código (último 5 dígitos del código generado)
              TextFormField(
                controller: _codeController, //Controlador para el código
                decoration: const InputDecoration(
                    labelText: "Ultimos 5 Dígitos del Código",
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.text_fields)),
                keyboardType: TextInputType.number,
                maxLength: 5, //Limitar a 4 dígitos
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese los últimos 5 dígitos del código';
                  }
                  if (value.length != 5 ||
                      !RegExp(r'^\d{5}$').hasMatch(value)) {
                    return 'Ingrese exactamente 5 dígitos numéricos';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              //Campo nombre
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                    labelText: "Nombre",
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.person)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese su nombre';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              //Campo Email
              TextFormField(
                autocorrect: false,
                controller: _emailController,
                decoration: const InputDecoration(
                  hintText: 'ejemplo1@hotmail.com',
                  labelText: "Correo Electrónico",
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                  icon: Icon(Icons.alternate_email_rounded),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese su correo electrónico';
                  }
                  if (!RegExp(
                          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                      .hasMatch(value)) {
                    return 'Ingrese un correo electrónico válido';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              //Campo Clave
              TextFormField(
                controller: _passwordController,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                    labelText: "Contraseña",
                    border: const OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(Icons.lock), //Icono de seguridad
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    )),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese su contraseña';
                  }
                  if (!RegExp(
                          r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$&*~]).{8,}$')
                      .hasMatch(value)) {
                    return 'La contraseña debe contener al menos 8 caracteres, una letra mayúscula y un carácter especial.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              //Dropdown para seleccionar tipo de usuario
              DropdownButtonFormField<String>(
                value: _tp_usu,
                decoration: const InputDecoration(
                  labelText: "Tipo de Usuario",
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.account_box),
                ),
                items: const [
                  DropdownMenuItem(value: 'Profesor', child: Text('Profesor')),
                  DropdownMenuItem(value: 'Alumno', child: Text('Alumno')),
                ],
                onChanged: (value) {
                  setState(() {
                    _tp_usu = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, seleccione el tipo de usuario';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        //Lógicva de la base de datos
                        int T5 = int.parse(_codeController.text);
                        String name = _nameController.text;
                        String email = _emailController.text;
                        String password = _passwordController.text;
                        String tipousuario = _tp_usu!;

                        try {
                          //Regostrar el usuario en la base de datos
                          DatabaseServices db = DatabaseServices();
                          await db.registerUser(
                              T5, name, email, password, tipousuario);

                          //Mostrar mensaje de éxito
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('Registro exitoso'),
                          ));
                        } catch (e) {
                          //Mostrar mensaje de error si hay un problema
                          // ignore: use_build_context_synchronously
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Error en el registro: $e'),
                          ));
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.blue,
                    ),
                    child: const Text("Registrarse")),
              )
            ],
          ))),
    );
  }
}
