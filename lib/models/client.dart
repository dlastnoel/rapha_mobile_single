import 'dart:convert';

Client requestFromJson(String responseData) =>
    Client.fromJson(json.decode(responseData));

String requestToJson(Client data) => json.encode(data.toJson());

class Client {
  String id;
  String username;
  String contact;
  String contactToken;

  Client({
    required this.id,
    required this.username,
    required this.contact,
    required this.contactToken,
  });

  factory Client.fromJson(Map<String, dynamic> json) => Client(
        id: json['id'],
        username: json['username'],
        contact: json['contact'],
        contactToken: json['contact_token'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'contact': contact,
        'contact_token': contactToken,
      };
}
