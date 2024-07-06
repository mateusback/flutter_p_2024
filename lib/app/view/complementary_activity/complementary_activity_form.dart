import 'package:flutter/material.dart';
import 'package:flutter_p_2024/app/domain/enum/e_activity_group.dart';
import 'package:flutter_p_2024/app/view/complementary_activity/complementary_activity_form_back.dart';

class ComplementaryActivityForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  EActivityGroup? _group;
  var _hours0;
  var _hours1;
  var _hours2;

  Widget fieldCertificateName(ComplementaryActivityFormBack back) {
    var initValue = back.activity!.certificateName;
    return TextFormField(
      onSaved: (newValue) => back.activity!.certificateName = newValue!,
      initialValue: initValue != null ? initValue.toString() : '',
      decoration: const InputDecoration(labelText: 'Nome:'),
    );
  }

  Widget fieldDescription(ComplementaryActivityFormBack back) {
    var initValue = back.activity!.description;
    return TextFormField(
      onSaved: (newValue) => back.activity!.description = newValue!,
      initialValue: initValue != null ? initValue.toString() : '',
      decoration: const InputDecoration(labelText: 'Descrição:'),
    );
  }

  Widget filedHours(ComplementaryActivityFormBack back) {
    var initValue = back.activity!.hours;
    int hours = 0;
    if (_group != null) {
      _group!.index == 0
          ? _hours0.then((value) => hours = value)
          : _group!.index == 1
              ? _hours1.then((value) => hours = value)
              : _hours2.then((value) => hours = value);
    }
    return TextFormField(
      onSaved: (newValue) => back.activity!.hours = int.parse(newValue!),
      initialValue: initValue != null ? initValue.toString() : '',
      decoration: const InputDecoration(labelText: 'Quantidade de horas:'),
      validator: (value) =>
          back.validateHours(value?.toString() ?? 'null', hours, _group!),
    );
  }

  Widget fieldGroup(ComplementaryActivityFormBack back) {
    int? selectedPeriod = back.activity?.group?.index;
    return DropdownButtonFormField<int>(
      value: selectedPeriod,
      items: [
        const DropdownMenuItem(
          value: null,
          child: Text(
            'Selecione um grupo de atividade',
            style: TextStyle(color: Colors.grey),
          ),
        ),
        DropdownMenuItem(
          value: EActivityGroup.values[0].index,
          child: Text(back.describeEnum(EActivityGroup.values[0])),
        ),
        DropdownMenuItem(
          value: EActivityGroup.values[1].index,
          child: Text(back.describeEnum(EActivityGroup.values[1])),
        ),
        DropdownMenuItem(
          value: EActivityGroup.values[2].index,
          child: Text(back.describeEnum(EActivityGroup.values[2])),
        ),
      ],
      onChanged: (int? newValue) {
        if (newValue != null) {
          selectedPeriod = newValue;
          _group = EActivityGroupExtension.fromInt(newValue);
        }
      },
      onSaved: (newValue) => back.activity!.group =
          newValue != null ? EActivityGroup.values[newValue] : null,
      validator: (value) => back.validateGroup(value?.toString() ?? 'null'),
      decoration: const InputDecoration(labelText: 'Grupo:'),
    );
  }

  @override
  Widget build(BuildContext context) {
    var _back = ComplementaryActivityFormBack(context);
    _hours0 = _back.getHours(EActivityGroup.Ensino);
    _hours1 = _back.getHours(EActivityGroup.Extensao);
    _hours2 = _back.getHours(EActivityGroup.Social);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Certificados'),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                if (_form.currentState!.validate()) {
                  _form.currentState!.save();
                  if (_back.isValid) {
                    _back.save(context);
                  }
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
              fieldCertificateName(_back),
              fieldDescription(_back),
              filedHours(_back),
              fieldGroup(_back),
            ],
          ),
        ),
      ),
    );
  }
}
