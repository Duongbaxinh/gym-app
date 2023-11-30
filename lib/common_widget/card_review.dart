import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_app/common_widget/custom_chip.dart';

class CardReview extends StatelessWidget {
  final String avatar;
  final String name;
  final String evaluate;
  final String comment;
  const CardReview(
      {super.key,
      required this.avatar,
      required this.name,
      required this.evaluate,
      required this.comment});
  @override
  Widget build(BuildContext context) {
    Color yelSchema = Theme.of(context).colorScheme.onSecondary;
    Color greySchema = Theme.of(context).colorScheme.onSurface;
    TextStyle nameStyle = Theme.of(context).textTheme.headline3!;
    TextStyle subStyle = Theme.of(context).textTheme.subtitle1!;
    return Container(
      width: 300,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: greySchema,
      ),
      child:
      Column(
        children: [
          ListTile(
            leading: CircleAvatar(backgroundImage: NetworkImage(avatar),),
            title: Row(children: [Text(name,style: nameStyle,),
              const SizedBox(width: 20,),
              Expanded(child: ChipCustom(label: evaluate.toString()))
            ],),
            trailing: const Text('2d ago'),
          ),
          Container(
              padding: EdgeInsets.only(top: 10),
              child: Text(comment,style: subStyle.copyWith(fontWeight: FontWeight.normal),maxLines:4,overflow: TextOverflow.ellipsis,))
        ],
      )
    );
  }
}
