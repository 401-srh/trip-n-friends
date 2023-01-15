import 'package:flutter/material.dart';
import 'package:trip_app/models/city.dart';

import 'api_service.dart';
import '../models/person.dart';

class DataController {
  BuildContext context;
  DataController(this.context);

  Future<List<Person>> getPeopleCloseToMe() async {
    return await ApiService(context).getPeopleCloseTo(2);
  }

  Future<List<City>> getCities() async {
    return await ApiService(context).getCities();
  }

  Future<List<City>> getCitiesLikedBy(Person person) async {
    return await ApiService(context).getCitiesForPerson(person.id!);
  }

  Future<List<City>> getCitiesLikedByMe() async {
    return await ApiService(context).getCitiesForPerson(2);
  }

  Future<bool> addPerson(Person person) async {
    return await ApiService(context).addPerson(person);
  }
}
