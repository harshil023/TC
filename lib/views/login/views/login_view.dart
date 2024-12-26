import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:project_setup_flutter_getx/utils/app_strings.dart';

import '../../../style/button_styles.dart';
import '../../../style/color_constants.dart';
import '../../../style/dimensions.dart';
import '../../../style/text_styles.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: AppBar(title: Text(AppStrings.loginTitle),centerTitle: true,),
      body: Obx(() {
        return controller.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            TextField(
            controller: controller.emailController,
            decoration: InputDecoration(
              labelText: AppStrings.label_email,
              labelStyle: TextStyle(color: ColorConstants.black),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black), // Black border color
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black), // Black border color
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black), // Black border color
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black), // Black border color
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black), // Black border color
              ),
            ),
          ),


              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: TextField(
                  controller: controller.passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: AppStrings.label_password,
                    labelStyle: TextStyle(color: ColorConstants.black),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black), // Black border color
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black), // Black border color
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black), // Black border color
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black), // Black border color
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black), // Black border color
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
          SizedBox(
            width: Dimensions.screenWidth,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                controller.login();
              },
              style: ButtonStyles.buttonStyleBlue(),
              child: Text(
                AppStrings.btn_text_login,
                style: textButton,
              ),
            ),
          ),
              TextButton(
                onPressed: () {
                controller.registerUser();
                },
                child: Text(AppStrings.btn_text_register),
              ),
            ],
          ),
        );
      }),
    );
  }
}
