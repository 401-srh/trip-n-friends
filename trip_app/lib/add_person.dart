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
        const Text('Enter your first name'),
        const TextField(
            decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'e.g. Sparsh',
        )),
        const Text('Enter your last name'),
        const TextField(
            decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'e.g. Thakur',
        )),
        const Text('Enter a valid Email id'),
        const TextField(
            decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'e.g. abc@gmail.com',
        )),
        const Text('Enter your phone number'),
        const TextField(
            decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'e.g. 123456789',
        )),
        ElevatedButton(
            onPressed: (() => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomePage()))),
            child: const Text('Submit')),
      ]),
    );
  }
}
