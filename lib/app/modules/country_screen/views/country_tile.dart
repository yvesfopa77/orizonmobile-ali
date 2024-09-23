import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:orizon/app/core/theme/app_theme.dart';
import 'package:orizon/app/core/theme/text_theme.dart';
import 'package:orizon/app/core/utils/app_util.dart';

class CountryTile extends StatelessWidget {
  final String subtitle;
  final Country? country;
  const CountryTile({
    super.key,
    required this.subtitle,
    required this.country,
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
            painter: CountryPaint(),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              height: 30.r,
              width: 30.r,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: country == null ? AppTheme.peach_orange_color : null),
              child:
                  country == null ? null : AppUtil.textTocountryEmoji(country!),
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            right: 0,
            left: 20.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  country == null ? '' : country!.name,
                  style: AppTextStyle.s18.medium.white,
                ),
                Text(
                  subtitle,
                  style: AppTextStyle.s12.medium.white,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CountryPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.8979592, size.height * 0.2465771);
    path_0.cubicTo(
        size.width * 0.8979592,
        size.height * 0.1134970,
        size.width * 0.8718542,
        size.height * 0.005613759,
        size.width * 0.8396501,
        size.height * 0.005613759);
    path_0.lineTo(size.width * 0.05830904, size.height * 0.005613759);
    path_0.cubicTo(size.width * 0.02610586, size.height * 0.005613759, 0,
        size.height * 0.1134970, 0, size.height * 0.2465771);
    path_0.lineTo(0, size.height * 0.7526012);
    path_0.cubicTo(
        0,
        size.height * 0.8856819,
        size.width * 0.02610583,
        size.height * 0.9935651,
        size.width * 0.05830904,
        size.height * 0.9935651);
    path_0.lineTo(size.width * 0.9416910, size.height * 0.9935651);
    path_0.cubicTo(size.width * 0.9738950, size.height * 0.9935651, size.width,
        size.height * 0.8856819, size.width, size.height * 0.7526012);
    path_0.lineTo(size.width, size.height * 0.6682639);
    path_0.cubicTo(
        size.width,
        size.height * 0.5351831,
        size.width * 0.9738950,
        size.height * 0.4273000,
        size.width * 0.9416910,
        size.height * 0.4273000);
    path_0.lineTo(size.width * 0.9241983, size.height * 0.4273000);
    path_0.cubicTo(
        size.width * 0.9097055,
        size.height * 0.4273000,
        size.width * 0.8979592,
        size.height * 0.3787530,
        size.width * 0.8979592,
        size.height * 0.3188663);
    path_0.lineTo(size.width * 0.8979592, size.height * 0.2465771);
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
