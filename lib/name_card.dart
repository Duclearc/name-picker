import 'package:flutter/material.dart';

import 'package:startup_namer/selected_name_object.dart';

class NameCard extends StatefulWidget {
  final SelectedNameObject selectedNameObject;
  final Function disableRemoveButton;

  const NameCard(
      {Key? key,
      required this.selectedNameObject,
      required this.disableRemoveButton})
      : super(key: key);

  @override
  State<NameCard> createState() => _NameCardState();
}

class _NameCardState extends State<NameCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                widget.selectedNameObject.name,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 25),
              ),
            ),
            Checkbox(
              value: widget.selectedNameObject.remove,
              fillColor: MaterialStateProperty.all(Colors.blue),
              onChanged: (bool? value) {
                setState(() {
                  widget.selectedNameObject.remove = value!;
                  if (value) {
                    // add checkmark
                    widget.selectedNameObject.remove = true;
                  } else {
                    // remove checkmark
                    widget.selectedNameObject.remove = false;
                  }
                  widget.disableRemoveButton();
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
