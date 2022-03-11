import 'dart:async';
import 'package:analog_clock/analog_clock.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Clock extends StatefulWidget {
  const Clock({Key? key}) : super(key: key);

  @override
  State<Clock> createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  final dataTime = DateTime.now().toLocal();
  String? _now;
  // ignore: unused_field
  Timer? _everySecond;

  @override
  void initState() {
    super.initState();
    _now = _timeToString(DateTime.now());
    _everySecond = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      if (!mounted) return;
      setState(() {
        _now = _timeToString(DateTime.now());
      });
    });
  }

  String? _timeToString(DateTime now) {
    String timeString =
        "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}";
    return timeString;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF000000),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                ('ローマン・ベニー'),
                style: GoogleFonts.sourceCodePro(
                  fontSize: 24,
                  color: const Color(0xFFff94e0),
                  fontWeight: FontWeight.w500,
                ),
              ),
              AnalogClock(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.4,
                isLive: true,
                hourHandColor: const Color(0xFFff94e0),
                minuteHandColor: const Color(0xFFff94e0),
                numberColor: const Color(0xFFff94e0),
                tickColor: const Color(0xFFff94e0).withAlpha(100),
                secondHandColor: const Color(0xFFff59c7),
                showSecondHand: true,
                showNumbers: true,
                textScaleFactor: 1.0,
                showTicks: true,
                showDigitalClock: true,
                datetime: DateTime.now(),
              ),
              Text(
                _now!,
                style: GoogleFonts.sourceCodePro(
                  fontSize: 24,
                  color: const Color(0xFFff94e0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
