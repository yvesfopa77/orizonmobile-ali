import 'package:get/get.dart';
import 'package:group_button/group_button.dart';
import 'package:orizon/app/core/constants/images_string.dart';

class ProfileActivity3Controller extends GetxController {
  List<ListButtonItem> buttonList = [
    ListButtonItem(
        icon: Images.graphic_design,
        title: "Graphic Design",
        subtitle: "2+ years of experience "),
    ListButtonItem(
        icon: Images.book_writer,
        title: "Book writer",
        subtitle: "1+ years of experience "),
    ListButtonItem(
        icon: Images.translate,
        title: "Translator French, English",
        subtitle: "2+ years of experience "),
    ListButtonItem(
        icon: Images.graphic_design,
        title: "Graphic Design",
        subtitle: "2+ years of experience "),
    ListButtonItem(
        icon: Images.book_writer,
        title: "Book writer",
        subtitle: "1+ years of experience "),
    ListButtonItem(
        icon: Images.translate,
        title: "Translator French, English",
        subtitle: "2+ years of experience "),
    ListButtonItem(
        icon: Images.graphic_design,
        title: "Graphic Design",
        subtitle: "2+ years of experience "),
    ListButtonItem(
        icon: Images.book_writer,
        title: "Book writer",
        subtitle: "1+ years of experience "),
    ListButtonItem(
        icon: Images.translate,
        title: "Translator French, English",
        subtitle: "2+ years of experience "),
  ];

  GroupButtonController groupButtonController = GroupButtonController();
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
