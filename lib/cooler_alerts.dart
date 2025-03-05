import 'dart:async';

import 'package:flutter/material.dart';

import 'src/constants/enums.dart';
import 'src/models/cool_alert_options.dart';
import 'src/utils/animate.dart';
import 'src/widgets/cool_alert_container.dart';

export 'src/constants/enums.dart';

/// CoolAlert.
class CoolerAlerts {
  static Future show({
    /// BuildContext
    required BuildContext context,

    /// Title of the dialog
    String? title,

    /// Text of the dialog
    String? text,

    /// Custom Widget of the dialog
    Widget? widget,

    // Alert type [success, error, warning, confirm, info, loading, custom]
    required CoolAlertType type,

    // Animation type  [scale, rotate, slideInDown, slideInUp, slideInLeft, slideInRight]
    CoolAlertAnimType animType = CoolAlertAnimType.scale,

    /// Barrier Dissmisable
    bool barrierDismissible = true,

    /// Triggered when confirm button is tapped, [BuildContext] parameter is scoped to the dialog
    void Function(BuildContext)? onConfirmBtnTap,

    /// Triggered when cancel button is tapped, [BuildContext] parameter is scoped to the dialog
    void Function(BuildContext)? onCancelBtnTap,

    /// Confirmation button text
    String confirmBtnText = 'Ok',

    /// Cancel button text
    String cancelBtnText = 'Cancel',

    /// Color for confirm button
    Color confirmBtnColor = const Color(0xFF3085D6),

    /// TextStyle for confirm button
    TextStyle? confirmBtnTextStyle,

    /// TextStyle for cancel button
    TextStyle? cancelBtnTextStyle,

    /// TextStyle for title
    TextStyle? titleTextStyle,

    /// TextOverflow for title
    TextOverflow? titleOverflow,

    /// TextAlign for title
    TextAlign titleTextAlign = TextAlign.center,

    /// TextStyle for text
    TextStyle? textTextStyle,

    /// TextOverflow for text
    TextOverflow? textOverflow,

    /// TextAlign for text
    TextAlign textTextAlign = TextAlign.center,

    /// Determines if cancel button is shown or not
    bool showCancelBtn = false,

    /// Dialog Border Radius
    double borderRadius = 10.0,

    /// Header background color
    Color backgroundColor = const Color(0xFF515C6F),

    /// Flare asset path
    String? flareAsset,

    /// Flare animation name
    String flareAnimationName = 'play',

    /// Asset path of your lottie file
    String? lottieAsset,

    /// Width of the dialog
    double? width,

    /// Determines how long the dialog stays open for before closing
    /// [default] is null
    /// When it is null, it won't autoclose
    Duration? autoCloseDuration,

    /// Detemines if the animation loops or not
    bool loopAnimation = false,

    /// Detemines if dialog closes when the confirm button is tapped
    /// [default] is true
    /// When it is true, it will close
    /// When it is false, you will have to close it manually by using Navigator.of(context).pop();
    bool closeOnConfirmBtnTap = true,

    /// Determines if the dialog can be popped, a wrapper for [PopScope.canPop].
    /// If false, the dialog will not be popped.
    bool canPop = true,

    /// Triggered when the dialog is popped, a wrapper for [PopScope.onPopInvokedWithResult].
    /// [bool] parameter indicates if the dialog has been popped.
    void Function(bool)? onPopInvoked,

    /// Reverse the order of the buttons
    bool reverseBtnOrder = false,
  }) {
    if (autoCloseDuration != null) {
      Future.delayed(autoCloseDuration, () {
        Navigator.of(context, rootNavigator: true).pop();
      });
    }

    final options = CoolAlertOptions(
      title: title,
      text: text,
      widget: widget,
      type: type,
      animType: animType,
      barrierDismissible: barrierDismissible,
      onConfirmBtnTap: onConfirmBtnTap,
      onCancelBtnTap: onCancelBtnTap,
      confirmBtnText: confirmBtnText,
      cancelBtnText: cancelBtnText,
      confirmBtnColor: confirmBtnColor,
      confirmBtnTextStyle: confirmBtnTextStyle,
      cancelBtnTextStyle: cancelBtnTextStyle,
      titleTextStyle: titleTextStyle,
      titleOverflow: titleOverflow,
      titleTextAlign: titleTextAlign,
      textTextStyle: textTextStyle,
      textTextAlign: textTextAlign,
      textOverflow: textOverflow,
      showCancelBtn: showCancelBtn,
      borderRadius: borderRadius,
      backgroundColor: backgroundColor,
      flareAsset: flareAsset,
      flareAnimationName: flareAnimationName,
      lottieAsset: lottieAsset,
      width: width,
      loopAnimation: loopAnimation,
      closeOnConfirmBtnTap: closeOnConfirmBtnTap,
      autoCloseDuration: autoCloseDuration,
      reverseBtnOrder: reverseBtnOrder,
    );

    final dialog = AlertDialog(
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      content: CoolAlertContainer(
        options: options,
      ),
    );

    final child = PopScope(
      canPop: canPop,
      onPopInvokedWithResult: (didPop, result) => onPopInvoked?.call(didPop),
      child: dialog,
    );

    return showGeneralDialog(
      // ignore: deprecated_member_use
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, anim1, __, widget) {
        switch (animType) {
          case CoolAlertAnimType.scale:
            return Animate.scale(child: child, animation: anim1);

          case CoolAlertAnimType.rotate:
            return Animate.rotate(child: child, animation: anim1);

          case CoolAlertAnimType.slideInDown:
            return Animate.slideInDown(child: child, animation: anim1);

          case CoolAlertAnimType.slideInUp:
            return Animate.slideInUp(child: child, animation: anim1);

          case CoolAlertAnimType.slideInLeft:
            return Animate.slideInLeft(child: child, animation: anim1);

          case CoolAlertAnimType.slideInRight:
            return Animate.slideInRight(child: child, animation: anim1);

          default:
            return child;
        }
      },
      transitionDuration: const Duration(milliseconds: 200),
      barrierDismissible:
          autoCloseDuration != null ? false : barrierDismissible,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, _, __) => Container(),
    );
  }
}
