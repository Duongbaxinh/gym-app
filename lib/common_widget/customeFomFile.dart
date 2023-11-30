import 'package:flutter/material.dart';
class CustomeTextFile extends StatelessWidget{
  final String lableText;
  final String type;
  final String? compare;
  final bool? show;
  final VoidCallback? fn;
  final TextEditingController textEditingController;
  const CustomeTextFile({super.key,
    required this.lableText,
    this.show,
    this.fn,
    this.compare,
    required this.textEditingController,
    required this.type});

  String? validate(String value,String type){
    if(value == null || value.isEmpty){
      return 'Please enter your $type';
    }
    if(type == 'again_password' && (value== null || value.isEmpty || value != compare)){
      return '$type is not true';
    }
    return null;
  }
  @override
  Widget build(BuildContext context) {
    Color yel = Theme.of(context).colorScheme.onSecondary;
    TextStyle? h4 = Theme.of(context).textTheme.headline4;
    TextStyle? sub = Theme.of(context).textTheme.headline4!.copyWith(color: yel);
   return  TextFormField(
     controller: textEditingController,
       obscureText: (lableText.toLowerCase() == 'password')? show! ? false : true : false,
       style: h4,
       decoration: InputDecoration(
         contentPadding: const EdgeInsets.only(top: 30,bottom: 10),
         labelText: lableText,
         labelStyle: sub,
         suffixIcon: 
         (type.toLowerCase() == 'password') ?
          IconButton(
            onPressed: fn,
              icon: Icon(show! ? Icons.remove_red_eye_rounded
                  : Icons.ac_unit),
          ): null,
         enabledBorder: const UnderlineInputBorder(
             borderSide: BorderSide(color: Colors.grey)
         ),
         focusedBorder: UnderlineInputBorder(
             borderSide: BorderSide(color: yel)
         ),
       ),
       validator: (value)=> validate(value!, type.toLowerCase())
   );
  }

}