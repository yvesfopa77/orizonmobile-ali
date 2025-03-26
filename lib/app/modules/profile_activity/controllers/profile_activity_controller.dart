// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';
import 'package:group_button/group_button.dart';
import 'package:orizon/app/core/constants/images_string.dart';

class ProfileActivityController extends GetxController {
  List<ListButtonItem> buttonList = [
    ListButtonItem(
        icon: Images.trade,
        title: "Trade",
        subtitle: "Street vendors, small retailers, market traders"),
    ListButtonItem(
        icon: Images.agriculture,
        title: "Agriculture",
        subtitle: "Small farmers, unregistered agricultural workers"),
    ListButtonItem(
        icon: Images.carft,
        title: "Craft",
        subtitle: "Artisans, manufacturers of craft products, small producers"),
    ListButtonItem(
        icon: Images.transport,
        title: "Transport",
        subtitle:
            'Driver of taxis, motorcycle taxis, other unregulated means of transport'),
    ListButtonItem(
        icon: Images.service,
        title: "Services",
        subtitle: "Hairdressers, tailors, repairers, other services providers"),
    ListButtonItem(
        icon: Images.students,
        title: "Students",
        subtitle: 'Apprentice, high school learner'),
    ListButtonItem(
        icon: Images.no_activity,
        title: "No Activity",
        subtitle: 'I have absolutely no activity currently.'),
  ];

  GroupButtonController groupButtonController = GroupButtonController();

  @override
  void onInit() {
    selectbuttons();
    super.onInit();
  }

  selectbuttons() {
    groupButtonController.addListener(() {
      // if button length is more then one and first element is no activity then remove no activity
      if (groupButtonController.selectedIndexes.length > 1 &&
          groupButtonController.selectedIndexes.first ==
              buttonList.length - 1) {
        groupButtonController.unselectIndex(buttonList.length - 1);

        // if button contain no activity them unselect all other selected button
      } else if (groupButtonController.selectedIndexes
          .any((value) => value == buttonList.length - 1)) {
        List<int> unselectedIndexList = groupButtonController.selectedIndexes
            .where((element) => element != buttonList.length - 1)
            .toList();
        if (unselectedIndexList.isNotEmpty) {
          groupButtonController.unselectIndexes(unselectedIndexList);
        }
      }
    });
  }
}

class ListButtonItem {
  final String icon;
  final String title;
  final String subtitle;
  ListButtonItem({
    required this.icon,
    required this.title,
    required this.subtitle,
  });
}
