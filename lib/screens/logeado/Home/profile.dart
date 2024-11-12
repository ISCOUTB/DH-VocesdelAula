import 'package:flutter/material.dart';
import 'package:voces_de_aula/screens/Base%20de%20datos/database_services.dart';
import 'package:voces_de_aula/screens/logeado/Home/Home/home.dart';

class ProfileScreen extends StatefulWidget {
  final int userT5;
  const ProfileScreen({super.key, required this.userT5});

  @override
  // ignore: library_private_types_in_public_api
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Map<String, dynamic>? userDetails;

  @override
  void initState() {
    super.initState();
    _loadUserDetails();
  }

  Future<void> _loadUserDetails() async {
    //Llamamos a la función getUserDetails usando el T5 del usuario
    var details = await DatabaseServices().getProfesorDetails(widget.userT5);
    if (details != null) {
      setState() {
        userDetails = details;
      }
    } else {
      print('Error al cargar los detalles del usaurio');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Stack(children: <Widget>[
              Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xFF5b448c), Color(0xFF2f4f8d)])),
                  width: double.infinity,
                  height: size.height * 0.10,
                  child: AppBar(
                      automaticallyImplyLeading: false,
                      title: Row(children: [
                        SizedBox(
                            width: 24,
                            height: 24,
                            child: Image.asset('assets/logo_v.png',
                                fit: BoxFit.contain))
                      ]))),
              SafeArea(
                  child: Container(
                      margin: const EdgeInsets.only(top: 20),
                      width: double.infinity,
                      child: Align(
                          alignment: Alignment.topRight,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.home,
                                    color: Colors.black, size: 50),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Home(
                                                userT5: widget.userT5,
                                                userType: '',
                                              )));
                                },
                              )
                            ],
                          ))))
            ])));
  }
}
