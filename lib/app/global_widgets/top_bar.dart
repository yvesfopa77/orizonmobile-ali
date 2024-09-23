// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:orizon/app/core/theme/app_theme.dart';
import 'package:orizon/app/global_widgets/icon_back_button.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? leading;
  final Color foregroundColor;
  final bool showleading;
  final Widget? trailing;
  const TopBar({
    super.key,
    this.title,
    this.leading,
    this.foregroundColor = AppTheme.black_color,
    this.showleading = true,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      //  bottom: false,
      child: Container(
        padding: const EdgeInsets.only(top: 4),
        height: 50.h,
        child: Stack(
          children: [
            if (title != null)
              Align(
                alignment: Alignment.center,
                child: Text(
                  title!,
                  style: TextStyle(
                      color: foregroundColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500),
                ),
              ),
            Align(
              alignment: Alignment.centerLeft,
              child: !showleading && leading == null
                  ? null
                  : leading ??
                      Padding(
                          padding: EdgeInsets.only(left: 16.w, bottom: 4),
                          child: IconBackButton(
                            foregroundColor: foregroundColor,
                          )),
            ),
            Align(alignment: Alignment.centerRight, child: trailing),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.h);
}

class TopBarTrailingButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget child;
  const TopBarTrailingButton({
    super.key,
    this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.antiAlias,
      borderRadius: const BorderRadiusDirectional.horizontal(
        start: Radius.circular(50),
      ),
      color: Colors.transparent,
      child: Ink(
        decoration: const BoxDecoration(
          color: AppTheme.peach_orange_color,
        ),
        child: InkWell(
          onTap: onTap,
          splashFactory: InkRipple.splashFactory,
          child: Container(
              height: 50.r,
              width: 80.w,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              alignment: Alignment.center,
              child: child),
        ),
      ),
    );
  }
}
