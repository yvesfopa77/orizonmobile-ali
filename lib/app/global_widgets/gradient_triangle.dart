import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orizon/app/core/theme/app_theme.dart';

class GradientTriangle extends StatelessWidget {
  final Widget child;
  const GradientTriangle({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppTheme.apptheme.scaffoldBackgroundColor,
      child: Stack(
        children: [
          CustomPaint(
            size: Size(double.infinity, 370.h),
            painter: TriangleShape(),
          ),
          child,
        ],
      ),
    );
  }
}

class TriangleShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Layer 1

    Paint paintFill0 = Paint()
      ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color.fromRGBO(216, 82, 2, 1).withOpacity(.2),
            Colors.white.withOpacity(0)
          ]).createShader(Offset.zero & size);

    Path path_0 = Path();
    path_0.moveTo(size.width, 0);
    path_0.lineTo(0, size.height);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(size.width, 0);
    path_0.close();

    canvas.drawPath(path_0, paintFill0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
