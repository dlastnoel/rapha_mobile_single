import 'dart:convert';

List<Schedule> scheduleFromJson(String str) =>
    List<Schedule>.from(json.decode(str).map((x) => Schedule.fromJson(x)));

// String doctorToJson(List<Doctor> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Schedule {
  Schedule({
    required this.id,
    required this.weekday,
    required this.start,
    required this.end,
  });

  String id;
  String weekday;
  String start;
  String end;

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        id: json['id'],
        weekday: json['weekday'].toString(),
        start: json['start'],
        end: json['end'],
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
