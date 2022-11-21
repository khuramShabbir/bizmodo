import 'package:bizmodo_emenu/Models/ProductsModel/all_products_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/Theme/colors.dart';

// Dynamic type custom widget
/*class MultiSelectChip<T> extends StatefulWidget {
  final List<T> chipsDataList;
  final Function(List<T>) onSelectionChanged;
  final String Function(T) itemTitle;
  final String Function(T) itemQuantity;
  final List<T> initChoices;

  MultiSelectChip({
    Key? key,
    required this.chipsDataList,
    required this.onSelectionChanged,
    required this.itemTitle,
    required this.itemQuantity,
    required this.initChoices,
  }) : super(key: key);
  @override
  _MultiSelectChipState<T> createState() => _MultiSelectChipState<T>();
}

class _MultiSelectChipState<T> extends State<MultiSelectChip<T>> {
  _buildChoiceList() {
    List<Widget> choices = [];
    for (T item in widget.chipsDataList) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          children: [
            ChoiceChip(
              label: Text(widget.itemTitle(item).capitalize!),
              selectedColor: primaryColor.withOpacity(0.25),
              selected: widget.initChoices.contains(item),
              onSelected: (selected) {
                setState(() {
                  if (widget.initChoices.contains(item)) {
                    widget.initChoices.remove(item);
                  } else {
                    widget.initChoices.add(item);
                  }
                  widget.onSelectionChanged(widget.initChoices); // +added
                });
              },
            ),
            if (widget.initChoices.contains(item))
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () {
                      widget.initChoices.;
                      widget.onSelectionChanged(widget.initChoices);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(2.5),
                      child: Icon(Icons.remove),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text('${a}'),
                  ),
                  InkWell(
                    onTap: () {
                      widget.initChoices.add(item);
                      widget.onSelectionChanged(widget.initChoices);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(2.5),
                      child: Icon(Icons.add),
                    ),
                  ),
                ],
              ),
          ],
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
}*/

class MultiSelectChip extends StatefulWidget {
  final List<VariationModel> chipsDataList;
  final Function(List<VariationModel>) onSelectionChanged;
  final List<VariationModel> initChoices;
  const MultiSelectChip({
    Key? key,
    required this.onSelectionChanged,
    required this.chipsDataList,
    this.initChoices = const <VariationModel>[],
  }) : super(key: key);
  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}

class _MultiSelectChipState extends State<MultiSelectChip> {
  _buildChoiceList() {
    List<Widget> choices = [];
    for (var item in widget.chipsDataList) {
      choices.add(
        Padding(
          padding: const EdgeInsets.all(2.5),
          child: Column(
            children: [
              ChoiceChip(
                label: Text('${item.name.capitalize}'),
                selectedColor: primaryColor.withOpacity(0.25),
                selected: widget.initChoices.contains(item),
                onSelected: (selected) {
                  setState(() {
                    widget.initChoices.contains(item)
                        ? widget.initChoices.remove(item)
                        : widget.initChoices.add(item);
                    widget.onSelectionChanged(widget.initChoices); // +added
                  });
                },
              ),
              if (widget.initChoices.contains(item))
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: () {
                        for (int i = 0; i < widget.initChoices.length; i++) {
                          if (widget.initChoices[i].id == item.id) {
                            widget.initChoices.removeAt(i);
                            break;
                          }
                        }
                        setState(() {});
                        widget.onSelectionChanged(widget.initChoices);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(2.5),
                        child: Icon(Icons.remove),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text(calculateItemVariationLength(item)),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          widget.initChoices.add(item);
                        });
                        widget.onSelectionChanged(widget.initChoices);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(2.5),
                        child: Icon(Icons.add),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      );
    }
    return choices;
  }

  String calculateItemVariationLength(item) {
    try {
      return '${widget.initChoices.where((element) => element.id == item.id).length}';
    } catch (_e) {
      return '0';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}
