import 'package:flutter/material.dart';

void main() => runApp(const Home_chicas_calientes());

// ignore: camel_case_types
class Home_chicas_calientes extends StatelessWidget {
  const Home_chicas_calientes({super.key});

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
                  //Logo a la izquierda
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: Image.asset(
                      'assets/logo_v.png',
                      fit: BoxFit.contain,
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
