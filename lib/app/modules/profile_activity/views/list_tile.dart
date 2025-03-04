import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:orizon/app/core/constants/images_string.dart';
import 'package:orizon/app/core/theme/app_theme.dart';
import 'package:orizon/app/core/theme/text_theme.dart';

class ProfileActivityListTile extends StatelessWidget {
  final bool isSelected;
  final String title;
  final String subTitle;
  final String image;
  final bool isSingleTile;
  const ProfileActivityListTile({
    super.key,
    required this.isSelected,
    required this.title,
    required this.subTitle,
    required this.image,
    this.isSingleTile = false,
  });

  @override
  Widget build(BuildContext context) {
    return isSingleTile
        ? SizedBox(
            width: double.infinity - 16.w,
            height: 80.h,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CustomPaint(
                  painter: RPSCustomPainter(isSelected: isSelected),
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: Container(
                    height: 13.r,
                    width: 13.r,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: isSelected
                            ? AppTheme.primary_color
                            : Colors.transparent,
                        shape: BoxShape.circle,
                        border: Border.all(
                            width: 1.5,
                            color: isSelected
                                ? AppTheme.primary_color
                                : AppTheme.border_color)),
                    child: isSelected
                        ? SvgPicture.asset(
                            Images.tick,
                          )
                        : null,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 8,
                    left: 8,
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isSelected
                              ? AppTheme.white_color
                              : AppTheme.black_color,
                        ),
                        child: SvgPicture.asset(
                            colorFilter: ColorFilter.mode(
                                isSelected
                                    ? AppTheme.primary_color
                                    : AppTheme.white_color,
                                BlendMode.srcIn),
                            image,
                            width: 20,
                            height: 20),
                      ),
                      10.horizontalSpace,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: isSelected
                                ? AppTextStyle.s14.bold.white
                                : AppTextStyle.s14.bold.black,
                          ),
                          5.verticalSpace,
                          Text(
                            subTitle,
                            style: isSelected
                                ? AppTextStyle.s10.regular.white
                                : AppTextStyle.s10.regular.grey,
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        : SizedBox(
            width: (Get.width / 2) - 16.w - 6,
            height: 160.h,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CustomPaint(
                  painter: RPSCustomPainter(isSelected: isSelected),
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: Container(
                    height: 13.r,
                    width: 13.r,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: isSelected
                            ? AppTheme.primary_color
                            : Colors.transparent,
                        shape: BoxShape.circle,
                        border: Border.all(
                            width: 1.5,
                            color: isSelected
                                ? AppTheme.primary_color
                                : AppTheme.border_color)),
                    child: isSelected
                        ? SvgPicture.asset(
                            Images.tick,
                          )
                        : null,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 12,
                    right: 8,
                    left: 8,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isSelected
                              ? AppTheme.white_color
                              : AppTheme.black_color,
                        ),
                        child: SvgPicture.asset(
                            colorFilter: ColorFilter.mode(
                                isSelected
                                    ? AppTheme.primary_color
                                    : AppTheme.white_color,
                                BlendMode.srcIn),
                            image,
                            width: 20,
                            height: 20),
                      ),
                      10.verticalSpace,
                      Text(
                        title,
                        style: isSelected
                            ? AppTextStyle.s14.bold.white
                            : AppTextStyle.s14.bold.black,
                      ),
                      10.verticalSpace,
                      Text(
                        subTitle,
                        style: isSelected
                            ? AppTextStyle.s10.regular.white
                            : AppTextStyle.s10.regular.grey,
                      ),
                    ],
                  ),
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
  var border = 20.0;
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();

    path_0.moveTo(size.width - 25, 15);

    path_0.cubicTo(size.width - 25, 0, size.width - 40, 0, size.width - 40, 0);
    path_0.lineTo(border, 0);
    path_0.quadraticBezierTo(0, 0, 0, border);
    path_0.lineTo(0, size.height - border);
    path_0.quadraticBezierTo(0, size.height, border, size.height);
    path_0.lineTo(size.width - 20, size.height);
    path_0.quadraticBezierTo(
        size.width, size.height, size.width, size.height - 20);
    path_0.lineTo(size.width, 40);
    path_0.quadraticBezierTo(size.width, 25, size.width - 15, 25);
    path_0.quadraticBezierTo(size.width - 24, 24, size.width - 25, 15);
    path_0.close();

    Paint paint = Paint()
      ..style = isSelected ? PaintingStyle.fill : PaintingStyle.stroke;
    paint.strokeWidth = 1;
    paint.color = isSelected ? AppTheme.primary_color : AppTheme.border_color;
    canvas.drawPath(path_0, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
