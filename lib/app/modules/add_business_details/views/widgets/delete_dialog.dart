import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:orizon/app/core/constants/images_string.dart';
import 'package:orizon/app/core/theme/app_theme.dart';
import 'package:orizon/app/core/theme/text_theme.dart';

class DeleteDialog extends StatelessWidget {
  final VoidCallback onDelete;
  const DeleteDialog({
    super.key,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Material(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: -50,
                right: 0,
                left: 0,
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: AppTheme.primary_color,
                  child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.white,
                      child: SvgPicture.asset(
                        Images.delete_icon,
                        width: 40,
                        colorFilter:
                            const ColorFilter.mode(AppTheme.primary_color, BlendMode.srcIn),
                      )),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  80.verticalSpace,
                  Text(
                    'Delete Photo',
                    style: AppTextStyle.s20.medium.black,
                  ),
                  4.verticalSpace,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      "Are you sure you want to delete business presentation photo?",
                      style: AppTextStyle.s12.regular.grey,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  20.verticalSpace,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                      height: 45,
                      child: Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              onPressed: () => Get.back(),
                              child: const Text('Close'),
                            ),
                          ),
                          10.horizontalSpace,
                          Expanded(
                              child: ElevatedButton(
                            onPressed: () {
                              Get.back();
                              Future.delayed(const Duration(milliseconds: 300), () {
                                onDelete.call();
                              });
                            },
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            child: const Text('Delete'),
                          ))
                        ],
                      ),
                    ),
                  ),
                  20.verticalSpace,
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
