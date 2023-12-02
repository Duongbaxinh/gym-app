import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_app/common_widget/custom_chip.dart';
import 'package:project_app/constant/index.dart';

class TrainerCard extends StatelessWidget{
  final String trainerName;
  final String specializeIn;
  final String experience;
  final String evaluate;
  final String avatar;
  final VoidCallback fn;
  const TrainerCard({
    super.key,
    required this.trainerName,
    required this.specializeIn,
    required this.experience,
    required this.evaluate,
    required this.avatar,
    required this.fn
  });
  @override
  Widget build(BuildContext context) {
    Color yelSchema = Theme.of(context).colorScheme.onSecondary;
    TextStyle titleStyle = Theme.of(context).textTheme.headline4!;
    TextStyle chipStyle = Theme.of(context).textTheme.subtitle1!;
    TextStyle subStyle = Theme.of(context).textTheme.subtitle1!.copyWith(color:yelSchema,fontWeight: FontWeight.normal );
    return Container(
     height: 96,
      color:  Theme.of(context).colorScheme.onSecondaryContainer,
      child:
      Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CircleAvatar(backgroundImage: NetworkImage(avatar),radius:35 ),
            const SizedBox(width: 15,),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    Text(trainerName,style: titleStyle,),
                    const SizedBox(width: 10,),
                    const SizedBox(width: 10,),
                    SizedBox(
                      height: 25,
                      child: ChipCustom(
                     label: evaluate,
                      ),
                    )],),
                  Text(specializeIn,style: subStyle,),
                  Text('$experience years experiences',style: subStyle,),
                ],
              ),
            ),
            IconButton(onPressed: fn, icon: ImageIcon(NetworkImage(arrowRight))),
          ],
        ),
      )
    );
  }
}
