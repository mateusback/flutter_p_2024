import 'package:flutter/material.dart';
import 'package:flutter_p_2024/app/view/grade/grade_form_back.dart';

class GradeForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();

  Widget fieldValue(GradeFormBack back) {
    var initValue = back.grade?.value;
    return TextFormField(
      validator: (String? value) => back.validateValue(value!),
      onSaved: (newValue) => back.grade?.value = double.parse(newValue!),
      initialValue: initValue != null ? initValue.toString() : '',
      decoration: const InputDecoration(labelText: 'Nota:'),
    );
  }

  Widget fieldPeriod(GradeFormBack back) {
    int? selectedPeriod = back.grade?.period;

    return DropdownButtonFormField<int>(
      value: selectedPeriod,
      items: const [
        DropdownMenuItem(
          value: null,
          child: Text(
            'Selecione um Trimestre',
            style: TextStyle(color: Colors.grey),
          ),
        ),
        DropdownMenuItem(
          value: 1,
          child: Text('Primeiro Trimestre'),
        ),
        DropdownMenuItem(
          value: 2,
          child: Text('Segundo Trimestre'),
        ),
        DropdownMenuItem(
          value: 3,
          child: Text('Terceiro Trimestre'),
        ),
      ],
      onChanged: (int? newValue) {
        if (newValue != null) {
          selectedPeriod = newValue;
        }
      },
      validator: (int? value) => back.validatePeriod(value.toString()),
      onSaved: (newValue) => back.grade?.period = newValue,
      decoration: const InputDecoration(labelText: 'Trimestre:'),
    );
  }

  @override
  Widget build(BuildContext context) {
    var _back = GradeFormBack(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Notas'),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                _form.currentState!.validate();
                _form.currentState!.save();
                if (_back.isValid) {
                  _back.save(context);
                  //BUG - ATUALIZAR A LISTA DEPOIS DE SALVAR
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
