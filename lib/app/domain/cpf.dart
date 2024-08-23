import 'package:flutter_p_2024/app/domain/interfaces/professor_dao.dart';
import 'package:get_it/get_it.dart';

class CPF {
  late List<int> _numerosCPF;
  final _repository = GetIt.I.get<IProfessorDao>();

  CPF(String cpf) {
    if (cpf.isEmpty) throw ArgumentError('CPF cannot be empty');

    cpf = removerPontuacao(cpf);

    if (!ehOnzeNumeros(cpf)) throw ArgumentError('CPF must have 11 digits');
    if (!ehValido(cpf)) throw ArgumentError('Invalid CPF');

    ehUnico(cpf).then((isUnique) {
      if (isUnique) throw ArgumentError('CPF already exists.');
      print('O CPF já existe.');
    });
  }

  String removerPontuacao(String cpf) {
    return cpf.replaceAll('-', '').replaceAll('.', '').trim();
  }

  bool ehOnzeNumeros(String cpf) {
    _numerosCPF = cpf.split('').map((e) => int.parse(e)).toList();
    return _numerosCPF.length == 11;
  }

  bool ehValido(String cpf) {
    var listaDigitos = _numerosCPF.sublist(0, 9);
    var sum = 0;
    var sum2 = 0;
    for (int i = 0; i < 9; i++) {
      sum += listaDigitos[i] * (i + 1);
      sum2 += listaDigitos[i] * i;
    }
    listaDigitos.add((sum % 11));
    sum2 += listaDigitos[9] * 9;
    listaDigitos.add((sum2 % 11));
    var isLastDigitValid = listaDigitos[10] == _numerosCPF[10];
    var isPenultimateDigitValid = listaDigitos[9] == _numerosCPF[9];
    return isLastDigitValid && isPenultimateDigitValid;
  }

  Future<bool> ehUnico(String cpf) {
    return _repository.cpfIsUnique(cpf).then((value) => value);
  }
}
