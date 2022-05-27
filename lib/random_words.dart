import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class SelectedNames extends StatefulWidget {
  final String startupName;

  const SelectedNames({Key? key, required this.startupName}) : super(key: key);

  @override
  State<SelectedNames> createState() => _SelectedNamesState();
}

class _SelectedNamesState extends State<SelectedNames> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) =>
      Text(widget.startupName)
    );
  }
}

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);
  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  var starupName = 'Press the blue button to start';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Column(children: [
          Center(
            child: Text(
              starupName,
              style: const TextStyle(fontSize: 38),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: FloatingActionButton(
              onPressed: () => setState(
                () {
                  starupName = WordPair.random().asPascalCase;
                },
              ),
              child: const Icon(Icons.replay),
            ),
          ),
          Padding(padding: const EdgeInsets.only(top:20.0),
          child: SelectedNames(startupName: starupName),)
        ]),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              onPressed: () => setState(
                () {
                  starupName = starupName.replaceAll(RegExp(' ✅'), '');
                },
              ),
              backgroundColor: Colors.red,
              child: const Icon(Icons.remove),
            ),
            FloatingActionButton(
              onPressed: () => setState(() {
                starupName = '$starupName ✅';
              }),
              backgroundColor: Colors.green,
              child: const Icon(Icons.check),
            ),
          ],
        ),
      ),
    );
  }
}
