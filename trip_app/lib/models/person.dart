// Made with https://app.quicktype.io

// To parse this JSON data, do
//
//     final person = personFromJson(jsonString);

import 'dart:convert';

class Person {
  Person({
    this.url,
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.longitude,
    this.latitude,
  });

  String? url;
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? longitude;
  String? latitude;

  factory Person.fromRawJson(String str) => Person.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Person.fromJson(Map<String, dynamic> json) => Person(
        url: json["url"],
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        phone: json["phone"],
        longitude: json["longitude"],
        latitude: json["latitude"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "phone": phone,
        "longitude": longitude,
        "latitude": latitude,
      };
}
