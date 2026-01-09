import 'dart:math';

import 'package:acme_inc/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:waveform_flutter/waveform_flutter.dart';

class WaveFormExample extends StatefulWidget {
  const WaveFormExample({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WaveFormExampleState createState() => _WaveFormExampleState();
}

class _WaveFormExampleState extends State<WaveFormExample> {
  final Stream<Amplitude> _amplitudeStream = createRandomAmplitudeStream();

  final List<Amplitude> _sampleAmplitudes = [
    Amplitude(current: 12, max: 100),
    Amplitude(current: 22, max: 100),
    Amplitude(current: 22, max: 100),
    Amplitude(current: 35, max: 100),
    Amplitude(current: 12, max: 100),
    Amplitude(current: 35, max: 100),
    Amplitude(current: 35, max: 100),
    Amplitude(current: 22, max: 100),
    Amplitude(current: 18, max: 100),
    Amplitude(current: 12, max: 100),
    Amplitude(current: 18, max: 100),
    Amplitude(current: 30, max: 100),
    Amplitude(current: 30, max: 100),
    Amplitude(current: 12, max: 100),
    Amplitude(current: 12, max: 100),
    Amplitude(current: 12, max: 100),
    Amplitude(current: 35, max: 100),
    Amplitude(current: 12, max: 100),
    Amplitude(current: 12, max: 100),

    Amplitude(current: 35, max: 100),
    Amplitude(current: 35, max: 100),
    Amplitude(current: 35, max: 100),
    Amplitude(current: 35, max: 100),

    Amplitude(current: 12, max: 100),
    Amplitude(current: 22, max: 100),
    Amplitude(current: 22, max: 100),
    Amplitude(current: 35, max: 100),
    Amplitude(current: 12, max: 100),
    Amplitude(current: 35, max: 100),
    // Amplitude(current: 35, max: 100),
    // Amplitude(current: 22, max: 100),
    // Amplitude(current: 18, max: 100),
    // Amplitude(current: 12, max: 100),
    // Amplitude(current: 18, max: 100),
    // Amplitude(current: 30, max: 100),
    // Amplitude(current: 30, max: 100),
    // Amplitude(current: 12, max: 100),
    // Amplitude(current: 12, max: 100),
    // Amplitude(current: 12, max: 100),
    // Amplitude(current: 35, max: 100),
    // Amplitude(current: 12, max: 100),
    // Amplitude(current: 12, max: 100),
  ];

  @override
  Widget build(BuildContext context) {
    return AnimatedWaveList(
      stream: Stream.fromIterable(_sampleAmplitudes),
      barBuilder: (animation, amplitude) {
        return WaveFormBar(
          animation: animation,
          amplitude: amplitude,
          color: AppConstant.blackColor,
        );
      },
    );
  }
}
