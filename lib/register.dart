import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
            const Text(
              'Voces de aula', //
              style: TextStyle(
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
            
            
            },
            style: TextButton.styleFrom(backgroundColor: const Color(0xFF2b448c) ),
            child: const Text(
              'Registro',
              style: TextStyle(
                color: Colors.white, 
                fontWeight: FontWeight.w700,
                
              ),
            ),
          ),
          const SizedBox(width: 16),
          
        ],





      ),






      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.grey[200], // Color del texto del botón
            borderRadius: BorderRadius.circular(20), // Rounded corners del botón
            border: Border.all(
                color: const Color(0xFF088c5c),  // Borde azul
                width: 5,
              ),

            
          ),
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              //logo utb
              SizedBox(
                width: size.width *0.1,
                child: Image.asset(
                  'assets/logo_v.png',
                  fit: BoxFit.contain,
                ),

              ),
              const SizedBox(height: 30,),

              //email
              SizedBox(
                width: size.width *0.4,
                child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    color:  Color(0xFFb7d93d),
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  )
                ),
                
                
                
                
                onChanged: (value) {},),
                ),
              const SizedBox(height: 60,),
              //password
              SizedBox(
                width: size.width *0.4,
                child: TextField(
                keyboardType: TextInputType.visiblePassword,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    color:  Color(0xFF2b448c),
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  )
                ),
                
                
                
                
                onChanged: (value) {},),
                ),
              
              const SizedBox(height: 40,),
              //botón de login
              SizedBox(
                width: 130,
                height: 50,
                child: ElevatedButton(onPressed: () => {}, 
              style: TextButton.styleFrom(backgroundColor: const Color(0xFF2b448c),),
              
              child: const Text('Register',
              style: TextStyle(
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
    );
  }
}