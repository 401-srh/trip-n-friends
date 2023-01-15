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
  [tokyo, edm]
];

TextEditingController _controller = TextEditingController();

class AddPersonPage extends StatefulWidget {
  const AddPersonPage({Key? key}) : super(key: key);
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
              decoration: InputDecoration(
                hintText: 'Where do you want to go?',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.clear),
              ),
              controller: _controller,
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  if (_controller.text.length > 0) {
                    user_info.add(_controller.text);
                    _controller.clear();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Text is empty"),
                    ));
                  }
                });
              },
              child: Text("add"),
            ),
            Expanded(
                child: ListView.builder(
              itemCount: user_info.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    onTap: () {},
                    title: Text(user_info[index]),
                  ),
                );
              },
            )),
          ],
        ));
  }
}
