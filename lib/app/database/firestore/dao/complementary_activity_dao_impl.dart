import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_p_2024/app/database/firestore/mapper/complementary_activity_mapper.dart';
import 'package:flutter_p_2024/app/domain/entities/complementary_activity.dart';
import 'package:flutter_p_2024/app/domain/interfaces/complementary_activity_dao.dart';

class ComplementaryActivityDaoImpl implements ComplementaryActivityDao {
  CollectionReference? subjectCollection;

  ComplementaryActivityDaoImpl() {
    subjectCollection =
        FirebaseFirestore.instance.collection('complementary_activity');
  }

  @override
  Future<List<ComplementaryActivity>> find() async {
    var result = await subjectCollection!.get();
    return result.docs
        .map(
          (doc) => ComplementaryActivityMapper.fromFirestore(doc),
        )
        .toList();
  }

  @override
  remove(id) async {
    await subjectCollection!.doc(id).delete();
  }

  @override
  save(ComplementaryActivity activity) async {
    await subjectCollection!
        .doc(activity.id)
        .set(ComplementaryActivityMapper.toMap(activity));
  }
}
