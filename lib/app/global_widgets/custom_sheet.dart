import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:orizon/app/core/constants/images_string.dart';
import 'package:orizon/app/core/theme/app_theme.dart';
import 'package:orizon/app/core/theme/text_theme.dart';

class CustomBottomSheet extends StatelessWidget {
  final String? title;
  final Widget body;
  final bool isCloseButtonvisible;
  const CustomBottomSheet({
    super.key,
    this.title,
    required this.body,
    this.isCloseButtonvisible = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(),
          height: 14,
          width: double.infinity,
          child: Stack(
            alignment: Alignment.topCenter,
            fit: StackFit.expand,
            children: [
              CustomPaint(
                painter: SheetCurePaint(),
              ),
              Positioned(
                  top: 2,
                  child: Container(
                    height: 3,
                    width: 31.w,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(4), color: Colors.white),
                  ))
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          decoration: BoxDecoration(
              color: AppTheme.apptheme.scaffoldBackgroundColor,
              border: Border.all(color: AppTheme.apptheme.scaffoldBackgroundColor)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              8.verticalSpace,
              Row(
                mainAxisAlignment:
                    title == null ? MainAxisAlignment.end : MainAxisAlignment.spaceBetween,
                children: [
                  if (title != null)
                  Text(
                      title!,
                    style: AppTextStyle.s18.medium.black,
                  ),
                  if (isCloseButtonvisible)
                  GestureDetector(
                      onTap: () => Get.back(),
                      child: SvgPicture.asset(
                        Images.cross_icon,
                        width: 30,
                      ))
                ],
              ),
              16.verticalSpace,
              body
            ],
          ),
        )
      ],
    );
  }
}

class SheetCurePaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.46, 10);
    path_0.cubicTo(size.width * 0.42, 10, size.width * 0.41, 0, size.width * 0.37, 0);
    path_0.lineTo(0, 0);

    path_0.lineTo(0, size.height);

    path_0.lineTo(size.width, size.height);
    path_0.lineTo(size.width, 0);
    path_0.lineTo(size.width * 0.63, 0);
    path_0.cubicTo(size.width * 0.59, 0, size.width * 0.58, 10, size.width * 0.54, 10);

    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = AppTheme.apptheme.scaffoldBackgroundColor;
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
