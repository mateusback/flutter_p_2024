enum EActivityGroup {
  ensino,
  extensao,
  social,
}

extension EActivityGroupExtension on EActivityGroup {
  static EActivityGroup fromInt(int value) {
    return EActivityGroup.values[value];
  }

  int toInt() {
    return this.index;
  }
}
