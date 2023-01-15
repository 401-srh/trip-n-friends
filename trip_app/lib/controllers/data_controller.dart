import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trip_app/models/city.dart';

import 'api_service.dart';
import '../models/person.dart';

class DataController {
  BuildContext context;
  DataController(this.context);

  Future<List<Person>> getPeopleCloseToMe() async {
    final prefs = await SharedPreferences.getInstance();
    final myId = prefs.getInt('myId') ?? 1;
    return await ApiService(context).getPeopleCloseTo(myId);
  }

  Future<List<City>> getCities() async {
    return await ApiService(context).getCities();
  }

  Future<List<City>> getCitiesLikedBy(Person person) async {
    return await ApiService(context).getCitiesForPerson(person.id!);
  }

  Future<List<City>> getCitiesLikedByMe() async {
    final prefs = await SharedPreferences.getInstance();
    final myId = prefs.getInt('myId') ?? 1;
    return await ApiService(context).getCitiesForPerson(myId);
  }

  Future<bool> addPerson(Person person) async {
    final id = await ApiService(context).addPerson(person);
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('myId', id);
    return id > 0;
  }
}
