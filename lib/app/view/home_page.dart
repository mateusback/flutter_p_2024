import 'package:flutter/material.dart';
import 'package:flutter_p_2024/app/navigation/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Portal de Horas'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.access_time,
              size: 100,
              color: Colors.lightGreen,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.COMPLEMENTARY_LIST);
              },
              child: const Text('Registrar Horas'),
            ),
            const SizedBox(height: 20),
            const Icon(
              Icons.hail,
              size: 100,
              color: Colors.redAccent,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO - COLOCAR AÇÃO
              },
              child: const Text('Registrar Faltas {EM DESENVOVIMENTO}'),
            ),
            const SizedBox(height: 20),
            const Icon(
              Icons.list,
              size: 100,
              color: Colors.blueAccent,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.SUBJECT_LIST);
              },
              child: const Text('Gerenciar Matérias'),
            ),
          ],
        ),
      ),
    );
  }
}
