part of segment_clock;

class Points extends StatefulWidget {
  final Map<_Element, Color> theme;
  Points(this.theme);

  @override
  _PointsState createState() => _PointsState();
}

class _PointsState extends State<Points> {
  Timer _timer;
  bool visible = false;

  _PointsState();

  void _updateVisibility() {
    visible = !visible;
    setState(() {
      _timer = Timer(
        Duration(seconds: 1),
        _updateVisibility,
      );
    });
  }

  @override
  void initState() {
    super.initState();
    _updateVisibility();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      var stroke = constraints.maxWidth - 10;
      return Container(
        child: Stack(children: <Widget>[
          Positioned(
            left: stroke / 2,
            top: constraints.maxHeight / 3 - stroke / 2,
            child: Container(
              width: stroke / 2,
              height: stroke / 2,
              decoration: ShapeDecoration(
                color: visible
                    ? widget.theme[_Element.segmentOn]
                    : widget.theme[_Element.segmentOff],
                shape: CircleBorder(),
              ),
            ),
          ),
          Positioned(
            left: stroke / 2,
            top: constraints.maxHeight / 3 * 2,
            child: Container(
              width: stroke / 2,
              height: stroke / 2,
              decoration: ShapeDecoration(
                color: visible
                    ? widget.theme[_Element.segmentOn]
                    : widget.theme[_Element.segmentOff],
                shape: CircleBorder(),
              ),
            ),
          )
        ]),
      );
    });
  }
}
