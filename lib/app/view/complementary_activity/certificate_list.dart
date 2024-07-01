import 'package:flutter/material.dart';
import 'package:flutter_p_2024/app/domain/entities/complementary_activity.dart';
import 'package:flutter_p_2024/app/domain/enum/e_activity_group.dart';

class CertificateList extends StatelessWidget {
  final EActivityGroup? group;
  final List<ComplementaryActivity>? activities;

  CertificateList({this.group, this.activities});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Atividades do Grupo ${group.toString().substring(15)}"),
      ),
      body: ListView.builder(
        itemCount: activities!.length,
        itemBuilder: (context, i) {
          var activity = activities![i];
          return ListTile(
            leading: CircleAvatar(
                child: Text(activity.certificateName?.substring(0, 1) ?? '')),
            title: Text(activity.certificateName ?? 'Sem Nome'),
            subtitle: Text(
                'Descrição: ${activity.description ?? 'Sem Descrição'}\nHoras: ${activity.hours}'),
          );
        },
      ),
    );
  }
}
