import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_p_2024/app/database/firestore/mapper/complementary_activity_mapper.dart';
import 'package:flutter_p_2024/app/domain/entities/complementary_activity.dart';
import 'package:flutter_p_2024/app/domain/enum/e_activity_group.dart';
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
  Future<int> getTotalHoursByGroup(EActivityGroup group) async {
    int totalHours = 0;
    var querySnapshot =
        await subjectCollection!.where('group', isEqualTo: group.index).get();
    for (var doc in querySnapshot.docs) {
      totalHours += (doc.data() as Map<String, dynamic>)['hours'] as int;
    }
    return totalHours;
  }

  @override
  Future<List<ComplementaryActivity>> findByGroup(EActivityGroup group) async {
    var result =
        await subjectCollection!.where('group', isEqualTo: group.index).get();
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
