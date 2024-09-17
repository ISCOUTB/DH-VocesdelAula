import 'package:flutter/material.dart';

class MainEscreen extends StatelessWidget {
  const MainEscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(

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
              'Voces de aula', //
              style: TextStyle(
                fontWeight: FontWeight.w300, //
                letterSpacing: 2.2,
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ],
        ),

        actions: <Widget>[
          TextButton(
            onPressed: () {
            
              Navigator.pushNamed(context, '/login');

              // Acción del primer botón
              print('Login button pressed');
              
            },
            style: TextButton.styleFrom(backgroundColor: Colors.transparent),
            child: const Text(
              'Login',
              style: TextStyle(
                
                letterSpacing: 2,
                fontSize: 17,
                color: Colors.white, 
                
              ),
            ),
          ),
          const SizedBox(width: 16),
          TextButton(
            onPressed: () {
              
              Navigator.pushNamed(context, '/register');
              // Acción del segundo botón
              print('Register button pressed');
            },
            style: TextButton.styleFrom(backgroundColor: Colors.transparent),
            child: const Text(
              'Register',
              style: TextStyle(
                letterSpacing: 2,
                fontSize: 17,
                color: Colors.white, // Color del texto del botón
              ),
            ),
          ),
        ],


        backgroundColor: Colors.transparent, // Color de la appbar transparente para que se vea el gradiente
        ),
        
      ),

      ),

      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.white, Color.fromARGB(255, 238, 233, 233)], // Colores del gradiente
              begin: Alignment.topLeft,            // Dirección de inicio del gradiente
              end: Alignment.bottomRight,
          ),
        ),

        child: Stack(

          children: [

            Container(

              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      width: size.width*0.2,
                    height: size.height*0.15,
                    decoration: const BoxDecoration(
                      color: Color(0xFFb7d93d),
                    )),
                  ),

                  Positioned(
                    top: 0,
                    left: 170,
                    child: Container(
                      width: size.width*0.1,
                    height: size.height*1,
                    decoration: const BoxDecoration(
                      color: Color(0xFFb7d93d),
                    )),
                  ),

                  Positioned(
                    top: 50,
                    right: 0,
                    child: Container(
                      width: size.width*0.2,
                    height: size.height*0.15,
                    decoration: const BoxDecoration(
                      color: Color(0xFF2bb9d9),
                    )),
                  ),

                  Positioned(
                    top: 50,
                    right: 150,
                    child: Container(
                      width: size.width*0.09,
                    height: size.height*0.8,
                    decoration: const BoxDecoration(
                      color: Color(0xFF2bb9d9),
                    )),
                  ),

                  Positioned(
                    bottom: 20,
                    right: 0,
                    child: Container(
                      width: size.width*0.2,
                    height: size.height*0.15,
                    decoration: const BoxDecoration(
                      color: Color(0xFF2bb9d9),
                    )),
                  ),
                ],
              ),

            ),

            

            //Descripcion
            Container(
              margin: EdgeInsets.only(top: size.height*0.08, bottom: 20, left: size.width*0.12),
              
              width: size.width*0.3,
              height: size.height*0.7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                gradient: const LinearGradient(
              colors: [Color(0xFF2b448c), Color(0xFF2f4f8d)], // Colores del gradiente
              begin: Alignment.topLeft,            // Dirección de inicio del gradiente
              end: Alignment.bottomRight,          // Dirección de fin del gradiente
            ),
              ),

              child: Container(

                margin: const EdgeInsets.only(top:20, right: 15, left: 15 ),


                child: const Column(
                  children: [
                    Text('Voces de Aula es una aplicación diseñada para que los estudiantes universitarios compartan reseñas y opiniones sobre sus profesores, ayudando a otros estudiantes a tomar decisiones informadas al momento de inscribir sus materias. Con esta herramienta, podrás encontrar información basada en la experiencia de tus compañeros, lo que te permitirá elegir a los profesores que mejor se adapten a tus necesidades académicas.',
                    textAlign: TextAlign.justify,
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    
                    style: TextStyle(
                      
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 0.4,
                    ),
                    
                    ),

                    SizedBox(height: 10),
                    ListTile(
                            
                            title: Text('- Filtra las reseñas por facultad, carrera y materia para obtener resultados personalizados.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              letterSpacing: 0.4,
                            ),
                            ),
                          ),
                          
                          ListTile(
                            
                            title: Text('- Los comentarios detallados te ofrecerán una visión completa del estilo de enseñanza y ambiente en el aula.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              letterSpacing: 0.4,
                            ),
                      ),
                          ),
                  ],
                ),

              


              ),

              

            ),

            //imagen de enfasis
            Container(

              margin: EdgeInsets.only(top: size.height*0.1, bottom: 20, left: size.width*0.56),

              width: size.width*0.3,
              height: size.height*0.8,
              child: Image.asset(
                'assets/logo_v.png',
                fit: BoxFit.contain,
              ),
              
            ),
          ],

        ),
      ),
      
      



    );
  }
}