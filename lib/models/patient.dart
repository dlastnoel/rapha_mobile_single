import 'dart:convert';

List<Patient> patientFromJson(String str) =>
    List<Patient>.from(json.decode(str).map((x) => Patient.fromJson(x)));

String patientToJson(List<Patient> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Patient {
  Patient({
    required this.id,
    required this.dateOfBirth,
    required this.sex,
    required this.maritalStatus,
    required this.createdAt,
    required this.client,
  });

  String id;
  DateTime dateOfBirth;
  String sex;
  String maritalStatus;
  DateTime createdAt;
  String client;

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        id: json['id'],
        dateOfBirth: DateTime.parse(json['date_of_birth']),
        sex: json['sex'],
        maritalStatus: json['marital_status'],
        createdAt: DateTime.parse(json['created_at']),
        client: json['client'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'date_of_birth':
            '${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}',
        'sex': sex,
        'marital_status': maritalStatus,
        'created_at': createdAt.toIso8601String(),
        'client': client,
      };
}
