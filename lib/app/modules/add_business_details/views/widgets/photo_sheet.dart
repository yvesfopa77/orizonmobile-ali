import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orizon/app/modules/add_business_details/controllers/add_business_details_controller.dart';

class PhotoSheet extends GetView<AddBusinessDetailsController> {
  const PhotoSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          20.verticalSpace,
          SizedBox(
            height: 350,
            child: AnimatedGrid(
              physics: const NeverScrollableScrollPhysics(),
              key: controller.gridKey,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Three columns.
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 1,
              ),
              initialItemCount: controller.images.length + 1,
              itemBuilder: (context, index, animation) {
                if (index == controller.images.length) {
                  // The last item is the "Add More" button.
                  return GestureDetector(
                    onTap: controller.pickImage,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(205, 207, 208, 1),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.add_rounded, size: 40, color: Colors.white),
                        ),
                      ),
                    ),
                  );
                }

                // Display selected images.
                return controller.buildImageItem(controller.images[index], index, animation);
              },
            ),
          ),
          ElevatedButton(
              onPressed: controller.images.isEmpty
                  ? null
                  : () {
                      controller.addPictureAndToNextScreen();
                    },
              child: const Text("Continue")),
          40.verticalSpace,
        ],
      ),
    );
  }
}
