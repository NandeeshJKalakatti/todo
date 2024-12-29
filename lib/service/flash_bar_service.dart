// import 'package:flash/flash.dart';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';

import '../static/app_color.dart';
import '../static/app_styles.dart';

class FlashBarService {
  FlashBarService._();
  static final instance = FlashBarService._();

  static DefaultFlashController? previousController;

  void common(BuildContext context, String message, Color backgroundColor) {
    if (previousController?.isDisposed == false) previousController?.dismiss();

    previousController = DefaultFlashController(
      context,
      duration: const Duration(seconds: 3),
      builder: (context, controller) {
        return FlashBar(
          controller: controller,
          content: Text(message),
          contentTextStyle: AppStyle.text7,
          backgroundColor: backgroundColor.withOpacity(0.8),
          // margin: const EdgeInsets.only(left: 10, right: 10, bottom: 48),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        );
      },
    );
    previousController!.show();
  }

  void error(BuildContext context, String message) {
    common(context, message, AppColors.secondary);
  }

  void success(BuildContext context, String message) {
    common(context, message, AppColors.green1);
  }

  void warning(BuildContext context, String message) {
    common(context, message, AppColors.gray3);
  }
}
