import 'package:flutter/material.dart';
import 'login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Voces de aula',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Voces de Aula'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        
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
            Text(
              widget.title, //
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xFF2b448c),

        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Login()),  // Navegar a la segunda página
            );
              // Acción del primer botón
              print('Login button pressed');
              
            },
            style: TextButton.styleFrom(backgroundColor: const Color.fromRGBO(60,50, 200, 0.6)),
            child: const Text(
              'Login',
              style: TextStyle(
                color: Colors.white, 
                
              ),
            ),
          ),
          const SizedBox(width: 16),
          TextButton(
            onPressed: () {
              // Acción del segundo botón
              print('Register button pressed');
            },
            style: TextButton.styleFrom(backgroundColor: const Color.fromRGBO(60,50, 200, 0.6)),
            child: const Text(
              'Register',
              style: TextStyle(
                color: Colors.white, // Color del texto del botón
              ),
            ),
          ),
        ],
        
      ),
      backgroundColor: Colors.grey[300],
      body: Center(

        

        child: Row(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Container(
              height: 580,
                width: 500,
                padding: const EdgeInsets.all(20),  // Añade relleno al contenedor
                alignment: Alignment.centerRight,
                color: const Color.fromRGBO(100, 100, 100, 0.8),

                child: const Column(
                  
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    Text(
                      'Voces de aula',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                    SizedBox(height: 20,),
                    Text(
                      'Voces de Aula es una aplicación diseñada para que los estudiantes universitarios compartan reseñas y opiniones sobre sus profesores, ayudando a otros estudiantes a tomar decisiones informadas al momento de inscribir sus materias. Con esta herramienta, podrás encontrar información basada en la experiencia de tus compañeros, lo que te permitirá elegir a los profesores que mejor se adapten a tus necesidades académicas.',
                      style: TextStyle(color: Colors.white),
                    ),

                    SizedBox(height: 20),
                    Text(
                      '¿Como funciona?', 
                      style:  TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,

                      ),
                      
                    
                      ),

                    SizedBox(height: 20),
                    
                    ListTile(
                            
                            title: Text('- Filtra las reseñas por facultad, carrera y materia para obtener resultados personalizados.', style: TextStyle(color: Colors.white)),
                          ),
                          ListTile(
                            
                            title: Text('- Cada profesor cuenta con una página de perfil donde puedes ver calificaciones en aspectos como claridad, metodología de enseñanza y evaluación, y actitud hacia los estudiantes.', style: TextStyle(color: Colors.white)),
                          ),
                          ListTile(
                            
                            title: Text('- Los comentarios detallados te ofrecerán una visión completa del estilo de enseñanza y ambiente en el aula.', style: TextStyle(color: Colors.white)),
                          ),
                  
                  ],


                ),

            ),
            
            
            const SizedBox(width: 50), // Espacio entre el logo y el botón de login

            Image.asset(
              'assets/logo_v.png',
              fit: BoxFit.contain,
              width: 500,
              height: 500,
              
              
            )
          ],

        ),
        
        
      ),
    );
  }
}
