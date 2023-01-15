import 'package:flutter/material.dart';
import 'package:trip_app/controllers/data_controller.dart';
import 'models/city.dart';
import 'models/person.dart';

City tokyo = City(cityName: "Tokyo", country: "Japan");
City edm = City(cityName: "Edmonton", country: "Canada");
City syd = City(cityName: "Sydney", country: "Australia");

List<List<City>> liked_cities = [
  [tokyo, syd],
  [tokyo, edm]
];

List<Person> person_list = [
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
  late List<Person>? _data = [];

  void _getData(BuildContext context) async {
    var userItems = await DataController(context).getPeopleCloseToMe();
    setState(() {
      _data = userItems;
    });
  }

  @override
  void initState() {
    super.initState();
    _getData(context);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text('Basic List'),
          _data == null
              ? const CircularProgressIndicator()
              : Expanded(
                  child: ListView.builder(
                  itemCount: person_list.length,
                  itemBuilder: (context, index) {
                    List<String> cityLists = [];
                    for (var cityList in liked_cities) {
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
                            "${person_list[index].firstName} ${person_list[index].lastName}",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text("Liked cities: | ${cityLists[index]}")
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
