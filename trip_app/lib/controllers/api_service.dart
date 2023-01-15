import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:trip_app/constants.dart';
import 'models/city.dart';
import 'dart:convert';

import 'models/person.dart';

class ApiService {
  final BuildContext context;
  ApiService(this.context);

  void _postApi(Uri url, dynamic body) async {
    final response = await http.post(url, body: body);

    if (response.statusCode != 200) {
      throw Exception('Failed to post item, code${response.statusCode}');
    }
  }

  /// Call the API but show a snackbar if there is an error
  bool _postApiWithFeedback(Uri uri, dynamic body) {
    try {
      _postApi(uri, body);
      return true;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
      return false;
    }
  }

  Future<dynamic> _getApi(Uri url) async {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final dynamic body = jsonDecode(response.body);
      final List<dynamic> items = body;
      return items;
    } else {
      throw Exception('Failed to load items, code${response.statusCode}');
    }
  }

  /// Call the API but show a snackbar if there is an error
  Future<dynamic> _getApiWithFeedback(Uri uri) async {
    try {
      return await _getApi(uri);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
      return null;
    }
  }

  Future<List<City>> getCities() async {
    var cities = await _getApiWithFeedback(
        Uri.parse(ApiConstants.baseUrl + ApiConstants.citiesEndpoint));
    if (cities == null) return [];
    final List<dynamic> citiesList =
        cities["results"].map((dynamic item) => City.fromJson(item)).toList();
    final List<City> result = citiesList.cast<City>();
    return result;
  }

  Future<List<Person>> getPeople() async {
    var people = await _getApiWithFeedback(
        Uri.parse(ApiConstants.baseUrl + ApiConstants.peopleEndpoint));
    if (people == null) return [];
    final List<dynamic> peopleList =
        people["results"].map((dynamic item) => Person.fromJson(item)).toList();
    final List<Person> result = peopleList.cast<Person>();
    return result;
  }

  Future<List<Person>> getPeopleCloseTo(int id) async {
    var people = await _getApiWithFeedback(Uri.parse(
        "${ApiConstants.baseUrl}${ApiConstants.peopleCloseToEndpoint}$id/"));
    if (people == null) return [];
    final List<dynamic> peopleList =
        people.map((dynamic item) => Person.fromJson(item)).toList();
    final List<Person> result = peopleList.cast<Person>();
    return result;
  }

  Future<List<City>> getCitiesForPerson(int id) async {
    var cities = await _getApiWithFeedback(Uri.parse(
        "${ApiConstants.baseUrl}${ApiConstants.personCityEndpoint}$id/"));
    if (cities == null) return [];
    final List<dynamic> citiesList =
        cities.map((dynamic item) => City.fromJson(item)).toList();
    final List<City> result = citiesList.cast<City>();
    return result;
  }

  bool addPerson(Person person) {
    return _postApiWithFeedback(
        Uri.parse(ApiConstants.baseUrl + ApiConstants.peopleEndpoint),
        person.toJson());
  }
}
