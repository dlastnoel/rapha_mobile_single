import 'dart:convert';
import '../configs/global.dart';

List<Doctor> doctorFromJson(String str) =>
    List<Doctor>.from(json.decode(str).map((x) => Doctor.fromJson(x)));

// String doctorToJson(List<Doctor> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Doctor {
  Doctor({
    required this.id,
    required this.specializationId,
    required this.speciliazation,
    required this.profileImageUrl,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.contact,
    required this.address,
    required this.email,
    required this.schedule,
    required this.shortBio,
  });

  String id;
  String specializationId;
  String speciliazation;
  String profileImageUrl;
  String firstName;
  String middleName;
  String lastName;
  String contact;
  String address;
  String email;
  String schedule;
  String shortBio;

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
        id: json['id'],
        specializationId: json['specialization']['id'].toString(),
        speciliazation: json['specialization']['field'],
        profileImageUrl: Global.baseIpAddress + json['profile_image'],
        firstName: json['first_name'],
        middleName: json['middle_name'],
        lastName: json['last_name'],
        contact: json['contact'],
        address: json['address'],
        email: json['email'],
        schedule: json['schedule'],
        shortBio: json['short_bio'],
      );

  // Map<String, dynamic> toJson() => {
  //       'id': id,

  //       'date_of_birth':
  //           '${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}',
  //       'sex': sex,
  //       'marital_status': maritalStatus,
  //       'created_at': createdAt.toIso8601String(),
  //       'client': client,
  //     };
}
