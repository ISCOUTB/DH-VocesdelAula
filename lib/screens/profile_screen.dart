import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

Future<Map<String, String?>> getStoredCredentials() async {
  // Obtiene la instancia de SharedPreferences
  SharedPreferences prefs = await SharedPreferences.getInstance();

  // Recupera el correo y la contraseña almacenados
  String? savedEmail = prefs.getString('email');
  String? savedPassword = prefs.getString('password');
  String? savedName = prefs.getString('name');
  String? savedCode = prefs.getString('code');

  // Retorna las credenciales en un Map
  return {
    'email': savedEmail,
    'password': savedPassword,
    'name': savedName,
    'code': savedCode,
  };
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name = "John Doe";
  String career = "Ingeniería de Software";
  String studentCode = "T000#####";
  String email = "ejemplo@gmail.com";
  XFile? profileImage;

  @override
  void initState() {
    super.initState();
    loadCredentials(); // Cargar credenciales al iniciar el estado
  }

  Future<void> loadCredentials() async {
    // Llama a la función getStoredCredentials para obtener las credenciales
    final credentials = await getStoredCredentials();

    // Asigna los valores obtenidos a las variables del estado
    setState(() {
      email = credentials['email'] ?? "Email no disponible";
      name = credentials['name'] ?? "Nombre no disponible";
      studentCode = credentials['code'] ?? "Código no disponible";
    });
  }

  Future<void> pickImage() async {
    // Solicita permiso de almacenamiento
    if (await Permission.photos.request().isGranted) {
      final ImagePicker picker = ImagePicker();
      final XFile? pickedFile =
          await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        setState(() {
          profileImage = pickedFile;
        });
      }
    } else {
      // Muestra un mensaje o maneja el caso en que el usuario no da permiso
      print("Permission to access gallery was denied.");
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
        child: Center(
          child: Container(
            width: size.width * 0.6,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(
                width: 2,
                color: Colors.grey.withOpacity(0.2),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 3,
                  blurRadius: 5,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: pickImage,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: profileImage != null
                        ? FileImage(File(profileImage!.path))
                        : AssetImage('assets/foto_usuario.png')
                            as ImageProvider,
                    child: profileImage == null
                        ? const Icon(Icons.camera_alt,
                            color: Colors.white, size: 40)
                        : null,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  career,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "Código: $studentCode",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "Email: $email",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
