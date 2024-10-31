import 'dart:ui';
import 'dart:math';

class UiData {
  static const List<Color> _tileColors = [
    Color(0xffFFFAEB),
    Color(0xffFEF0F0),
    Color(0xffFFEFF9),
  ];

  static Color getRandomColor() {
    final random = Random();
    return _tileColors.elementAt(random.nextInt(3));
  }
}
