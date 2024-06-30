import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_p_2024/app/domain/entities/subject.dart';
import 'package:flutter_p_2024/app/view/grade/grade_list_back.dart';

class GradeList extends StatelessWidget {
  Subject? subject;
  GradeListBack? _back;

  GradeList({this.subject}) {
    _back = GradeListBack(subject!.id);
  }

  Widget iconEditButton(VoidCallback onPressed) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(Icons.edit),
      color: Colors.orange,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notas de ${subject!.name}'),
        actions: [
          IconButton(
              onPressed: () {
                _back!.goToForm(context, subject);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Observer(builder: (context) {
        return FutureBuilder(
          future: _back!.list,
          builder: (context, futureData) {
            if (!futureData.hasData) {
              return const Center(
                  child: CircularProgressIndicator(
                color: Colors.green,
              ));
            }
            var list = futureData.data!;
            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, i) {
                var grade = list[i];
                return ListTile(
                  leading: CircleAvatar(
                      child: Text(grade.period?.toString()[0] ?? '')),
                  title: Text('${grade.period}º Trimestre'),
                  subtitle: Text('Nota: ${grade.value}'),
                  trailing: Container(
                    width: 150,
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            _back!.goToForm(context, subject);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            _back!.remove(subject!.id!, grade, context);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        );
      }),
    );
  }
}
