String longestUniqueSubstring(String str) {
  String best = '';
  String current = '';

  for (int i = 0; i < str.length; i++) {
    String c = str[i];
    int index = current.indexOf(c);
    if (index != -1) {
      current = current.substring(index + 1);
    }
    current += c;
    if (current.length > best.length) {
      best = current;
    }
  }
  return best;
}