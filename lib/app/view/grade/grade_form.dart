import 'package:flutter/material.dart';
import 'package:flutter_p_2024/app/view/grade/grade_form_back.dart';

class GradeForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();

  Widget fieldValue(GradeFormBack back) {
    return TextFormField(
        validator: (String? value) => back.validateValue(value!),
        onSaved: (newValue) => back.grade?.value = double.parse(newValue!),
        initialValue: back.grade?.value.toString(),
        decoration: const InputDecoration(labelText: 'Nota:'));
  }

  Widget fieldPeriod(GradeFormBack back) {
    return TextFormField(
        validator: (String? value) => back.validatePeriod(value!),
        onSaved: (newValue) => back.grade?.period = int.parse(newValue!),
        initialValue: back.grade?.period.toString(),
        decoration: const InputDecoration(labelText: 'Trimestre:'));
  }

  @override
  Widget build(BuildContext context) {
    var _back = GradeFormBack(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Notas'),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                _form.currentState!.validate();
                _form.currentState!.save();
                if (_back.isValid) {
                  _back.save(context);
                  // BUG - NÃO FECHA A TELA
                  Navigator.of(context).pop();
                }
              })
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _form,
          child: Column(
            children: [
              fieldValue(_back),
              fieldPeriod(_back),
            ],
          ),
        ),
      ),
    );
  }
}
