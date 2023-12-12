import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:project_app/block/workout_plan_provider.dart';
import 'package:provider/provider.dart';
class GroupButtonCustom extends StatelessWidget{
  final void Function(String value) fn;
  final String initSelected;
  final List<String> listButton;
  const GroupButtonCustom({
    super.key,
    required this.fn,
    required this.listButton,
    required this.initSelected});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(25)
        ),
        child: GroupButton(
          controller: GroupButtonController(selectedIndex: listButton.indexOf(initSelected)),
          onSelected: (value, index, isSelected) => fn(value),
          buttons: listButton,
          options: GroupButtonOptions(
            runSpacing: 10,
            unselectedShadow: [
              const BoxShadow(color: Colors.transparent)
            ],
            unselectedBorderColor: Colors.transparent,
            textPadding: const EdgeInsets.symmetric(horizontal: 20),
            mainGroupAlignment: MainGroupAlignment.spaceBetween,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            selectedColor: Theme.of(context).colorScheme.onSecondary,
            unselectedColor: Colors.transparent,
            buttonHeight: 38,
            spacing: 10,
            selectedTextStyle: const TextStyle(color: Colors.black),
            unselectedTextStyle: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

}