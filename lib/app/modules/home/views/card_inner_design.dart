import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//Add this CustomPaint widget to the Widget Tree
class CardInnerDesign extends StatelessWidget {
  const CardInnerDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        CustomPaint(
          //  size: Size(343, 185),
          painter: CardInnerPaint(),
        ),
        Positioned(
          top: -30.h,
          right: -40.h,
          child: Container(
            height: 130.r,
            width: 130.r,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Colors.white.withOpacity(.2)),
          ),
        ),
        Positioned(
          top: 10.h,
          right: 60.h,
          child: Container(
            height: 58.r,
            width: 58.r,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Colors.white.withOpacity(.1)),
          ),
        )
      ],
    );
  }
}

//Copy this CustomPainter code to the Bottom of the File
class CardInnerPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.2415029, size.height * 0.04876097);
    path_0.cubicTo(size.width * 0.2307224, size.height * 0.01832773,
        size.width * 0.2124035, 0, size.width * 0.1927656, 0);
    path_0.lineTo(0, 0);

    path_0.lineTo(0, size.height);

    path_0.lineTo(size.width, size.height);

    path_0.lineTo(size.width, size.height * 0.3243243);
    path_0.cubicTo(
        size.width,
        size.height * 0.2646178,
        size.width * 0.9738950,
        size.height * 0.2162162,
        size.width * 0.9416910,
        size.height * 0.2162162);
    path_0.lineTo(size.width * 0.3322857, size.height * 0.2162162);
    path_0.cubicTo(
        size.width * 0.3126472,
        size.height * 0.2162162,
        size.width * 0.2943294,
        size.height * 0.1978886,
        size.width * 0.2835487,
        size.height * 0.1674551);
    path_0.lineTo(size.width * 0.2415029, size.height * 0.04876097);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xffD85202).withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
