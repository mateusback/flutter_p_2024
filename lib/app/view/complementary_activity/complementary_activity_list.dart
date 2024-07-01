import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_p_2024/app/domain/entities/complementary_activity.dart';
import 'package:flutter_p_2024/app/domain/enum/e_activity_group.dart';
import 'package:flutter_p_2024/app/view/complementary_activity/complementary_activity_list_back.dart';

class ComplementaryActivityList extends StatelessWidget {
  final _back = ComplementaryActivityListBack();

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
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gerenciador de Horas Complementares"),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              _back.refreshList();
            },
          ),
          //TODO - REMOVER, FACILITA A NEGAVEGAÇÃO EM TESTES
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.of(context).pushNamed('/');
            },
          ),
        ],
      ),
      body: Observer(builder: (context) {
        return FutureBuilder(
          future: _back.list,
          builder: (context, futureData) {
            if (!futureData.hasData) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
                ),
              );
            }
            List<ComplementaryActivity> list = futureData.data!;

            Map<EActivityGroup, int> groupedHours = {};
            Map<EActivityGroup, List<ComplementaryActivity>> groupedActivities =
                {};
            for (var activity in list) {
              groupedHours[activity.group!] =
                  (groupedHours[activity.group] ?? 0) + activity.hours!;
              groupedActivities[activity.group!] =
                  (groupedActivities[activity.group] ?? [])..add(activity);
            }

            // Converter o mapa em uma lista de pares chave-valor
            List<MapEntry<EActivityGroup, int>> groupedHoursList =
                groupedHours.entries.toList();

            return ListView.builder(
              itemCount: groupedHoursList.length,
              itemBuilder: (context, i) {
                var entry = groupedHoursList[i];
                var group = entry.key;
                var totalHours = entry.value;

                return ListTile(
                  leading: CircleAvatar(
                      child: Text(group.toString().substring(15, 16))),
                  title: Text(group.toString().substring(15)),
                  subtitle: Text('Total de Horas: $totalHours'),
                  onTap: () {
                    _back.goToCertificates(
                        context, groupedActivities[group], group);
                  },
                );
              },
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implementar ação de adicionar nova atividade
        },
        backgroundColor: Colors.greenAccent,
        shape: CircleBorder(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
