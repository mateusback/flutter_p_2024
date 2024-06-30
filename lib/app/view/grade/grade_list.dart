import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_p_2024/app/domain/entities/grade.dart';
import 'package:flutter_p_2024/app/domain/entities/subject.dart';
import 'package:flutter_p_2024/app/view/grade/grade_list_back.dart';

class GradeList extends StatelessWidget {
  final Subject? subject;
  late final GradeListBack _back;

  GradeList({this.subject});

  Widget iconEditButton(VoidCallback onPressed) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(Icons.edit),
      color: Colors.orange,
    );
  }

  Widget iconRemoveButton(BuildContext context, VoidCallback onPressed) {
    return IconButton(
      icon: const Icon(Icons.delete),
      color: Colors.red,
      onPressed: onPressed,
    );
  }

  @override
  Widget build(BuildContext context) {
    _back = GradeListBack(context, subject!);
    return Scaffold(
      appBar: AppBar(
        title: Text('Notas de ${subject!.name}'),
        actions: [
          IconButton(
            onPressed: () {
              _back.goToForm(context, Grade());
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Observer(
        builder: (context) {
          return FutureBuilder<List<Grade>>(
            future: _back.list,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('Nenhuma nota encontrada.'));
              }
              List<Grade> list = snapshot.data!;
              list.sort((a, b) => a.period!.compareTo(b.period!));
              return ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  var grade = list[index];
                  return ListTile(
                    leading:
                        CircleAvatar(child: Text(grade.period!.toString())),
                    title: Text('${grade.period}º Trimestre'),
                    subtitle: Text('Nota: ${grade.value}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        iconEditButton(() {
                          _back.goToForm(context, grade);
                        }),
                        iconRemoveButton(context, () {
                          _showDeleteDialog(context, grade);
                        }),
                      ],
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, Grade grade) {
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
              onPressed: () {
                _back.remove(context, grade);
              },
              child: const Text("Sim"),
            ),
          ],
        );
      },
    );
  }
}
