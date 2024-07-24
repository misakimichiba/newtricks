import 'package:flutter/material.dart';
import 'package:flutter_newtricks_test/pages/practice/practice_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final List<Map<String, dynamic>> _allAnimals = [
    {"id": 1, "name": "Dog"},
    {"id": 2, "name": "Cat"},
    {"id": 3, "name": "Bird"},
    {"id": 4, "name": "Horse"},
    {"id": 5, "name": "Ant"},
    {"id": 6, "name": "Fish"},
    {"id": 7, "name": "Cow"},
    {"id": 8, "name": "Cockroach"},
    {"id": 9, "name": "Goat"},
    {"id": 10, "name": "Sheep"},
    {"id": 11, "name": "Dog"},
    {"id": 12, "name": "Cat"},
    {"id": 13, "name": "Bird"},
    {"id": 14, "name": "Horse"},
    {"id": 15, "name": "Ant"},
    {"id": 16, "name": "Fish"},
    {"id": 17, "name": "Cow"},
    {"id": 18, "name": "Monkey"},
    {"id": 19, "name": "Goat"},
    {"id": 20, "name": "Sheep"},
  ];

  List<Map<String, dynamic>> _foundAnimals = [];
  @override
  void initState() {
    // TODO: implement initState
    _foundAnimals = _allAnimals;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = _allAnimals;
    } else {
      results = _allAnimals
          .where((animal) => animal["name"]
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundAnimals = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const Text(
              'Using the search bar, search for this animal: Monkey and click on it',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                height: 1,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25,
                  height: 1,
                ),
                onChanged: (value) => _runFilter(value),
                decoration: const InputDecoration(
                  iconColor: Colors.black,
                  labelText: 'Search',
                  suffixIcon: Icon(Icons.search),
                )),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: _foundAnimals.length,
                  itemBuilder: (context, index) => Card(
                        key: ValueKey(_foundAnimals[index]["id"]),
                        color: Colors.black,
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          onTap: () {
                            if (_foundAnimals[index]['name'].toString() ==
                                'Monkey') {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const PracticePage()));
                            }
                          },
                          leading: Text(
                            _foundAnimals[index]['id'].toString(),
                            style: const TextStyle(color: Colors.white, fontSize: 25),
                          ),
                          title: Text(
                            _foundAnimals[index]['name'].toString(),
                            style: const TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ),
                      )),
            ),
          ],
        ),
      ),
    );
  }
}
