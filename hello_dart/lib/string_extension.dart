extension StringExtension on String {
  String firstUpper() {
    final words = split(' ');
    final capWords = words.map((word) {
      return '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}';
    });
    return capWords.join(' ');
  }
}
