import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
              onPressed: (() => getLocation(context)),
              child: const Text('Display Location')),
          OutlinedButton(
              onPressed: (() {
                showDialog(
                    context: context,
                    builder: (context) => const UpdateIDDialog());
              }),
              child: const Text('Set User ID')),
        ],
      )),
    );
  }
}

void getLocation(BuildContext context) {
  AppLocation().getLocation().then((value) => ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(value.toString()))));
}

class UpdateIDDialog extends StatefulWidget {
  const UpdateIDDialog({super.key});

  @override
  State<UpdateIDDialog> createState() => _UpdateIDDialogState();
}

class _UpdateIDDialogState extends State<UpdateIDDialog> {
  String value = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Update User ID'),
      content: TextField(
        onChanged: (value) {
          // update shared preferences
          setState(() {
            this.value = value;
          });
        },
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'User ID',
        ),
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel')),
        TextButton(
            onPressed: () async {
              // update shared preferences
              await SharedPreferences.getInstance()
                  .then((value) => value.setInt('myId', int.parse(this.value)));
              Navigator.pop(context);
            },
            child: const Text('Update'))
      ],
    );
  }
}
