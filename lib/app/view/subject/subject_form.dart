import 'package:flutter/material.dart';
import 'package:flutter_p_2024/app/view/subject/subject_form_back.dart';

class SubjectForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();

  Widget fieldName(SubjectFormBack back) {
    var initValue = back.subject!.name;
    return TextFormField(
      validator: (String? value) => back.validateName(value!),
      onSaved: (newValue) => back.subject!.name = newValue!,
      initialValue: initValue ?? '',
      decoration: const InputDecoration(labelText: 'Nome da Matéria'),
    );
  }

  Widget fieldTeacher(SubjectFormBack back) {
    var initValue = back.subject!.teacherName;
    return TextFormField(
      validator: (String? value) => back.validateTeacher(value!),
      onSaved: (newValue) => back.subject!.teacherName = newValue!,
      initialValue: initValue ?? '',
      decoration: const InputDecoration(labelText: 'Nome do Professor'),
    );
  }

  Widget fieldPeriod(SubjectFormBack back) {
    int? selectedPeriod = back.subject?.period;

    return DropdownButtonFormField<int>(
      value: selectedPeriod,
      items: const [
        DropdownMenuItem(
          value: null,
          child: Text(
            'Selecione um item',
            style: TextStyle(color: Colors.grey),
          ),
        ),
        DropdownMenuItem(
          value: 1,
          child: Text('Primeiro Ano'),
        ),
        DropdownMenuItem(
          value: 2,
          child: Text('Segundo Ano'),
        ),
        DropdownMenuItem(
          value: 3,
          child: Text('Terceiro Ano'),
        ),
        DropdownMenuItem(
          value: 4,
          child: Text('Quarto Ano'),
        ),
      ],
      onChanged: (int? newValue) {
        if (newValue != null) {
          selectedPeriod = newValue;
        }
      },
      validator: (int? value) => back.validatePeriod((value!)),
      onSaved: (newValue) => back.subject!.period = newValue,
      decoration: const InputDecoration(labelText: 'Ano da Matéria'),
    );
  }

  @override
  Widget build(BuildContext context) {
    var _back = SubjectFormBack(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Matéria'),
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
              fieldName(_back),
              fieldTeacher(_back),
              fieldPeriod(_back),
            ],
          ),
        ),
      ),
    );
  }
}
