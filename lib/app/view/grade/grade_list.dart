import 'package:flutter/material.dart';
import 'package:flutter_p_2024/app/domain/entities/subject.dart';

class GradeList extends StatelessWidget {
  Subject? subject;

  GradeList(BuildContext context) {
    var parameter = ModalRoute.of(context)?.settings.arguments;
    subject = (parameter == null) ? Subject() : parameter as Subject;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notas de ${subject!.name}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Professor: ${subject!.teacherName ?? ''}',
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            subject!.grades != null && subject!.grades!.isNotEmpty
                ? Table(
                    border: TableBorder.all(),
                    children: [
                      const TableRow(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Nota',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Trimestre',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                      ...subject!.grades!.map(
                        (grade) => TableRow(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(grade.value.toString()),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(grade.period.toString()),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                : const Text('Nenhuma nota disponível.'),
          ],
        ),
      ),
    );
  }
}
