import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orizon/app/core/theme/app_theme.dart';

class GradientTriangle extends StatelessWidget {
  final Widget child;
  final bool redBackGround;
  const GradientTriangle({
    super.key,
    required this.child,
    this.redBackGround = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppTheme.apptheme.scaffoldBackgroundColor,
      child: Stack(
        fit: redBackGround ? StackFit.expand : StackFit.loose,
        children: [
          if (redBackGround)
            const FractionallySizedBox(
              heightFactor: .5,
              alignment: Alignment.topCenter,
              child: ColoredBox(color: AppTheme.primary_color),
            ),
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
           AppTheme.primary_color.withOpacity(.2),
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
