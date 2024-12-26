import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

import '../../../../style/button_styles.dart';
import '../../../../style/dimensions.dart';
import '../../../../style/text_styles.dart';
import '../../../../widgets/CustomTextField.dart';
import '../controllers/adduser_controller.dart';

class AdduserView extends GetView<AdduserController> {
  const AdduserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add User'),
        centerTitle: true,
      ),
      body: Obx(() {
      return controller.isLoading.value
          ? Center(child: CircularProgressIndicator())
          :
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              // Profile Picture
              Center(
                child: Obx(() {
                  return GestureDetector(
                    onTap: () async {
                      await controller.openImagePicker(context);
                    },
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: controller.profilePicBase64.value.isNotEmpty
                          ? MemoryImage(base64Decode(controller.profilePicBase64.value))
                          : null,
                      child: controller.profilePicBase64.value.isEmpty
                          ? const Icon(
                        Icons.camera_alt,
                        size: 40,
                      )
                          : null,
                    ),
                  );
                }),
              ),

              // Employee ID
              CustomTextField(
                controller: controller.employeeIDController,
                labelText: 'Employee ID',
              ),

              // First Name
              CustomTextField(
                controller: controller.firstNameController,
                labelText: 'First Name',
              ),

              // Last Name
              CustomTextField(
                controller: controller.lastNameController,
                labelText: 'Last Name',
              ),

              // Mobile Number
              CustomTextField(
                controller: controller.mobileNumberController,
                labelText: 'Mobile Number',
                keyboardType: TextInputType.phone,
              ),

              // Email ID
              CustomTextField(
                controller: controller.emailIDController,
                labelText: 'Email ID',
                keyboardType: TextInputType.emailAddress,
              ),

              // Designation
              CustomTextField(
                controller: controller.designationController,
                labelText: 'Designation',
              ),

              // Role Selection
              Obx(() {
                return DropdownButtonFormField<int>(
                  value: controller.role.value,
                  onChanged: (value) => controller.role.value = value!,
                  items: const [
                    DropdownMenuItem(value: 1, child: Text('Admin')),
                    DropdownMenuItem(value: 2, child: Text('User')),
                  ],
                  decoration: const InputDecoration(
                    labelText: 'Role',
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                );
              }),

              // Date of Birth
              CustomTextField(
                controller: controller.dobController,
                labelText: 'Date of Birth',
                readOnly: true,
                onTap: () async {
                  await controller.selectDate(context);
                },
                suffixIcon: const Icon(Icons.calendar_today),
              ),

              // Gender Dropdown
              Obx(() {
                return DropdownButtonFormField<String>(
                  value: controller.gender.value,
                  onChanged: (value) => controller.gender.value = value!,
                  items: const [
                    DropdownMenuItem(value: 'Male', child: Text('Male')),
                    DropdownMenuItem(value: 'Female', child: Text('Female')),
                  ],
                  decoration: const InputDecoration(
                    labelText: 'Gender',
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                );
              }),

              // Password
              CustomTextField(
                controller: controller.passwordController,
                labelText: 'Password',
                obscureText: true,
              ),

              // Submit Button
              SizedBox(
                width: Dimensions.screenWidth,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    controller.addUser();
                  },
                  style: ButtonStyles.buttonStyleBlue(),
                  child: Text(
                    "Add User",
                    style: textButton,
                  ),
                ),
              ),
            ],
          ),
        ),
      );}),
    );
  }
}



