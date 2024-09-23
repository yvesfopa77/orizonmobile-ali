import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:orizon/app/core/constants/images_string.dart';
import 'package:orizon/app/core/theme/app_theme.dart';
import 'package:orizon/app/core/theme/text_theme.dart';

class IdListTile extends StatelessWidget {
  final bool isSelected;
  final String title;
  const IdListTile({
    super.key,
    required this.isSelected,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 82.h,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CustomPaint(
            painter: RPSCustomPainter(isSelected: isSelected),
          ),
          Positioned(
            top: 8.h,
            right: 8.w,
            child: Container(
              height: 13.r,
              width: 13.r,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      width: 1.5,
                      color: isSelected
                          ? AppTheme.peach_orange_color
                          : AppTheme.border_color)),
              child: Container(
                height: 7.r,
                width: 7.r,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected ? AppTheme.peach_orange_color : null),
              ),
            ),
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 14.w),
                height: 50.r,
                width: 50.r,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      isSelected ? AppTheme.white_color : AppTheme.black_color,
                ),
                child: SvgPicture.asset(
                  colorFilter: isSelected
                      ? const ColorFilter.mode(
                          AppTheme.yellow_color, BlendMode.srcIn)
                      : null,
                  Images.id_card_icon,
                  width: 24.r,
                  height: 24.r,
                ),
              ),
              20.horizontalSpace,
              Text(
                title,
                style: isSelected
                    ? AppTextStyle.s16.medium.white
                    : AppTextStyle.s16.medium.black,
              )
            ],
          )
        ],
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  final bool isSelected;
  RPSCustomPainter({
    required this.isSelected,
  });
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    path.moveTo(size.width * 0.9154519, size.height * 0.2439024);
    path.cubicTo(size.width * 0.9154519, size.height * 0.1091989,
        size.width * 0.8893469, 0, size.width * 0.8571429, 0);
    path.lineTo(size.width * 0.05830904, 0);
    path.cubicTo(size.width * 0.02610586, 0, 0, size.height * 0.1091989, 0,
        size.height * 0.2439024);
    path.lineTo(0, size.height * 0.7560976);
    path.cubicTo(0, size.height * 0.8908012, size.width * 0.02610583,
        size.height, size.width * 0.05830904, size.height);
    path.lineTo(size.width * 0.9416910, size.height);
    path.cubicTo(size.width * 0.9738950, size.height, size.width,
        size.height * 0.8908012, size.width, size.height * 0.7560976);
    path.lineTo(size.width, size.height * 0.5975610);
    path.cubicTo(
        size.width,
        size.height * 0.4628573,
        size.width * 0.9738950,
        size.height * 0.3536585,
        size.width * 0.9416910,
        size.height * 0.3536585);
    path.cubicTo(
        size.width * 0.9271983,
        size.height * 0.3536585,
        size.width * 0.9154519,
        size.height * 0.3045195,
        size.width * 0.9154519,
        size.height * 0.2439024);
    path.close();

    Paint paint = Paint()
      ..style = isSelected ? PaintingStyle.fill : PaintingStyle.stroke;
    paint.strokeWidth = 1;
    paint.color =
        isSelected ? AppTheme.peach_orange_color : AppTheme.border_color;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
