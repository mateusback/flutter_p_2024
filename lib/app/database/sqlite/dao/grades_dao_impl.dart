import 'package:flutter_p_2024/app/database/sqlite/connection.dart';
import 'package:flutter_p_2024/app/domain/entities/grades.dart';
import 'package:flutter_p_2024/app/domain/interfaces/grades_dao.dart';
import 'package:sqflite/sqflite.dart';

class GradesDaoImpl implements GradesDao {
  Database? _db;

  @override
  Future<void> save(Grades grade) async {
    _db = await Connection.get();
    var sql;
    if (grade.id == null) {
      sql =
          'INSERT INTO grades (nome, professor, nota, url_avatar) VALUES (?, ?, ?, ?)';
      _db!.rawInsert(
          sql, [grade.nome, grade.professor, grade.nota, grade.urlAvatar]);
    } else {
      sql =
          'UPDATE grades SET nome = ?, professor = ?, nota = ?, url_avatar = ? WHERE id = ?';
      _db!.rawUpdate(sql,
          [grade.nome, grade.professor, grade.nota, grade.urlAvatar, grade.id]);
    }
  }

  @override
  Future<void> remove(int id) async {
    _db = await Connection.get();
    var sql = 'DELETE FROM grades WHERE id = ?';
    _db!.rawDelete(sql, [id]);
  }

  @override
  Future<List<Grades>> find() async {
    _db = await Connection.get();
    List<Map<String, dynamic>> resultado = await _db!.query('grades');
    List<Grades> grades = List.generate(resultado.length, (i) {
      var linha = resultado[i];
      return Grades(
        id: linha['id'],
        nome: linha['nome'],
        professor: linha['professor'],
        nota: linha['nota'],
        urlAvatar: linha['url_avatar'],
      );
    });
    return grades;
  }
}
