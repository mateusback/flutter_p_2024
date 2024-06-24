class DomainLayerException implements Exception {
  String message;

  DomainLayerException(this.message);

  @override
  String toString() {
    return message;
  }
}
