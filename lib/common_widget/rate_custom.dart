
import 'package:flutter/material.dart';

class RateCustom extends StatelessWidget{
  final double ratting;
  final double size;
  final String? label;
  final Color colorTrack;
  final double height;
  final void Function(double)? onRatting;
  const RateCustom({
    super.key,
    required this.ratting,
    required this.size,
     this.label,
    this.onRatting,
    this.height = 25,
    this.colorTrack = Colors.white
  });
  @override
  Widget build(BuildContext context){
    TextStyle subLabel = Theme.of(context).textTheme.subtitle2!;
    return   Container(
      width: double.infinity,
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if(label != null )Text(label!,style: subLabel,),
          SizedBox(width: 5,),
          Expanded(
            child: Container(
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  trackHeight: size,
                  thumbShape: SliderComponentShape.noThumb,
                  overlayShape: SliderComponentShape.noOverlay
                ),
                child: Slider(
                  value: ratting,
                  max: 100,
                  activeColor: colorTrack,
                  inactiveColor: Colors.green,
                  divisions: 100,
                  label: ratting.toString(),
                  onChanged: (value){
                    if(onRatting != null){
                       onRatting!(value);
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}