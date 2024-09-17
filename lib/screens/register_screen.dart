import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<RegisterScreen> {
  final _registerKey = GlobalKey<FormState>();

  // ignore: unused_field
  String _email = '';
  // ignore: unused_field
  String _password = '';

  // ignore: unused_field
  String _name = '';

  // ignore: unused_field
  String _code = '';


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
              colors: [Color(0xFF2b448c), Color(0xFF2f4f8d)], // Colores del gradiente
              begin: Alignment.topLeft,            // Dirección de inicio del gradiente
              end: Alignment.bottomRight,          // Dirección de fin del gradiente
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
            // Título
            const Text(
              'Registrate', //
              style: TextStyle(
                fontWeight: FontWeight.w300, //
                letterSpacing: 2.2,
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ],
        ),

        


        backgroundColor: Colors.transparent, // Color de la appbar transparente para que se vea el gradiente
        ),
        
      ),

      ),


      //|--------------Body--------------|
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xFFf2f2f2)
        ),
        child: Stack(
          children: [

            

            Container(
              width: double.infinity,
              height: size.height*0.4,

              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF2b448c), Color(0xFF2f4f8d)], // Colores del gradiente
                  begin: Alignment.topLeft,            // Dirección de inicio del gradiente
                  end: Alignment.bottomRight,


                ),
              ),

            ),

            Container(

              child: Stack(
                children: [
                  Positioned(
                    top: 30,
                    left: 10,
                    child: Container(
                      width: size.width*0.2,
                    height: size.height*0.15,
                    decoration: const BoxDecoration(
                      color: Color(0xFF2f4f8d),
                    )),
                  ),

                  Positioned(
                    top: 90,
                    right: 10,
                    child: Container(
                      width: size.width*0.2,
                    height: size.height*0.15,
                    decoration: const BoxDecoration(
                      color: Color(0xFF2b448c),
                    )),
                  ),

                  Positioned(
                    top: 20,
                    right: 400,
                    child: Container(
                      width: size.width*0.1,
                    height: size.height*0.2,
                    decoration: const BoxDecoration(
                      color: Color(0xFF2b448c),
                    )),
                  ),

                  Positioned(
                    top: 150,
                    left: 340,
                    child: Container(
                      width: size.width*0.15,
                    height: size.height*0.15,
                    decoration: const BoxDecoration(
                      color: Color(0xFF2f4f8d),
                    )),
                  ),



                  
                ],
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
                            offset: Offset(0, 5)
                          )
                        ] 
                      ),
                  
                      child: Form(
                  
                        key: _registerKey,
                        child: Column(
                          children: <Widget>[
                            // Email
                            Container(
                              margin: const EdgeInsets.only(top: 30),
                              width: 400,
                              child: 
                                TextFormField(
                                  
                                  decoration: const InputDecoration(labelText: 'Email'),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Por favor ingresa tu correo';
                                    }
                                    return null; // Retorna null si no hay errores
                                  },
                                  onSaved: (value) {
                                    _email = value ?? '';
                                  },
                                ),
                              
                            ),
                            //Password
                            Container(
                              margin: const EdgeInsets.only(top: 30),
                              width: 400,
                              child: 
                                TextFormField(
                                  
                                  decoration: const InputDecoration(labelText: 'Password'),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Por favor ingresa tu contraseña';
                                    }
                                    return null; // Retorna null si no hay errores
                                  },
                                  onSaved: (value) {
                                    _email = value ?? '';
                                  },
                                ),
                            ),

                            //name
                            Container(
                              margin: const EdgeInsets.only(top: 30),
                              width: 400,
                              child: 
                                TextFormField(
                                  
                                  decoration: const InputDecoration(labelText: 'Nombre'),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Por favor ingresa tu nombre';
                                    }
                                    return null; // Retorna null si no hay errores
                                  },
                                  onSaved: (value) {
                                    _email = value ?? '';
                                  },
                                ),
                            ),

                            //codigo t000
                            Container(
                              margin: const EdgeInsets.only(top: 30),
                              width: 400,
                              child: 
                                TextFormField(
                                  
                                  decoration: const InputDecoration(labelText: 'Codigo T000'),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Por favor ingresa tu codigo';
                                    }
                                    return null; // Retorna null si no hay errores
                                  },
                                  onSaved: (value) {
                                    _email = value ?? '';
                                  },
                                ),
                            ),
                  
                            const SizedBox(height: 40),
                            // boton de login
                            SizedBox(
                              width: 150,
                              height: 50,
                              child: ElevatedButton(onPressed: () => {}, 
                              style: TextButton.styleFrom(backgroundColor: const Color(0xFF2b448c),),
                            
                              child: const Text('Register',
                                style: TextStyle(
                                  letterSpacing: 2.2,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize:16),
                                )
                              ),
                            ),
                          ],
                        ),
                      ),
                  
                  
                  ),
                  ),
                )
                
              ],

            ),
            
          ],
        ),
      ),
    );
  }
}