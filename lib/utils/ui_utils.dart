import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project_setup_flutter_getx/style/dimensions.dart';


import '../style/color_constants.dart';

class UiUtils {
  Widget gapWidget({double? height = 0, double? width = 0}) {
    return SizedBox(
      height: height,
      width: width,
    );
  }

  Widget loadingWidget() {
    return const CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(ColorConstants.blue11),
    );
  }

  Widget appButton(
      {required VoidCallback? onPressFunction,
      String? buttonText,
      Color? buttonFillColor,
      Color? buttonBorderColor,
      Color? buttonTextColor}) {
    return Container(
      height: 56,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(buttonFillColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(color: buttonBorderColor!)))),
          onPressed: () {
            onPressFunction != null ? onPressFunction() : null;
          },
          child: Center(
              child: Text(
            buttonText ?? "N/A",
            style: TextStyle(
                fontSize: Dimensions.screenWidth / 18,
                fontWeight: FontWeight.w500,
                color: buttonTextColor,
                decoration: TextDecoration.none),
          ))),
    );
  }

  EdgeInsets setDiffPadding(
      {double left = 0, double top = 0, double right = 0, double bottom = 0}) {
    return EdgeInsets.fromLTRB(left, top, right, bottom);
  }

  EdgeInsets setAllPadding(double value) {
    return EdgeInsets.all(value);
  }

  Widget appTextButton(
      {required VoidCallback onPressFunction,
      String? buttonText,
      Color? buttonTextColor,
      bool? isLinkText = false}) {
    return TextButton(
        onPressed: () {
          onPressFunction();
        },
        child: Text(buttonText ?? "N/A",
            style: TextStyle(
                color: buttonTextColor,
                fontSize: Dimensions.screenWidth / 22,
                letterSpacing: 0.25,
                fontWeight: FontWeight.w500,
                decoration: isLinkText == false
                    ? TextDecoration.none
                    : TextDecoration.underline)));
  }

  showLogMessage({
    required var className,
    required String functionName,
    required String message,
  }) {
    if (message.isNotEmpty && kDebugMode) {
      return debugPrint(
          "className : $className , functionName: $functionName , message :$message");
    }
  }

  Widget dividerWidget() {
    return const Divider(
      color: ColorConstants.black44,
      thickness: 1.0,
    );
  }
}
