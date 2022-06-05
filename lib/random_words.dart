import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:startup_namer/button_icon_round.dart';

class SelectedNames extends StatefulWidget {
  final List selectedNames;

  const SelectedNames({Key? key, required this.selectedNames})
      : super(key: key);

  @override
  State<SelectedNames> createState() => _SelectedNamesState();
}

class _SelectedNamesState extends State<SelectedNames> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.selectedNames.toString());
  }
}

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);
  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final initialPlaceholderText = 'Press the blue button to start';
  String suggestedName = '';
  final selectedNames = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              suggestedName.isEmpty ? initialPlaceholderText : suggestedName,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 38),
            ),
            FloatingActionButton(
              onPressed: () => setState(
                () {
                  suggestedName = WordPair.random().asPascalCase;
                },
              ),
              child: const Icon(Icons.replay),
            ),
            SelectedNames(selectedNames: selectedNames),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ButtonIconRound(
              state: suggestedName.isEmpty,
              color: Colors.red,
              icon: Icons.remove,
              onPressed: () => setState(() {
                selectedNames.removeWhere((element) =>
                    element == suggestedName.replaceAll(RegExp(' ✅'), ''));
                suggestedName = suggestedName.replaceAll(RegExp(' ✅'), '');
              }),
            ),
            ButtonIconRound(
              state: suggestedName.isEmpty,
              color: Colors.green,
              icon: Icons.check,
              onPressed: () => setState(() {
                selectedNames.add(suggestedName);
                suggestedName = '$suggestedName ✅';
              }),
            ),
          ],
        ),
      ),
    );
  }
}
