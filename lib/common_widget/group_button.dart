import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

class GroupButtonCustom extends StatelessWidget {
  final void Function(String value) fn;
  final String initSelected;
  final List<String> listButton;
  const GroupButtonCustom(
      {super.key,
      required this.fn,
      required this.listButton,
      required this.initSelected});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(20)),
        child: GroupButton(
          controller: GroupButtonController(
              selectedIndex: listButton.indexOf(initSelected)),
          onSelected: (value, index, isSelected) => fn(value),
          buttons: listButton,
          options: GroupButtonOptions(
            unselectedShadow: [const BoxShadow(color: Colors.transparent)],
            unselectedBorderColor: Colors.transparent,
            mainGroupAlignment: MainGroupAlignment.spaceBetween,
            textPadding: const EdgeInsets.symmetric(horizontal: 15),
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            selectedColor: Theme.of(context).colorScheme.onSecondary,
            unselectedColor: Colors.transparent,
            buttonHeight: 38,
            selectedTextStyle: const TextStyle(color: Colors.black),
            unselectedTextStyle: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
