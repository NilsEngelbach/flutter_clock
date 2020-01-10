part of segment_clock;

class SingleDigit extends StatelessWidget {
  final int numberToDisplay;

  final Map<_Element, Color> theme;

  SingleDigit(this.numberToDisplay, this.theme);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      var stroke = constraints.maxWidth ~/ 10;
      return Container(
        child: Stack(
          children: <Widget>[
            Positioned(
              left: stroke / 2,
              top: 0,
              child: CustomPaint(
                size: Size(constraints.maxWidth - stroke, stroke.toDouble()),
                painter: Segment(
                    this.numberToDisplay.hasFlag(SegmentDisplay.TOP),
                    stroke,
                    theme),
              ),
            ),
            Positioned(
              left: stroke / 2,
              top: constraints.maxHeight / 2 - stroke / 2,
              child: CustomPaint(
                size: Size(constraints.maxWidth - stroke, stroke.toDouble()),
                painter: Segment(
                    this.numberToDisplay.hasFlag(SegmentDisplay.MIDDLE),
                    stroke,
                    theme),
              ),
            ),
            Positioned(
              left: stroke / 2,
              top: constraints.maxHeight - stroke,
              child: CustomPaint(
                size: Size(constraints.maxWidth - stroke, stroke.toDouble()),
                painter: Segment(
                    this.numberToDisplay.hasFlag(SegmentDisplay.BOTTOM),
                    stroke,
                    theme),
              ),
            ),
            Positioned(
              left: 0,
              top: stroke / 2,
              child: RotatedBox(
                quarterTurns: 1,
                child: CustomPaint(
                  size: Size(constraints.maxHeight / 2 - stroke / 2,
                      stroke.toDouble()),
                  painter: Segment(
                      this.numberToDisplay.hasFlag(SegmentDisplay.LEFT_TOP),
                      stroke,
                      theme),
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: constraints.maxHeight / 2,
              child: RotatedBox(
                quarterTurns: 3,
                child: CustomPaint(
                  size: Size(constraints.maxHeight / 2 - stroke / 2,
                      stroke.toDouble()),
                  painter: Segment(
                      this.numberToDisplay.hasFlag(SegmentDisplay.LEFT_BOTTOM),
                      stroke,
                      theme),
                ),
              ),
            ),
            Positioned(
              left: constraints.maxWidth - stroke,
              top: stroke / 2,
              child: RotatedBox(
                quarterTurns: 1,
                child: CustomPaint(
                  size: Size(constraints.maxHeight / 2 - stroke / 2,
                      stroke.toDouble()),
                  painter: Segment(
                      this.numberToDisplay.hasFlag(SegmentDisplay.RIGHT_TOP),
                      stroke,
                      theme),
                ),
              ),
            ),
            Positioned(
              left: constraints.maxWidth - stroke,
              top: constraints.maxHeight / 2,
              child: RotatedBox(
                quarterTurns: 1,
                child: CustomPaint(
                  size: Size(constraints.maxHeight / 2 - stroke / 2,
                      stroke.toDouble()),
                  painter: Segment(
                      this.numberToDisplay.hasFlag(SegmentDisplay.RIGHT_BOTTOM),
                      stroke,
                      theme),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
