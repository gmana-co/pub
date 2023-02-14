extension HumanizedDuration on Duration {
  String toHumanizedString() {
    final seconds = '${inSeconds % 60}'.padLeft(2, '0');
    String minutes = '${inMinutes % 60}';
    if (inHours > 0 || inMinutes == 0) {
      minutes = minutes.padLeft(2, '0');
    }
    String value = '$minutes:$seconds';
    if (inHours > 0) {
      value = '$inHours:$minutes:$seconds';
    }
    return value;
  }
}
