import 'package:flutter/material.dart';

class AddPersonPage extends StatelessWidget {
  const AddPersonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Person'),
      ),
      body: const Center(
        child: Text('Add Person'),
      ),
    );
  }
}
