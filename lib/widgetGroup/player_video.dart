import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_app/common_widget/rate_custom.dart';
import 'package:project_app/constant/index.dart';

class PlayerVideo extends StatelessWidget{
  final Duration duration;
  final Duration currentPosition;
  final VoidCallback onPlay;
  final void Function(double) onPosition;
  final void Function(String) onSwitch;
  final VoidCallback onLoop;
  final VoidCallback onVolume;
  final bool isPlay;
  final bool isVolume;
  final String description;

  const PlayerVideo({super.key,
    required this.duration,
    required this.currentPosition,
    required this.onPlay,
    required this.isPlay,
    required this.isVolume,
    required this.description,
    required this.onPosition,
    required this.onVolume, required this.onLoop, required this.onSwitch});
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
         mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
              child: Text(description,),
            ),
            RateCustom(ratting: (currentPosition.inSeconds * 1) ,
              colorTrack: Theme.of(context).colorScheme.onSecondary,
              thumShape: true,
              onRatting: onPosition,
              max: duration.inSeconds * 1,
              min: 0,
              size: 15,
              division: duration.inSeconds,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children:[
               Text(currentPosition.toString().substring(0,7)),
               Text(duration.toString().substring(0,7))
           ]
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(onPressed: onLoop, icon: ImageIcon(NetworkImage(REPEAT_ICON))),
                IconButton(onPressed:(){
                  print('run at here');
                  onSwitch('prev');},
                    padding: const EdgeInsets.all(0),
                    icon:                    const Icon(Icons.skip_previous_rounded,size: 30,)),
                IconButton(onPressed:onPlay,
                    padding: const EdgeInsets.all(0),
                    icon:  isPlay ?
                     ImageIcon(NetworkImage(PAUSE_ICON),size: 50,) :
                    ImageIcon(NetworkImage(PLAY_ICON),size: 50,),),
                IconButton(onPressed:(){onSwitch('next');},
                    padding: const EdgeInsets.all(0),
                    icon:const Icon(Icons.skip_next,size: 30,)),
                IconButton(onPressed: onVolume, icon: isVolume ? ImageIcon(NetworkImage(VOLUM_UP)) : ImageIcon(NetworkImage(VOLUM_DOWN)) ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}