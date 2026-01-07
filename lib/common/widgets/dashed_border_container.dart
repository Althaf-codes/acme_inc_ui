import 'package:flutter/material.dart';

class DashedBorderContainer extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final Color color;
  final double strokeWidth;
  final List<double> dashPattern;
  final EdgeInsets padding;

  const DashedBorderContainer({
    super.key,
    required this.child,
    this.borderRadius = 12,
    this.color = Colors.grey,
    this.strokeWidth = 1.5,
    this.dashPattern = const [6, 4],
    this.padding = const EdgeInsets.all(8),
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _DashedBorderPainter(
        radius: borderRadius,
        color: color,
        strokeWidth: strokeWidth,
        dashPattern: dashPattern,
      ),
      child: child,
    );
  }
}

class _DashedBorderPainter extends CustomPainter {
  final double radius;
  final Color color;
  final double strokeWidth;
  final List<double> dashPattern;

  _DashedBorderPainter({
    required this.radius,
    required this.color,
    required this.strokeWidth,
    required this.dashPattern,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final rrect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Radius.circular(radius),
    );

    final path = Path()..addRRect(rrect);

    _drawDashedPath(canvas, path, paint);
  }

  void _drawDashedPath(Canvas canvas, Path path, Paint paint) {
    final dashWidth = dashPattern[0];
    final dashSpace = dashPattern[1];

    for (final metric in path.computeMetrics()) {
      double distance = 0;
      while (distance < metric.length) {
        final segmentLength = (distance + dashWidth).clamp(0, metric.length);

        canvas.drawPath(
          metric.extractPath(distance, segmentLength.toDouble()),
          paint,
        );

        distance += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant _DashedBorderPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.radius != radius ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.dashPattern != dashPattern;
  }
}

// class DashedBorderContainer extends StatelessWidget {
//   final Widget child;

//   const DashedBorderContainer({super.key, required this.child});

//   @override
//   Widget build(BuildContext context) {
//     return CustomPaint(
//       painter: _DashedBorderPainter(),
//       child: Padding(padding: const EdgeInsets.all(8), child: child),
//     );
//   }
// }

// class _DashedBorderPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.grey
//       ..strokeWidth = 1.5
//       ..style = PaintingStyle.stroke;

//     const dashWidth = 8;
//     const dashSpace = 4;

//     double x = 0;
//     while (x < size.width) {
//       canvas.drawLine(Offset(x, 0), Offset(x + dashWidth, 0), paint);
//       x += dashWidth + dashSpace;
//     }

//     double y = 0;
//     while (y < size.height) {
//       canvas.drawLine(
//         Offset(size.width, y),
//         Offset(size.width, y + dashWidth),
//         paint,
//       );
//       y += dashWidth + dashSpace;
//     }

//     x = size.width;
//     while (x > 0) {
//       canvas.drawLine(
//         Offset(x, size.height),
//         Offset(x - dashWidth, size.height),
//         paint,
//       );
//       x -= dashWidth + dashSpace;
//     }

//     y = size.height;
//     while (y > 0) {
//       canvas.drawLine(Offset(0, y), Offset(0, y - dashWidth), paint);
//       y -= dashWidth + dashSpace;
//     }
//   }

//   @override
//   bool shouldRepaint(_) => false;
// }
