import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:project_setup_flutter_getx/controller/base_controller.dart';
import 'package:project_setup_flutter_getx/utils/utility.dart';

import '../../../../model/user/user_model.dart';
import '../../../../services/mongodb_service.dart';

class AdduserController extends BaseController {
  final employeeIDController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final emailIDController = TextEditingController();
  final designationController = TextEditingController();
  final dobController = TextEditingController();
  final passwordController = TextEditingController();

  final role = 1.obs; // Default role is Admin
  final gender = 'Male'.obs; // Default gender is Male
  final profilePicBase64 = ''.obs;
  var isLoading = false.obs;
  final MongoDBService mongoDBService = MongoDBService();



  Future<void> openImagePicker(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera),
              title: const Text('Camera'),
              onTap: () async {
                Navigator.of(context).pop();
                profilePicBase64.value = (await Utility.pickImage(ImageSource.camera))!;
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Gallery'),
              onTap: () async {
                Navigator.of(context).pop();
                profilePicBase64.value= (await Utility.pickImage(ImageSource.gallery))!;
              },
            ),
          ],
        );
      },
    );
  }



  Future<void> submit() async {
    final data = {
      "employeeID": employeeIDController.text,
      "firstName": firstNameController.text,
      "lastName": lastNameController.text,
      "mobileNumber": mobileNumberController.text,
      "emailID": emailIDController.text,
      "designation": designationController.text,
      "role": role.value,
      "dob": dobController.text,
      "gender": gender.value,
      "password": passwordController.text,
      "profilePic": profilePicBase64.value,
    };

    // Submit the data to your API or handle it as needed
    print("User Data: $data");
  }
  Future<void> selectDate(BuildContext context) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (selectedDate != null) {
      // Format the date as dd-MM-yyyy
      final formattedDate = DateFormat('dd-MM-yyyy').format(selectedDate);
      dobController.text = formattedDate;
    }
  }

  Future<void> addUser() async {
    isLoading.value = true;
    if (!mongoDBService.isConnected) {
      await mongoDBService.connect();
    }
    var fetchedData = await appPreferences.getUserDetails();
    final user = User(employeeID:  employeeIDController.text.toUpperCase(),
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        mobileNumber: mobileNumberController.text,
        emailID: emailIDController.text,
        designation: designationController.text,
        role: role.value,
        dob: dobController.text,
        gender: gender.value,
        password: "123456",
        fcmToken: "",
        isDelete: false, profilePic: profilePicBase64.value, createdBy: fetchedData!.employeeID.toString().toUpperCase());

    await mongoDBService.registerUser(user);
    Fluttertoast.showToast(
        msg: "User Added Successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        fontSize: 16.0
    );
    isLoading.value = false;
    await mongoDBService.close();
    // resetFields();
  }
  // Function to reset all fields and variables
  void resetFields() {
    employeeIDController.clear();
    firstNameController.clear();
    lastNameController.clear();
    mobileNumberController.clear();
    emailIDController.clear();
    designationController.clear();
    dobController.clear();
    passwordController.clear();

    // Reset Rx variables to their default values
    role.value = 1; // Default role (Admin)
    gender.value = 'Male'; // Default gender
    profilePicBase64.value = ''; // Clear profile picture

    // Optionally, reset the selected date
    dobController.clear();
  }
  @override
  Future<void> onClose() async {
    employeeIDController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    mobileNumberController.dispose();
    emailIDController.dispose();
    designationController.dispose();
    dobController.dispose();
    passwordController.dispose();
    await mongoDBService.close();
    super.onClose();
  }
}