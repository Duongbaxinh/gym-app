
import 'package:flutter/material.dart';
import 'package:project_app/constant/index.dart';

class RadioSubmit extends StatelessWidget{
  final SingingCharacter character;
  final String title;
  final String sub;
  final String price;
  final SingingCharacter value;
  final bool isActive;
  final void Function(SingingCharacter) fn;
  const RadioSubmit({
    super.key,
    required this.character,
    required this.fn,
    required this.title,
    required this.sub,
    required this.price,
    required this.value,
    this.isActive = false});

  @override
  Widget build(BuildContext context){
    TextStyle titleStyle = Theme.of(context).textTheme.headline6!;
    TextStyle subStyle = Theme.of(context).textTheme.subtitle2!;
    return Container(
      padding: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        border: Border.all(color: isActive ? Colors.red : Colors.white)
      ),
      child: ListTile(
        leading: Radio<SingingCharacter>(
          value: value!,
          groupValue: character,
          activeColor: Colors.red,
          onChanged: (SingingCharacter? value) => fn(value!),
        ),
        title: Text(title,style: titleStyle,),
        subtitle: Text(sub,style: subStyle.copyWith(color: isActive ? Colors.red : Colors.white ),),
        trailing: Text('$price \$',style: titleStyle,),
      ),
    );
  }

}