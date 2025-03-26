// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:orizon/app/core/constants/images_string.dart';
import 'package:orizon/app/core/theme/app_theme.dart';
import 'package:orizon/app/core/theme/text_theme.dart';
import 'package:orizon/app/global_widgets/horizontal_padding.dart';
import 'package:orizon/app/global_widgets/icon_back_button.dart';
import 'package:orizon/app/modules/business_details_confirm/views/widgets/divider.dart';
import 'package:orizon/app/modules/business_details_confirm/views/widgets/expandable_tile.dart';
import 'package:orizon/app/routes/app_pages.dart';

import '../controllers/business_details_confirm_controller.dart';



// Padding(
//                         padding: EdgeInsets.only(left: 16.w, bottom: 4, top: 10),
//                         child: IconBackButton(
//                           foregroundColor: Colors.white,
//                         ))
class BusinessDetailsConfirmView extends GetView<BusinessDetailsConfirmController> {
  const BusinessDetailsConfirmView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Obx(
        () => CustomScrollView(
          slivers: [
            SliverAppBar(
              leadingWidth: 100,
              stretch: true,
              leading: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 16.w, top: 4),
                  child: IconBackButton(
                    foregroundColor: Colors.white,
                  ),
                ),
              ),
              floating: true,
              expandedHeight: 250.h,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    PageView.builder(
                      controller: controller.pageController,
                      itemCount: controller.businessDataTravalModel.businessPhotos!.length,
                      itemBuilder: (context, index) => Image.file(
                        controller.businessDataTravalModel.businessPhotos![index],
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      right: 0,
                      left: 0,
                      bottom: 10,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            controller.businessDataTravalModel.businessPhotos!.length,
                            (index) => Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4),
                              child: CircleAvatar(
                                backgroundColor: controller.pageActiveIndex.value == index
                                    ? AppTheme.primary_color
                                    : AppTheme.white_color,
                                radius: controller.pageActiveIndex.value == index ? 6 : 4,
                              ),
                            ),
                          )),
                    ),
                  
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: HorizontalPadding(
                child: Obx(
                  () => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                 
                  
                      10.verticalSpace,
                      Text(
                        controller.businessDataTravalModel.businessName ?? "",
                        style: AppTextStyle.s18.semiBold.black,
                      ),
                      14.verticalSpace,
                      Row(
                        children: [
                          Icon(Icons.star),
                          5.horizontalSpace,
                          Text(
                            "4.9",
                            style: AppTextStyle.s12.regular.grey,
                          ),
                          4.horizontalSpace,
                          Text(
                            "(483)",
                            style: AppTextStyle.s12.regular.green,
                          ),
                        ],
                      ),
                      10.verticalSpace,
                      Text(
                        "Bowling club in Redhill, England",
                        style: AppTextStyle.s12.regular.grey,
                      ),
                      CustomDivider(height: 40),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(Images.map_marker),
                          6.horizontalSpace,
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Address',
                                style: AppTextStyle.s12.medium.black.copyWith(height: .8),
                              ),
                              4.verticalSpace,
                              Text(
                                controller.locationAddress.value,
                                style: AppTextStyle.s12.regular.grey,
                              ),
                            ],
                          ),
                        ],
                      ),
                      10.verticalSpace,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(Images.clock),
                          6.horizontalSpace,
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hours',
                                style: AppTextStyle.s12.medium.black.copyWith(height: .8),
                              ),
                              4.verticalSpace,
                              Row(
                                children: [
                                  Text(
                                    'Opening Hours: ',
                                    style: AppTextStyle.s12.regular.grey,
                                  ),
                                  Text(
                                    'Open',
                                    style: AppTextStyle.s12.regular.sea_blue,
                                  ),
                                  Text(
                                    ' - Closes 7PM',
                                    style: AppTextStyle.s12.regular.grey,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      10.verticalSpace,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(Images.cell_phone),
                          6.horizontalSpace,
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Cell Number',
                                style: AppTextStyle.s12.medium.black.copyWith(height: .8),
                              ),
                              4.verticalSpace,
                              ...controller.businessDataTravalModel.businessPhones!.map(
                                (value) => Text(
                                  value,
                                  style: AppTextStyle.s12.regular.grey,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      CustomDivider(height: 40),
                      Text(
                        'Competences',
                        style: AppTextStyle.s14.medium.black.copyWith(height: .8),
                      ),
                      10.verticalSpace,
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: SvgPicture.asset(Images.graphic_design),
                        ),
                        title: Text(
                          "Graphic Design",
                          style: AppTextStyle.s12.medium.black,
                        ),
                        subtitle: Text(
                          "2+ years of experience",
                          style: AppTextStyle.s12.regular.grey,
                        ),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: SvgPicture.asset(Images.book_writer),
                        ),
                        title: Text(
                          "Graphic Design",
                          style: AppTextStyle.s12.medium.black,
                        ),
                        subtitle: Text(
                          "2+ years of experience",
                          style: AppTextStyle.s12.regular.grey,
                        ),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: SvgPicture.asset(Images.translate),
                        ),
                        title: Text(
                          "Graphic Design",
                          style: AppTextStyle.s12.medium.black,
                        ),
                        subtitle: Text(
                          "2+ years of experience",
                          style: AppTextStyle.s12.regular.grey,
                        ),
                      ),
                      CustomDivider(),
                      CustomExpandedTile(
                        title: "Business Description",
                        initiallyExpanded: true,
                        children: [
                          Text(
                            controller.businessDataTravalModel.businessDescription ?? "",
                            style: AppTextStyle.s12.regular.grey,
                          )
                        ],
                      ),
                      CustomDivider(),
                      CustomExpandedTile(
                        title: "Frequently Asked Questions",
                        expandedCrossAxisAlignment: CrossAxisAlignment.start,
                        initiallyExpanded: true,
                        children: [
                          Text(" 1. Lorem ipsum dolor sit amet, consectetur adipiscing?",
                              style: AppTextStyle.s12.medium.black),
                          3.verticalSpace,
                          Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
                            style: AppTextStyle.s12.regular.grey,
                          ),
                          3.verticalSpace,
                          Text(" 2. Lorem ipsum dolor sit amet, consectetur adipiscing?",
                              style: AppTextStyle.s12.medium.black),
                          3.verticalSpace,
                          Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                            style: AppTextStyle.s12.regular.grey,
                          ),
                        ],
                      ),
                      CustomDivider(),
                      CustomExpandedTile(
                        title: "Location With Map",
                        initiallyExpanded: true,
                        children: [
                          SizedBox(
                            height: 213.h,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: GoogleMap(
                                tiltGesturesEnabled: false,
                                zoomGesturesEnabled: false,
                                rotateGesturesEnabled: false,
                                scrollGesturesEnabled: false,
                                mapType: MapType.normal,
                                myLocationButtonEnabled: false,
                                markers: controller.currentMarker != null
                                    ? {controller.currentMarker!}
                                    : {},
                                initialCameraPosition: CameraPosition(
                                  target: controller.businessDataTravalModel
                                      .businessLocation!, // Initial position (will be updated)
                                  zoom: 12.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      30.verticalSpace,
                      ElevatedButton(
                          onPressed: () {
                            Get.toNamed(Routes.BUSINESS_FINAL);
                          },
                          child: Text("Confirm")),
                      40.verticalSpace,
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
