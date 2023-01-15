// To parse this JSON data, do
//
//     final city = cityFromJson(jsonString);

import 'dart:convert';

class City {
  City({
    this.url,
    this.cityName,
    this.country,
  });

  String? url;
  String? cityName;
  String? country;

  factory City.fromRawJson(String str) => City.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory City.fromJson(Map<String, dynamic> json) => City(
        url: json["url"],
        cityName: json["city_name"],
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "city_name": cityName,
        "country": country,
      };
}
