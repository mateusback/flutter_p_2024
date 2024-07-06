import 'package:flutter/material.dart';
import 'package:flutter_p_2024/app/domain/entities/complementary_activity.dart';
import 'package:flutter_p_2024/app/domain/enum/e_activity_group.dart';
import 'package:flutter_p_2024/app/view/complementary_activity/certificate_list_back.dart';

class CertificateList extends StatelessWidget {
  final EActivityGroup? group;
  late final CertificateListBack back;

  CertificateList({Key? key, this.group}) : super(key: key) {
    back = CertificateListBack(group!);
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
                  onPressed: () {
                    Navigator.of(context).pop();
                    onPressed();
                  },
                  child: const Text("Sim"),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Atividades do Grupo ${group.toString().substring(15)}"),
      ),
      body: FutureBuilder<List<ComplementaryActivity>>(
        future: back.list,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Nenhuma atividade encontrada.'));
          } else {
            var activities = snapshot.data!;
            return ListView.builder(
              itemCount: activities.length,
              itemBuilder: (context, i) {
                var activity = activities[i];
                return ListTile(
                  leading: CircleAvatar(
                      child: Text(
                          activity.certificateName?.substring(0, 1) ?? '')),
                  title: Text(activity.certificateName ?? 'Sem Nome'),
                  subtitle: Text(
                      'Descrição: ${activity.description ?? 'Sem Descrição'}\nHoras: ${activity.hours}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      iconEditButton(() {
                        back.goToForm(context, activity);
                      }),
                      iconRemoveButton(context, () {
                        back.remove(activity.id);
                      }),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
