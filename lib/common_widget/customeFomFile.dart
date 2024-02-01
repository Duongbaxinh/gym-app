import 'package:flutter/material.dart';

class CustomTextFile extends StatelessWidget {
  final String lableText;
  final String type;
  final String? compare;
  final bool? show;
  final VoidCallback? fn;
  final TextEditingController textEditingController;
  const CustomTextFile(
      {super.key,
      required this.lableText,
      this.show,
      this.fn,
      this.compare,
      required this.textEditingController,
      required this.type});

  String? validate(String value, String type) {
    if (value == null || value.isEmpty) {
      return 'Please enter your $type';
    }
    if (type == 'again_password' &&
        (value == null || value.isEmpty || value != compare)) {
      return '$type is not true';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    Color yel = Theme.of(context).colorScheme.onSecondary;
    TextStyle? textInputStyle = Theme.of(context).textTheme.headline4;
    TextStyle? subStyle =
        Theme.of(context).textTheme.headline4!.copyWith(color: yel);
    return TextFormField(
        controller: textEditingController,
        obscureText: (type.toLowerCase() == 'password' ||type.toLowerCase() ==  'again_password')
            ? show! ? false: true: false,
        style: textInputStyle,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 30, bottom: 10),
          labelText: lableText,
          labelStyle: subStyle,
          suffixIcon: (type.toLowerCase() == 'password' || type.toLowerCase() == 'again_password')
              ? IconButton(
                  onPressed: fn,
                  icon: ImageIcon(show!
                      ? const AssetImage('assets/images/show_icon.png')
                      : const AssetImage('assets/images/hidden_icon.png')),
                )
              : null,
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey)),
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: yel)),
        ),
        validator: (value) => validate(value!, type.toLowerCase())
    );
  }
}
