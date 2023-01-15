import 'dart:math';

import 'package:flutter/material.dart';
import 'package:trip_app/controllers/data_controller.dart';
import 'models/city.dart';
import 'models/person.dart';

City tokyo = City(cityName: "Tokyo", country: "Japan");
City edm = City(cityName: "Edmonton", country: "Canada");
City syd = City(cityName: "Sydney", country: "Australia");

List<List<City>> liked_cities_bad = [
  [tokyo, syd],
  [tokyo, edm],
  [tokyo, syd],
];

List<Person> person_list_bad = [
  Person(firstName: "Han", lastName: "Yan"),
  Person(firstName: "Rajan", lastName: "Maghera"),
];

class ListOfPeople extends StatelessWidget {
  const ListOfPeople({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of People'),
      ),
      body: const Center(
        child: BasicList(),
      ),
    );
  }
}

class BasicList extends StatefulWidget {
  const BasicList({super.key});

  @override
  State<BasicList> createState() => _BasicListState();
}

class _BasicListState extends State<BasicList> {
  late List<Person>? _person_list = [];
  late List<List<City>> _liked_cities = [];
  late final List<double> _distances = [];

  @override
  void initState() {
    super.initState();
    _getData(context);
  }

  void _getData(BuildContext context) async {
    var userItems = await DataController(context).getPeopleCloseToMe();
    List<List<City>> liked = [];
    for (var user in userItems) {
      liked.add(await DataController(context).getCitiesLikedBy(user));
    }
    setState(() {
      _person_list = userItems;
      _liked_cities = liked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text('Basic List'),
          _person_list == null
              ? const CircularProgressIndicator()
              : Expanded(
                  child: ListView.builder(
                  itemCount: _person_list!.length,
                  itemBuilder: (context, index) {
                    List<String> cityLists = [];
                    for (var cityList in _liked_cities) {
                      String finalList = "";
                      for (var city in cityList) {
                        finalList += "${city.cityName}, ${city.country} | ";
                      }
                      cityLists.add(finalList);
                    }

                    return Card(
                        child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${_person_list![index].id}: ${_person_list![index].firstName} ${_person_list![index].lastName}",
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                              "${_distances[index]} km | Liked cities: | ${cityLists[index]}")
                        ],
                      ),
                    ));
                  },
                )),
        ],
      ),
    );
  }
}

double calculateDistance(lat1, lon1, lat2, lon2) {
  var p = 0.017453292519943295;
  var c = cos;
  var a = 0.5 -
      c((lat2 - lat1) * p) / 2 +
      c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
  return 12742 * asin(sqrt(a));
}
