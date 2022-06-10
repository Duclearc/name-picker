import 'package:flutter/material.dart';

class SelectedNames extends StatefulWidget {
  final List selectedNames;

  const SelectedNames({Key? key, required this.selectedNames})
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
                (e) => Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Color(Colors.blue.value),
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                  ),
                  child: SizedBox(
                    width: 300,
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          e,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 25),
                        ),
                        Checkbox(
                          value: isChecked,
                          fillColor: MaterialStateProperty.all(Colors.blue),
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        )
                      ],
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
