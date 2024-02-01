import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckboxCustom extends StatefulWidget {
  const CheckboxCustom({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CheckboxCustomState();
  }
}

class _CheckboxCustomState extends State<CheckboxCustom> {
  bool isChecked = false;
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}
