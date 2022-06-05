import 'package:flutter/material.dart';

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
    // return Text(widget.selectedNames.toString());
    return Flexible(
      child: Scrollbar(
        thumbVisibility: true,
        thickness: 5,
        child: ListView(
          shrinkWrap: true,
          children: widget.selectedNames
              .map((e) => Text(e, textAlign: TextAlign.center))
              .toList(),
        ),
      ),
    );
  }
}
