import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:startup_namer/button_icon_round.dart';

class SelectedNames extends StatefulWidget {
  final List startupName;

  const SelectedNames({Key? key, required this.startupName}) : super(key: key);

  @override
  State<SelectedNames> createState() => _SelectedNamesState();
}

class _SelectedNamesState extends State<SelectedNames> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.startupName.toString());
  }
}

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);
  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final initialPlaceholderText = 'Press the blue button to start';
  String startupName = '';
  final selectedNames = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Column(children: [
          Center(
            child: Text(
              startupName.isEmpty ? initialPlaceholderText : startupName,
              style: const TextStyle(fontSize: 38),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: FloatingActionButton(
              onPressed: () => setState(
                () {
                  startupName = WordPair.random().asPascalCase;
                },
              ),
              child: const Icon(Icons.replay),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: SelectedNames(startupName: selectedNames),
          )
        ]),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ButtonIconRound(
              state: startupName.isEmpty,
              color: Colors.red,
              icon: Icons.remove,
              onPressed: () => setState(() {
                selectedNames.removeWhere((element) =>
                    element == startupName.replaceAll(RegExp(' ✅'), ''));
              }),
            ),
            ButtonIconRound(
              state: startupName.isEmpty,
              color: Colors.green,
              icon: Icons.check,
              onPressed: () => setState(() {
                selectedNames.add(startupName);
                startupName = '$startupName ✅';
              }),
            ),
          ],
        ),
      ),
    );
  }
}
