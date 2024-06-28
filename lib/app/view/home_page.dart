import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Portal de Horas'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.access_time, // Ícone de relógio do Material Icons
              size: 100,
              color: Colors.lightGreen,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Ação ao pressionar o botão
              },
              child: const Text('Registrar Horas'),
            ),
          ],
        ),
      ),
    );
  }
}
