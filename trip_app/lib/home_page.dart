import 'package:flutter/material.dart';
import 'package:trip_app/controllers/location_controller.dart';

import 'add_person.dart';
import 'list_of_people.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OutlinedButton(
              onPressed: (() => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AddPersonPage()))),
              child: const Text('Add Person')),
          OutlinedButton(
              onPressed: (() => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ListOfPeople()))),
              child: const Text('List of People')),
          OutlinedButton(
              onPressed: (() => getLocation()),
              child: const Text('Display Location'))
        ],
      )),
    );
  }
}

void getLocation() {
  AppLocation().getLocation().then((value) => print(value));
}
