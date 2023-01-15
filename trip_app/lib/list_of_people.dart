import 'package:flutter/material.dart';
import 'package:trip_app/controllers/data_controller.dart';

import 'models/person.dart';

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
                    itemCount: _data!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                            '${_data![index].firstName!} ${_data![index].lastName!}'),
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
