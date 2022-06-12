import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:startup_namer/button_icon_round.dart';
import 'package:startup_namer/selected_name_object.dart';
import 'package:startup_namer/selected_names.dart';

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);
  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _initialPlaceholderText = 'Press the blue button to start';
  String _suggestedName = '';
  final List<SelectedNameObject> _selectedNames = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 50.0, bottom: 30.0),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _suggestedName.isEmpty
                          ? _initialPlaceholderText
                          : _suggestedName,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 38),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: FloatingActionButton(
                        onPressed: () => setState(
                          () {
                            _suggestedName = WordPair.random().asPascalCase;
                          },
                        ),
                        child: const Icon(Icons.replay),
                      ),
                    )
                  ],
                )),
            SelectedNames(selectedNames: _selectedNames),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ButtonIconRound(
              state: _selectedNames.isEmpty,
              color: Colors.red,
              icon: Icons.remove,
              onPressed: () => setState(() {
                // remove from list
                _selectedNames.removeWhere((element) => element.remove == true);
                // if _suggestedName isn't on the list, remove checkmark
                bool nameNotInList = !_selectedNames.any((e) => e.name.allMatches(_suggestedName).isNotEmpty);
                if (nameNotInList) {
                  _suggestedName = _suggestedName.replaceAll(RegExp(' ✅'), '');
                }
              }),
            ),
            ButtonIconRound(
              state: _suggestedName.isEmpty,
              color: Colors.green,
              icon: Icons.check,
              onPressed: () => setState(() {
                bool nameAlreadyInList = _suggestedName.contains('✅') ||
                    _selectedNames.isNotEmpty &&
                        _selectedNames
                            .contains(SelectedNameObject(_suggestedName));
                if (nameAlreadyInList) {
                  return;
                }
                _selectedNames.add(SelectedNameObject(_suggestedName));
                _suggestedName = '$_suggestedName ✅';
              }),
            ),
          ],
        ),
      ),
    );
  }
}
