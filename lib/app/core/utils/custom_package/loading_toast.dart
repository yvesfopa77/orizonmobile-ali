import 'package:bot_toast/bot_toast.dart';

class LoadingToast {
  LoadingToast._();
  static void showLoading() {
    BotToast.showLoading(backButtonBehavior: BackButtonBehavior.ignore);
  }

  static void closeLoading() {
    BotToast.closeAllLoading();
  }
}
