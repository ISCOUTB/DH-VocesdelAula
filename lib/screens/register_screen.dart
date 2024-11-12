import 'package:flutter/material.dart';
import 'package:flutter/src/material/dropdown.dart';
import 'package:voces_de_aula/screens/Base%20de%20datos/database_services.dart';
import 'package:voces_de_aula/screens/logeado/Home/Home/home.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<RegisterScreen> {
  final _registerKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  bool _isPasswordVisible = false;
  String generatedCode = 'T000000000';

  //Nuevo estado para el tipo de usuario
  String? _selectedUserTye;
  final List<String> _userTypes = ['Profesor', 'Alumno'];
  final List<String> _subjects = [
    'Física 1-2-3',
    'Quimica 1-2',
    'Matemáticas',
    'Cálculo 1-2-3',
    'Álgebra',
    'Programación 1-2-3-4',
    'Matematicas Discretas',
    'Desarrollo de Software',
    'Ética',
    'Estadistica 1-2',
    'Ingeniería de Software',
    'Inteligencia Artificial',
    'Bases de Datos',
    'Humanidades',
    'Ingles 1-2-3-4-5-6',
    'Redes',
    'Formulación de Proyectos',
    'Algoritmo y Complejidad',
  ];
  String? _selectedSubject;

  @override
  void initState() {
    super.initState();
    _generateCode();
  }

  void _generateCode() {
    //Genera un código autómatico basado en el formulario T0XXXXXX
    final randomNumber =
        (10000 + (99999 - 10000) * (DateTime.now().millisecond / 999.0))
            .round();
    setState(() {
      generatedCode = 'T000$randomNumber';
    });
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
                        end: Alignment.bottomRight)),
                child: AppBar(
                    title: Row(children: <Widget>[
                      // Logo a la izquierda
                      SizedBox(
                          width: 24,
                          height: 24,
                          child: Image.asset('assets/logo_v.png',
                              fit: BoxFit.contain)),
                      const SizedBox(
                          width: 8), // Espacio entre el logo y el título
                      const Text('Registrate',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              letterSpacing: 2.2,
                              color: Colors.white,
                              fontSize: 20))
                    ]),
                    backgroundColor: Colors.transparent))),

        //|--------------Body--------------|
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
              const Positioned(
                  top: 100,
                  left: 910,
                  child:
                      Icon(Icons.person_pin, color: Colors.white, size: 100)),
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Expanded(
                    child: Align(
                        alignment: Alignment.center,
                        child: Container(
                            margin: const EdgeInsets.only(
                                top: 90, left: 20, right: 20),
                            width: 500,
                            height: 600,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xFFffffff),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 15,
                                      offset: Offset(0, 5))
                                ]),
                            child: Form(
                                key: _registerKey,
                                child: Column(children: <Widget>[
                                  Text("Código: $generatedCode",
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),

                                  const SizedBox(height: 10),
                                  // Código T000
                                  Container(
                                      margin: const EdgeInsets.only(top: 30),
                                      width: 400,
                                      child: TextFormField(
                                          controller: _codeController,
                                          decoration: const InputDecoration(
                                              labelText:
                                                  'Últimos 5 dígitos del Código',
                                              border: OutlineInputBorder(),
                                              filled: true,
                                              fillColor: Colors.white,
                                              prefixIcon:
                                                  Icon(Icons.text_fields)),
                                          keyboardType: TextInputType.number,
                                          maxLength: 5,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Por favor ingresa tu código';
                                            }
                                            if (value.length != 5 ||
                                                !RegExp(r'^\d{5}$')
                                                    .hasMatch(value)) {
                                              return 'Ingrese exactamente 5 dígitos numéricos';
                                            }
                                            return null;
                                          })),

                                  const SizedBox(height: 3),
                                  // Email
                                  Container(
                                      margin: const EdgeInsets.only(top: 5),
                                      width: 400,
                                      child: TextFormField(
                                          controller: _emailController,
                                          decoration: const InputDecoration(
                                              hintText: 'ejemplo@gmail.com',
                                              labelText: 'Email',
                                              border: OutlineInputBorder(),
                                              filled: true,
                                              fillColor: Colors.white,
                                              icon: Icon(Icons
                                                  .alternate_email_rounded)),
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Por favor ingresa tu correo';
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
                                      margin: const EdgeInsets.only(top: 5),
                                      width: 400,
                                      child: TextFormField(
                                          controller: _passwordController,
                                          obscureText: !_isPasswordVisible,
                                          decoration: InputDecoration(
                                              labelText: 'Password',
                                              border:
                                                  const OutlineInputBorder(),
                                              filled: true,
                                              fillColor: Colors.white,
                                              prefixIcon:
                                                  const Icon(Icons.lock),
                                              suffixIcon: IconButton(
                                                  icon: Icon(_isPasswordVisible
                                                      ? Icons.visibility
                                                      : Icons.visibility_off),
                                                  onPressed: () {
                                                    setState(() {
                                                      _isPasswordVisible =
                                                          !_isPasswordVisible;
                                                    });
                                                  })),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Por favor ingresa tu contraseña';
                                            }
                                            if (!RegExp(
                                                    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$&*~]).{8,}$')
                                                .hasMatch(value)) {
                                              return 'La contraseña debe contener al menos 8 caracteres, una letra mayúscula y un carácter especial..';
                                            }
                                            return null;
                                          })),

                                  const SizedBox(height: 3),
                                  // Name
                                  Container(
                                      margin: const EdgeInsets.only(top: 5),
                                      width: 400,
                                      child: TextFormField(
                                          controller: _nameController,
                                          decoration: const InputDecoration(
                                              labelText: 'Nombre',
                                              border: OutlineInputBorder(),
                                              filled: true,
                                              fillColor: Colors.white,
                                              prefixIcon: Icon(Icons.person)),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Por favor ingresa tu nombre';
                                            }
                                            return null;
                                          })),

                                  //Dropdown para seleccionar tipo de usuarios
                                  const SizedBox(height: 3),
                                  Container(
                                      width: 400,
                                      margin: const EdgeInsets.only(top: 5),
                                      child: DropdownButtonFormField<String>(
                                          value: _selectedUserTye,
                                          decoration: const InputDecoration(
                                              labelText: "Tipo de Usuario",
                                              border: OutlineInputBorder(),
                                              filled: true,
                                              fillColor: Colors.white,
                                              prefixIcon:
                                                  Icon(Icons.account_box)),
                                          items:
                                              _userTypes.map((String userType) {
                                            return DropdownMenuItem<String>(
                                                value: userType,
                                                child: Text(userType));
                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              _selectedUserTye = newValue;
                                              _selectedSubject = null;
                                            });
                                          })),

                                  const SizedBox(height: 3),
                                  if (_selectedUserTye == "Profesor")
                                    Container(
                                        width: 400,
                                        margin: const EdgeInsets.only(top: 5),
                                        child: DropdownButtonFormField<String>(
                                            value: _selectedSubject,
                                            decoration: const InputDecoration(
                                                labelText:
                                                    "Nombre de la Asignatura",
                                                border: OutlineInputBorder(),
                                                filled: true,
                                                fillColor: Colors.white,
                                                prefixIcon: Icon(Icons.book)),
                                            items:
                                                _subjects.map((String subject) {
                                              return DropdownMenuItem<String>(
                                                  value: subject,
                                                  child: Text(subject));
                                            }).toList(),
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                _selectedSubject = newValue;
                                              });
                                            },
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Por favor seleccione una asignatura';
                                              }
                                              return null;
                                            })),

                                  const SizedBox(height: 20),
                                  // Botón de registro
                                  Center(
                                      child: ElevatedButton(
                                          onPressed: () async {
                                            if (_registerKey.currentState!
                                                .validate()) {
                                              int T5 = int.parse(
                                                  _codeController.text);
                                              String name =
                                                  _nameController.text;
                                              String email =
                                                  _emailController.text;
                                              String password =
                                                  _passwordController.text;
                                              // ignore: non_constant_identifier_names
                                              String tipo_usuario =
                                                  _selectedUserTye!;
                                              // ignore: non_constant_identifier_names
                                              String nombre_Asing =
                                                  _selectedSubject ?? '';

                                              try {
                                                //Registrar el usuario en la base de datos
                                                DatabaseServices db =
                                                    DatabaseServices();
                                                await db.registerUser(
                                                    T5,
                                                    name,
                                                    email,
                                                    password,
                                                    tipo_usuario,
                                                    nombre_Asing);

                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Home(
                                                              userT5: T5,
                                                              userType:
                                                                  tipo_usuario,
                                                            ))); //Undefined name 'userT5'. Try correcting the name to one that is defined, or defining the name.

                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(const SnackBar(
                                                        content: Text(
                                                            'Registro Exitoso')));
                                              } catch (e) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                        content: Text(
                                                            e.toString())));
                                              }
                                            }
                                          },
                                          style: ElevatedButton.styleFrom(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 50,
                                                      vertical: 15),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30)),
                                              backgroundColor:
                                                  const Color(0xFF2b448c)),
                                          child: const Text('Register',
                                              style: TextStyle(
                                                  letterSpacing: 2.2,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 16))))
                                ])))))
              ])
            ])));
  }
}
