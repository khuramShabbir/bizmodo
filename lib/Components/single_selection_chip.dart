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
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          label: Text(item),
          selectedColor: primaryColor.withOpacity(.3),
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
