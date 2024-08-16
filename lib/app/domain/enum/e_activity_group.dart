enum EActivityGroup {
  Ensino,
  Extensao,
  Social,
}

extension EActivityGroupExtension on EActivityGroup {
  static EActivityGroup fromInt(int value) {
    return EActivityGroup.values[value];
  }
}
