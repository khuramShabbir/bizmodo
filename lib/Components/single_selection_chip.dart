import 'package:flutter/material.dart';
import 'package:hungerz_ordering/utils.dart';

import '../Theme/colors.dart';

class SingleSelectionChip extends StatefulWidget {
  final List<String> chipsDataList;
  final ValueChanged<String> valueChanged;

  SingleSelectionChip({
    Key? key,
    required this.valueChanged,
    required this.chipsDataList,
  }) : super(key: key);

  @override
  _SingleSelectionChipState createState() => _SingleSelectionChipState();
}

class _SingleSelectionChipState extends State<SingleSelectionChip> {
  String initChoice = "";

  _buildChoiceList() {
    List<Widget> choices = [];
    for (var item in widget.chipsDataList) {
      choices.add(Container(
        padding: const EdgeInsets.all(5.0),
        child: ChoiceChip(
          label: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              item,
              style: TextStyle(color: initChoice == item ? Colors.white : Colors.black),
            ),
          ),
          selectedColor: primaryColor,
          selected: initChoice == item,
          onSelected: (selected) {
            setState(() {
              initChoice = item;
              widget.valueChanged(initChoice);
            });
          },
        ),
      ));
    }
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}
