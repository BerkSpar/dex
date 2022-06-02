extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }

  String? pokename() {
    const names = {'mr-mime': 'mrmime', 'wormadam-plant': 'wormadam'};
    if (names.containsKey(this)) return names[this];
    return this;
  }
}
