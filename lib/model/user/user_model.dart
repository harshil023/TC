import 'package:bson/bson.dart';

class User {
  ObjectId? id;
  String employeeID;
  String firstName;
  String lastName;
  String mobileNumber;
  String emailID;
  String designation;
  int role;
  String dob;
  String gender;
  String password;
  String profilePic;
  String fcmToken;
  bool isDelete;
  String createdBy;

  User({
    this.id,
    required this.employeeID,
    required this.firstName,
    required this.lastName,
    required this.mobileNumber,
    required this.emailID,
    required this.designation,
    required this.role,
    required this.dob,
    required this.gender,
    required this.password,
    required this.profilePic,
    required this.fcmToken,
    required this.isDelete,
    required this.createdBy,
  });

  // Factory constructor for creating an instance from a JSON object
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'] != null
          ? (json['_id'] is ObjectId ? json['_id'] as ObjectId : ObjectId.parse(json['_id']))
          : null,
      employeeID: json['employeeID'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      mobileNumber: json['mobileNumber'],
      emailID: json['emailID'],
      designation: json['designation'],
      role: json['role'],
      dob: json['dob'],
      gender: json['gender'],
      password: json['password'],
      profilePic: json['profilePic'],
      fcmToken: json['fcmToken'],
      isDelete: json['isDelete'],
      createdBy: json['createdBy'],
    );
  }

  // Method to convert an instance to a JSON object
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'employeeID': employeeID,
      'firstName': firstName,
      'lastName': lastName,
      'mobileNumber': mobileNumber,
      'emailID': emailID,
      'designation': designation,
      'role': role,
      'dob': dob,
      'gender': gender,
      'password': password,
      'profilePic': profilePic,
      'fcmToken': fcmToken,
      'isDelete': isDelete,
      'createdBy': createdBy,
    };
  }
}
