import 'dart:convert';
import 'package:intl/intl.dart';

Appointment requestFromJson(String responseData) =>
    Appointment.fromJson(json.decode(responseData));

// String requestToJson(Appointment data) => json.encode(data.toJson());

class Appointment {
  String id;
  String checkupDate;
  String checkupStart;
  String checkupEnd;
  String status;
  String dateCreated;
  String unicode;
  String doctor;
  String statement;

  Appointment({
    required this.id,
    required this.checkupDate,
    required this.checkupStart,
    required this.checkupEnd,
    required this.status,
    required this.dateCreated,
    required this.unicode,
    required this.doctor,
    required this.statement,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) => Appointment(
        id: json['id'],
        checkupDate: (json['checkup_date']),
        checkupStart: (json['checkup_start']),
        checkupEnd: (json['checkup_end']),
        status: json['status'],
        dateCreated: json['created_at'],
        unicode: json['unicode'],
        doctor: json['doctor'],
        statement: json['statement'],
      );

  // Map<String, dynamic> toJson() => {
  //       'id': id,
  //       'username': username,
  //       'contact': contact,
  //       'contact_token': contactToken,
  //     };
}

// import 'dart:convert';

// List<Appointment> appointmentFromJson(String str) => List<Appointment>.from(
//     json.decode(str).map((x) => Appointment.fromJson(x)));

// String appointmentToJson(List<Appointment> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class Appointment {
//   String id;
//   DateTime checkupDate;
//   DateTime checkupStart;
//   DateTime checkupEnd;
//   String status;

//   Appointment({
//     required this.id,
//     required this.checkupDate,
//     required this.checkupStart,
//     required this.checkupEnd,
//     required this.status,
//   });

//   factory Appointment.fromJson(Map<String, dynamic> json) => Appointment(
//         id: json["id"],
//         checkupDate: DateTime.parse(json["checkup_date"]),
//         checkupStart: json["checkup_start"],
//         checkupEnd: json["checkup_end"],
//         status: json["status"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "checkup_date":
//             "${checkupDate.year.toString().padLeft(4, '0')}-${checkupDate.month.toString().padLeft(2, '0')}-${checkupDate.day.toString().padLeft(2, '0')}",
//         "checkup_start": checkupStart,
//         "checkup_end": checkupEnd,
//         "status": status,
//       };
// }
