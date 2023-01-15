import 'package:flutter/material.dart';
import 'package:trip_app/home_page.dart';

class AddPersonPage extends StatelessWidget {
  const AddPersonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Person'),
      ),
      body: Column(children: [
        const Text('First Name'),
        const TextField(
            decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Enter your first name',
        )),
        const Text('Last Name'),
        const TextField(
            decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Enter your last name',
        )),
        const Text('Email id'),
        const TextField(
            decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Enter a valid email id',
        )),
        const Text('Phone Number'),
        const TextField(
            decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Enter your phone number',
        )),
        const Text('Enter city preferences'),
        const Text('1st Preference'),
        const TextField(
            decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'e.g Tokyo',
        )),
        const Text('2nd preference'),
        const TextField(
            decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'e.g Sydney',
        )),
        const Text('3rd Preference'),
        const TextField(
            decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'e.g Goa',
        )),
        ElevatedButton(
            onPressed: (() => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomePage()))),
            child: const Text('Submit')),
      ]),
    );
  }
}
