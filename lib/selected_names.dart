import 'package:flutter/material.dart';

import 'package:startup_namer/name_card.dart';

class SelectedNames extends StatefulWidget {
  final List selectedNames;
  final Function disableRemoveButton;

  const SelectedNames(
      {Key? key,
      required this.selectedNames,
      required this.disableRemoveButton})
      : super(key: key);

  @override
  State<SelectedNames> createState() => _SelectedNamesState();
}

class _SelectedNamesState extends State<SelectedNames> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Scrollbar(
        thumbVisibility: true,
        thickness: 5,
        child: ListView(
          shrinkWrap: true,
          children: widget.selectedNames
              .map(
                (e) => NameCard(
                    selectedNameObject: e,
                    disableRemoveButton: widget.disableRemoveButton),
              )
              .toList(),
        ),
      ),
    );
  }
}
