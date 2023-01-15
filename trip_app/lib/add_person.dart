import 'package:flutter/material.dart';
import 'models/city.dart';
import 'models/person.dart';

List user_info = [
  'A likes Tokyo, Sydney',
  'B likes Edmonton, Toronto',
  'C likes Montreal, Vancourver'
];

//List user_info = [];
List<Person> person_list = [
  Person(firstName: "Han", lastName: "Yan"),
  Person(firstName: "Rajan", lastName: "Maghera"),
];

City tokyo = City(cityName: "Tokyo", country: "Japan");
City edm = City(cityName: "Edmonton", country: "Canada");
City syd = City(cityName: "Sydney", country: "Australia");

List<List<City>> liked_cities = [
  [tokyo, syd],
  [tokyo, edm],
  [tokyo, syd]
];

TextEditingController _controller = TextEditingController();

class AddPersonPage extends StatefulWidget {
  const AddPersonPage({Key? key}) : super(key: key);
  @override
  AddPerson createState() => AddPerson();
}

class AddPerson extends State<AddPersonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Person'),
        ),
        body: Column(
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(
                hintText: 'Where do you want to go?',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.clear),
              ),
              controller: _controller,
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  if (_controller.text.isNotEmpty) {
                    user_info.add(_controller.text);
                    _controller.clear();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Text is empty"),
                    ));
                  }
                });
              },
              child: const Text("add"),
            ),
            Expanded(
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
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text("Liked cities: | ${cityLists[index]}")
                    ],
                  ),
                ));
              },
            )),
          ],
        ));
  }
}
