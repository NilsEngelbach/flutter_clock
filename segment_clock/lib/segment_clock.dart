// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library segment_clock;

import 'dart:async';

import 'package:flutter_clock_helper/model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

part 'src/single_digit.dart';
part 'src/characters.dart';
part 'src/points.dart';
part 'src/segment.dart';
part 'src/theme.dart';

class SegmentClock extends StatefulWidget {
  final ClockModel model;

  SegmentClock(this.model);

  @override
  _SegmentClockState createState() => _SegmentClockState();
}

class _SegmentClockState extends State<SegmentClock> {
  DateTime _dateTime = DateTime.now();
  Timer _timer;

  @override
  void initState() {
    super.initState();
    widget.model.addListener(_updateModel);
    _updateTime();
    _updateModel();
  }

  @override
  void didUpdateWidget(SegmentClock oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.model != oldWidget.model) {
      oldWidget.model.removeListener(_updateModel);
      widget.model.addListener(_updateModel);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    widget.model.removeListener(_updateModel);
    widget.model.dispose();
    super.dispose();
  }

  void _updateModel() {
    setState(() {
      // Cause the clock to rebuild when the model changes.
    });
  }

  void _updateTime() {
    setState(() {
      _dateTime = DateTime.now();
      _timer = Timer(
        Duration(minutes: 1) -
            Duration(seconds: _dateTime.second) -
            Duration(milliseconds: _dateTime.millisecond),
        _updateTime,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).brightness == Brightness.light
        ? _lightTheme
        : _darkTheme;
    final hour =
        DateFormat(widget.model.is24HourFormat ? 'HH' : 'hh').format(_dateTime);
    final splittedHour = hour.split('');
    final minute = DateFormat('mm').format(_dateTime);
    final splittedMinute = minute.split('');

    final splittedTemperatur = widget.model.temperatureString.split('');

    final double ratio = 1 / 1.7;

    return MaterialApp(
      theme: ThemeData.dark().copyWith(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: theme[_Element.background],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              // decoration: new BoxDecoration(color: Colors.black54),
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Container(
                constraints: BoxConstraints(maxWidth: 800.0, minWidth: 400.0),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(children: [
                    Row(children: [
                      Expanded(
                        flex: 10,
                        child: AspectRatio(
                          aspectRatio: ratio,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: SingleDigit(
                                CharactersToDisplay
                                    .numberStringToCharacterToDisplay(
                                        splittedHour[0]),
                                theme),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 10,
                        child: AspectRatio(
                          aspectRatio: ratio,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: SingleDigit(
                                CharactersToDisplay
                                    .numberStringToCharacterToDisplay(
                                        splittedHour[1]),
                                theme),
                          ),
                        ),
                      ),
                      Flexible(
                          flex: 3,
                          child: AspectRatio(
                              aspectRatio: 1 / 4, child: Points(theme))),
                      Expanded(
                        flex: 10,
                        child: AspectRatio(
                          aspectRatio: ratio,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: SingleDigit(
                                CharactersToDisplay
                                    .numberStringToCharacterToDisplay(
                                        splittedMinute[0]),
                                theme),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 10,
                        child: AspectRatio(
                          aspectRatio: ratio,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: SingleDigit(
                                CharactersToDisplay
                                    .numberStringToCharacterToDisplay(
                                        splittedMinute[1]),
                                theme),
                          ),
                        ),
                      )
                    ]),
                    Container(
                      constraints:
                          BoxConstraints(maxHeight: 60.0, minHeight: 2.0),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(7, 0, 7, 0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(children: [
                                    Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: Icon(
                                        Icons.cached,
                                        color: theme[_Element.segmentOff],
                                        size: 24.0,
                                        semanticLabel:
                                            'Text to announce in accessibility modes',
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: Icon(
                                        Icons.opacity,
                                        color: widget.model.weatherCondition ==
                                                WeatherCondition.rainy
                                            ? theme[_Element.segmentOn]
                                            : theme[_Element.segmentOff],
                                        size: 24.0,
                                        semanticLabel:
                                            'Text to announce in accessibility modes',
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: Icon(
                                        Icons.toys,
                                        color: widget.model.weatherCondition ==
                                                WeatherCondition.windy
                                            ? theme[_Element.segmentOn]
                                            : theme[_Element.segmentOff],
                                        size: 24.0,
                                        semanticLabel:
                                            'Text to announce in accessibility modes',
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: Icon(
                                        Icons.offline_bolt,
                                        color: widget.model.weatherCondition ==
                                                WeatherCondition.thunderstorm
                                            ? theme[_Element.segmentOn]
                                            : theme[_Element.segmentOff],
                                        size: 24.0,
                                        semanticLabel:
                                            'Text to announce in accessibility modes',
                                      ),
                                    )
                                  ]),
                                  Row(children: [
                                    Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: Icon(
                                        Icons.blur_on,
                                        color: widget.model.weatherCondition ==
                                                WeatherCondition.foggy
                                            ? theme[_Element.segmentOn]
                                            : theme[_Element.segmentOff],
                                        size: 24.0,
                                        semanticLabel:
                                            'Text to announce in accessibility modes',
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: Icon(
                                        Icons.ac_unit,
                                        color: widget.model.weatherCondition ==
                                                WeatherCondition.snowy
                                            ? theme[_Element.segmentOn]
                                            : theme[_Element.segmentOff],
                                        size: 24.0,
                                        semanticLabel:
                                            'Text to announce in accessibility modes',
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: Icon(
                                        Icons.wb_cloudy,
                                        color: widget.model.weatherCondition ==
                                                WeatherCondition.cloudy
                                            ? theme[_Element.segmentOn]
                                            : theme[_Element.segmentOff],
                                        size: 24.0,
                                        semanticLabel:
                                            'Text to announce in accessibility modes',
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: Icon(
                                        Icons.wb_sunny,
                                        color: widget.model.weatherCondition ==
                                                WeatherCondition.sunny
                                            ? theme[_Element.segmentOn]
                                            : theme[_Element.segmentOff],
                                        size: 24.0,
                                        semanticLabel:
                                            'Text to announce in accessibility modes',
                                      ),
                                    ),
                                  ])
                                ],
                              ),
                              Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    AspectRatio(
                                      aspectRatio: ratio,
                                      child: Padding(
                                        padding: EdgeInsets.all(3),
                                        child: Visibility(
                                          visible:
                                              splittedTemperatur.length >= 8,
                                          child: SingleDigit(
                                              splittedTemperatur.length >= 8
                                                  ? CharactersToDisplay
                                                      .numberStringToCharacterToDisplay(
                                                          splittedTemperatur[
                                                              splittedTemperatur
                                                                      .length -
                                                                  8])
                                                  : CharactersToDisplay.OFF,
                                              theme),
                                        ),
                                      ),
                                    ),
                                    AspectRatio(
                                      aspectRatio: ratio,
                                      child: Padding(
                                        padding: EdgeInsets.all(3),
                                        child: Visibility(
                                          visible:
                                              splittedTemperatur.length >= 7,
                                          child: SingleDigit(
                                              splittedTemperatur.length >= 7
                                                  ? CharactersToDisplay
                                                      .numberStringToCharacterToDisplay(
                                                          splittedTemperatur[
                                                              splittedTemperatur
                                                                      .length -
                                                                  7])
                                                  : CharactersToDisplay.OFF,
                                              theme),
                                        ),
                                      ),
                                    ),
                                    AspectRatio(
                                      aspectRatio: ratio,
                                      child: Padding(
                                        padding: EdgeInsets.all(3),
                                        child: Visibility(
                                          visible:
                                              splittedTemperatur.length >= 6,
                                          child: SingleDigit(
                                              CharactersToDisplay
                                                  .numberStringToCharacterToDisplay(
                                                      splittedTemperatur[
                                                          splittedTemperatur
                                                                  .length -
                                                              6]),
                                              theme),
                                        ),
                                      ),
                                    ),
                                    AspectRatio(
                                      aspectRatio: ratio,
                                      child: Padding(
                                        padding: EdgeInsets.all(3),
                                        child: SingleDigit(
                                            CharactersToDisplay
                                                .numberStringToCharacterToDisplay(
                                                    splittedTemperatur[
                                                        splittedTemperatur
                                                                .length -
                                                            5]),
                                            theme),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(1, 0, 1, 3),
                                      child: Container(
                                        width: 3,
                                        height: 3,
                                        decoration: ShapeDecoration(
                                            color: theme[_Element.segmentOn],
                                            shape: CircleBorder()),
                                      ),
                                    ),
                                    Container(
                                      constraints: BoxConstraints(
                                          maxHeight: 30.0, minHeight: 2.0),
                                      child: AspectRatio(
                                        aspectRatio: ratio,
                                        child: Padding(
                                          padding: EdgeInsets.all(3),
                                          child: SingleDigit(
                                              CharactersToDisplay
                                                  .numberStringToCharacterToDisplay(
                                                      splittedTemperatur[
                                                          splittedTemperatur
                                                                  .length -
                                                              3]),
                                              theme),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      constraints: BoxConstraints(
                                          maxHeight: 30.0, minHeight: 2.0),
                                      child: AspectRatio(
                                        aspectRatio: ratio,
                                        child: Padding(
                                          padding: EdgeInsets.all(3),
                                          child: SingleDigit(
                                              CharactersToDisplay.DEGREE,
                                              theme),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      constraints: BoxConstraints(
                                          maxHeight: 30.0, minHeight: 2.0),
                                      child: AspectRatio(
                                        aspectRatio: ratio,
                                        child: Padding(
                                          padding: EdgeInsets.all(3),
                                          child: SingleDigit(
                                              widget.model.unit ==
                                                      TemperatureUnit.celsius
                                                  ? CharactersToDisplay.C
                                                  : CharactersToDisplay.F,
                                              theme),
                                        ),
                                      ),
                                    ),
                                  ])
                            ]),
                      ),
                    )
                  ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
