part of segment_clock;

class Segment extends CustomPainter {
  final bool active;
  final int stroke;
  final Map<_Element, Color> theme;

  Segment(this.active, this.stroke, this.theme) {}

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color =
          this.active ? theme[_Element.segmentOn] : theme[_Element.segmentOff];
    final path = Path();
    path.moveTo(0.0, size.height / 2.0);
    path.lineTo(this.stroke / 2, size.height);
    path.lineTo(size.width - this.stroke / 2, size.height);
    path.lineTo(size.width, size.height / 2.0);
    path.lineTo(size.width - this.stroke / 2, 0.0);
    path.lineTo(this.stroke / 2, 0.0);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
