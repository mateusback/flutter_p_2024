import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_p_2024/app/domain/entities/grades.dart';
import 'package:flutter_p_2024/app/view/home_page_back.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final _back = HomePageBack();

  CircleAvatar circleAvatar(String url) {
    return Uri.tryParse(url)!.isAbsolute
        ? CircleAvatar(
            backgroundImage: NetworkImage(url),
          )
        : const CircleAvatar(
            child: Icon(Icons.developer_board),
          );
  }

  Widget iconEditButton(VoidCallback onPressed) {
    return IconButton(
      onPressed: onPressed,
      icon: const Icon(Icons.edit),
      color: Colors.orange,
    );
  }

  Widget iconRemoveButton(BuildContext context, VoidCallback onPressed) {
    return IconButton(
        icon: const Icon(Icons.delete),
        color: Colors.red,
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Excluir"),
                content: const Text("Confirma a exclusão?"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("Não"),
                  ),
                  TextButton(
                    onPressed: onPressed,
                    child: const Text("Sim"),
                  ),
                ],
              );
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Portal de Horas"),
          actions: [
            IconButton(
                onPressed: () {
                  _back.goToForm(context, Grades());
                },
                icon: const Icon(Icons.add))
          ],
        ),
        body: Observer(builder: (context) {
          return FutureBuilder(
              future: _back.list,
              builder: (context, futuro) {
                if (!futuro.hasData) {
                  return CircularProgressIndicator();
                }
                List<Grades> list = futuro.data!;
                return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, i) {
                    var disciplina = list[i];
                    return ListTile(
                      leading: circleAvatar(disciplina.urlAvatar!),
                      title: Text(disciplina.nome ?? ''),
                      subtitle: Text(disciplina.nota.toString() ?? ''),
                      trailing: Container(
                        width: 100,
                        child: Row(
                          children: [
                            iconEditButton(() {
                              _back.goToForm(context, disciplina);
                            }),
                            iconRemoveButton(context, () {
                              _back.remove(disciplina.id!);
                              Navigator.of(context).pop();
                            }),
                          ],
                        ),
                      ),
                    );
                  },
                );
              });
        }));
  }
}
