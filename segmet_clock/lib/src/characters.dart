part of segment_clock;

class SegmentDisplay {
  static const int TOP = 1;
  static const int MIDDLE = 2;
  static const int BOTTOM = 4;

  static const int LEFT_TOP = 8;
  static const int LEFT_BOTTOM = 16;

  static const int RIGHT_TOP = 32;
  static const int RIGHT_BOTTOM = 64;
}

extension on int {
  bool hasFlag(int flag) => (this & flag) == flag;
}

class CharactersToDisplay {
  static const int OFF = 0;
  static const int ZERO = SegmentDisplay.TOP |
      SegmentDisplay.LEFT_TOP |
      SegmentDisplay.LEFT_BOTTOM |
      SegmentDisplay.RIGHT_TOP |
      SegmentDisplay.RIGHT_BOTTOM |
      SegmentDisplay.BOTTOM;
  static const int ONE = SegmentDisplay.RIGHT_TOP | SegmentDisplay.RIGHT_BOTTOM;
  static const int TWO = SegmentDisplay.TOP |
      SegmentDisplay.RIGHT_TOP |
      SegmentDisplay.MIDDLE |
      SegmentDisplay.LEFT_BOTTOM |
      SegmentDisplay.BOTTOM;
  static const int THREE = SegmentDisplay.TOP |
      SegmentDisplay.RIGHT_TOP |
      SegmentDisplay.MIDDLE |
      SegmentDisplay.RIGHT_BOTTOM |
      SegmentDisplay.BOTTOM;
  static const int FOUR = SegmentDisplay.LEFT_TOP |
      SegmentDisplay.MIDDLE |
      SegmentDisplay.RIGHT_TOP |
      SegmentDisplay.RIGHT_BOTTOM;
  static const int FIVE = SegmentDisplay.TOP |
      SegmentDisplay.LEFT_TOP |
      SegmentDisplay.MIDDLE |
      SegmentDisplay.RIGHT_BOTTOM |
      SegmentDisplay.BOTTOM;
  static const int SIX = SegmentDisplay.TOP |
      SegmentDisplay.LEFT_TOP |
      SegmentDisplay.LEFT_BOTTOM |
      SegmentDisplay.MIDDLE |
      SegmentDisplay.RIGHT_BOTTOM |
      SegmentDisplay.BOTTOM;
  static const int SEVEN = SegmentDisplay.TOP |
      SegmentDisplay.RIGHT_TOP |
      SegmentDisplay.RIGHT_BOTTOM;
  static const int EIGHT = SegmentDisplay.TOP |
      SegmentDisplay.LEFT_TOP |
      SegmentDisplay.LEFT_BOTTOM |
      SegmentDisplay.MIDDLE |
      SegmentDisplay.RIGHT_TOP |
      SegmentDisplay.RIGHT_BOTTOM |
      SegmentDisplay.BOTTOM;
  static const int NINE = SegmentDisplay.TOP |
      SegmentDisplay.LEFT_TOP |
      SegmentDisplay.MIDDLE |
      SegmentDisplay.RIGHT_TOP |
      SegmentDisplay.RIGHT_BOTTOM |
      SegmentDisplay.BOTTOM;
  static const int A = SegmentDisplay.TOP |
      SegmentDisplay.LEFT_BOTTOM |
      SegmentDisplay.LEFT_TOP |
      SegmentDisplay.MIDDLE |
      SegmentDisplay.RIGHT_BOTTOM |
      SegmentDisplay.RIGHT_TOP;
  static const int P = SegmentDisplay.TOP |
      SegmentDisplay.LEFT_BOTTOM |
      SegmentDisplay.LEFT_TOP |
      SegmentDisplay.MIDDLE |
      SegmentDisplay.RIGHT_TOP;
  static const int MINUS = SegmentDisplay.MIDDLE;
  static const int DEGREE = SegmentDisplay.TOP |
      SegmentDisplay.LEFT_TOP |
      SegmentDisplay.MIDDLE |
      SegmentDisplay.RIGHT_TOP;
  static const int F = SegmentDisplay.TOP |
      SegmentDisplay.LEFT_BOTTOM |
      SegmentDisplay.LEFT_TOP |
      SegmentDisplay.MIDDLE;
  static const int C = SegmentDisplay.TOP |
      SegmentDisplay.LEFT_BOTTOM |
      SegmentDisplay.LEFT_TOP |
      SegmentDisplay.BOTTOM;

  static int numberStringToCharacterToDisplay(String str) {
    switch (str) {
      case "0":
        return CharactersToDisplay.ZERO;
      case "1":
        return CharactersToDisplay.ONE;
      case "2":
        return CharactersToDisplay.TWO;
      case "3":
        return CharactersToDisplay.THREE;
      case "4":
        return CharactersToDisplay.FOUR;
      case "5":
        return CharactersToDisplay.FIVE;
      case "6":
        return CharactersToDisplay.SIX;
      case "7":
        return CharactersToDisplay.SEVEN;
      case "8":
        return CharactersToDisplay.EIGHT;
      case "9":
        return CharactersToDisplay.NINE;
      case "-":
        return CharactersToDisplay.MINUS;
      default:
        return CharactersToDisplay.OFF;
    }
  }
}
