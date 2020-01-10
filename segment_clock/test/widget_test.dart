// This is a basic Flutter widget test.

import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_clock_helper/customizer.dart';
import 'package:flutter_clock_helper/model.dart';

import 'package:segment_clock/segment_clock.dart';

void main() {
  testWidgets('Build clock', (WidgetTester tester) async {
    // Build clock and trigger a frame.
    await tester.pumpWidget(ClockCustomizer((ClockModel model) => SegmentClock(model)));
  });
}
