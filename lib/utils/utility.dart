import 'dart:convert';
import 'dart:developer' as dev;
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../style/color_constants.dart';
import '../style/dimensions.dart';
import 'app_constants.dart';

void printf(dynamic value) {
  if (!kReleaseMode) dev.log(value.toString());
}

class Utility {

  static bool isShowing = false;
  static bool isEmpty(String? string) {
    return string == null || string.length == 0;
  }

  static Future<bool> isConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  static Widget? hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
    return null;
  }

  static Future<String> getUserAPIKey() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userAPIKey = prefs.getString(AppConstants.apiKey);
    return userAPIKey!;
  }

  static snackBar(String msg, BuildContext context) {
    var snackBar = SnackBar(
      content: Text(msg),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }


  static Widget buildProgressIndicator() {
    return Container(
      height: Dimensions.screenHeight,
      color: ColorConstants.black.withOpacity(0.4),
      child: Center(
        child: CircularProgressIndicator(
          backgroundColor: ColorConstants.blue,
          valueColor: new AlwaysStoppedAnimation<Color>(ColorConstants.white),
        ),
      ),
    );
  }

  static void showProgressDialog(BuildContext context, {from}) {
    isShowing = true;
    showDialog(
        barrierDismissible: false,
        useSafeArea: true,
        context: context,
        builder: (context) {
          return WillPopScope(
            onWillPop: () => Future.value(false),
            child: Center(
              child: Container(
                padding: EdgeInsets.all(10.0),
                height: 100.0,
                width: 100.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0)),
                child: Center(
                  child: CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(
                        Colors.black),
                  ),
                ),
              ),
            ),
          );
        });
  }

  static void hideProgressDialog(BuildContext context) {
    if (isShowing) {
      Navigator.of(context, rootNavigator: true).pop('dialog');
      isShowing = false;
    }
  }
  static Future<String?> pickImage(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: source);

    if (image != null) {
      // Convert XFile to File
      final File compressedImage = await compressImage(File(image.path));
      final bytes = await compressedImage.readAsBytes();
      if(base64Encode(bytes) != ""){
        return base64Encode(bytes);
      }else {
        throw Exception('Image Pick failed');
      }
    }
  }

  static Future<File> compressImage(File file) async {
    final String targetPath = '${file.path}_compressed.jpg';
    // Compress the image and get an XFile
    final XFile? compressedXFile = await FlutterImageCompress.compressAndGetFile(
      file.path,
      targetPath,
      quality: 25, // Reduce quality to minimize size
    );

    // Return a File object by converting XFile to File
    if (compressedXFile != null) {
      return File(compressedXFile.path);
    } else {
      throw Exception('Image compression failed');
    }
  }
}
