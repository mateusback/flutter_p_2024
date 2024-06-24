import 'package:flutter/material.dart';
import 'package:flutter_p_2024/app/view/grades_form_back.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class GradesForm extends StatelessWidget {
  GradesFormBack? _back;
  var _form = GlobalKey<FormState>();

  Widget textFieldNome() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Nome',
        hintText: 'Informe o nome da matéria',
      ),
      validator: (value) => _back!.validateName(value!),
      initialValue: _back!.grade!.nome,
      onSaved: (newValue) => _back!.grade!.nome = newValue!,
    );
  }

  Widget textFieldProfessor() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Professor',
        hintText: 'Informe o nome do professor',
      ),
      initialValue: _back!.grade!.professor,
      onSaved: (newValue) => _back!.grade!.professor = newValue!,
    );
  }

  Widget textFieldNota() {
    var nota = _back!.grade!.nota;
    var mask = MaskTextInputFormatter(mask: '##.##');
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Nota',
        hintText: 'Informe a nota da matéria',
      ),
      keyboardType: TextInputType.number,
      inputFormatters: [mask],
      initialValue: nota == null ? '' : nota.toString(),
      validator: (value) => _back!.validateNota(double.parse(value!)),
      onSaved: (newValue) => _back!.grade!.nota = double.parse(newValue!),
    );
  }

  Widget textFieldIcone() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Link Icone',
        hintText: 'Informe o endereço do ícone da matéria',
      ),
      initialValue: _back!.grade!.urlAvatar,
      onSaved: (newValue) => _back!.grade!.urlAvatar = newValue!,
    );
  }

  @override
  Widget build(BuildContext context) {
    _back = GradesFormBack(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Registro de Horas'),
          actions: [
            IconButton(
              onPressed: () {
                _form.currentState!.validate();
                _form.currentState!.save();
                if (_back!.isValid) {
                  _back!.save();
                  Navigator.of(context).pop();
                }
              },
              icon: const Icon(Icons.save),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: _form,
            child: Column(
              children: [
                textFieldNome(),
                textFieldProfessor(),
                textFieldNota(),
                textFieldIcone(),
              ],
            ),
          ),
        ));
  }
}
