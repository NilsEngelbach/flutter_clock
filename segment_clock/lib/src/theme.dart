part of segment_clock;

enum _Element { background, segmentOn, segmentOff }

final Map<_Element, Color> _lightTheme = {
  _Element.background: Colors.teal.shade800,
  _Element.segmentOff: Color(0x1F004D40),
  _Element.segmentOn: Colors.tealAccent
};

final Map<_Element, Color> _darkTheme = {
  _Element.background: Colors.black54,
  _Element.segmentOff: Colors.black87,
  _Element.segmentOn: Colors.red
};
