import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../static/app_color.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({
    Key? key,
    required this.loading,
    required this.child,
  }) : super(key: key);
  final bool loading;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      color: AppColors.black,
      inAsyncCall: loading,
      opacity: 0,
      progressIndicator: const SpinKitChasingDots(
        color: AppColors.primary,
        size: 70.0,
      ),
      child: child,
    );
  }
}

class AppLoaderWidget extends StatelessWidget {
  const AppLoaderWidget({super.key, this.size = 50.0});

  final double size;

  @override
  Widget build(BuildContext context) {
    return SpinKitChasingDots(
      color: AppColors.primary,
      size: size,
    );
  }
}
