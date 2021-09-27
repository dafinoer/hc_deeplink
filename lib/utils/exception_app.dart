



class MissingRequiredKeysException implements Exception {
  final String message;

  MissingRequiredKeysException._(this.message);

  factory MissingRequiredKeysException.keyError([String? message]){
    final messageResult = message ?? 'Key not found';
    return MissingRequiredKeysException._(messageResult);
  }

  @override
  String toString() {
    return 'MissingRequiredKeysException';
  }
}