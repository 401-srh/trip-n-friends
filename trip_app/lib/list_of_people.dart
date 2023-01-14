import 'package:flutter/material.dart';

class ListOfPeople extends StatelessWidget {
  const ListOfPeople({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of People'),
      ),
      body: const Center(
        child: Text('List of People'),
      ),
    );
  }
}
