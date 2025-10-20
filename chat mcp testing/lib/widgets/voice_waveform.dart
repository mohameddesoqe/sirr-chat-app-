import 'package:flutter/material.dart';
import 'dart:math' as math;

class VoiceWaveform extends StatelessWidget {
  final bool isPlaying;
  final Color color;
  final double width;
  final double height;

  const VoiceWaveform({
    Key? key,
    this.isPlaying = false,
    this.color = Colors.blue,
    this.width = 120,
    this.height = 30,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: CustomPaint(
        painter: WaveformPainter(
          color: color,
          isPlaying: isPlaying,
        ),
      ),
    );
  }
}

class WaveformPainter extends CustomPainter {
  final Color color;
  final bool isPlaying;

  WaveformPainter({
    required this.color,
    required this.isPlaying,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    const barCount = 40;
    final barWidth = 2.0;
    final spacing = (size.width - (barCount * barWidth)) / (barCount - 1);

    // Generate waveform bars with varying heights
    final random = math.Random(42); // Fixed seed for consistent pattern
    for (int i = 0; i < barCount; i++) {
      final x = i * (barWidth + spacing);
      final normalizedHeight = 0.3 + (random.nextDouble() * 0.7);
      final barHeight = size.height * normalizedHeight;
      final y = (size.height - barHeight) / 2;

      canvas.drawLine(
        Offset(x, y),
        Offset(x, y + barHeight),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(WaveformPainter oldDelegate) => false;
}

