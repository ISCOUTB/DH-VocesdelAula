import 'package:flutter/material.dart';

class Temporal extends StatefulWidget {
  const Temporal({super.key});

  @override
  State<Temporal> createState() => _TemporalState();
}

class _TemporalState extends State<Temporal> {
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      
      children: [
        Container(
          color: Colors.blueAccent,
          height: 60,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.menu, color: Colors.white),
                onPressed: () {
                  // Puedes abrir un Drawer manualmente
                  print('Menú presionado');
                },
              ),
              const Text(
                'Mi AppBar',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              IconButton(
                icon: const Icon(Icons.search, color: Colors.white),
                onPressed: () {
                  // Acción de búsqueda
                  print('Buscar');
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}