import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {
  final String title;
  final VoidCallback fn;
  final bool icon;
  final double height;
  const ButtonCustom(
      {super.key,
      required this.title,
      required this.fn,
      this.height = 50,
      this.icon = true});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: height,
        child: ElevatedButton(
          onPressed: fn,
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50))),
              padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 15)),
              backgroundColor: MaterialStateProperty.all(
                Theme.of(context).colorScheme.onSecondary,
              )),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(title,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(width: 10),
              if (icon)
                const Icon(
                  Icons.arrow_right,
                  size: 35,
                )
            ],
          ),
        ),
      ),
    );
  }
}
