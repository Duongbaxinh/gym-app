import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_app/common_widget/rate_custom.dart';

class PlayerVideo extends StatelessWidget{
  final Duration duration;
  final Duration currentPosition;
  final VoidCallback fn;
  final bool isPlay;

  const PlayerVideo({super.key,
    required this.duration,
    required this.currentPosition,
    required this.fn,
    required this.isPlay});
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
         mainAxisAlignment: MainAxisAlignment.start,
          children: [
            RateCustom(ratting: (currentPosition.inSeconds * 1) ,
              colorTrack: Theme.of(context).colorScheme.onSecondary,
              thumShape: true,
              max: duration.inSeconds * 1,
              min: 0,
              size: 15,
              division: duration.inSeconds,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
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
                IconButton(onPressed: fn, icon: Icon(Icons.loop_sharp,size: 30,)),
                IconButton(onPressed:fn,
                    padding: const EdgeInsets.all(0),
                    icon:                    const Icon(Icons.skip_previous_rounded,size: 30,)),
                IconButton(onPressed:fn,
                    padding: const EdgeInsets.all(0),
                    icon:  isPlay ?
                    const Icon(Icons.pause,size: 50,) :
                    const Icon(Icons.play_circle_outline,size: 50,)),
                IconButton(onPressed:fn,
                    padding: const EdgeInsets.all(0),
                    icon:                    const Icon(Icons.skip_next,size: 30,)),
                IconButton(onPressed: fn, icon: Icon(Icons.volume_up,size: 30,)),
              ],
            ),
          ],
        ),
      ),
    );
  }

}