import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_app/common_widget/button_widget.dart';
import 'package:project_app/common_widget/page_header.dart';
import 'package:project_app/common_widget/radio_submit.dart';
import 'package:project_app/constant/index.dart';

class SubmitScreen extends StatefulWidget{
  const SubmitScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SubmitScreenState();
  }

}
class _SubmitScreenState extends State<SubmitScreen>{
  String bgImage = 'https://res.cloudinary.com/dwu92ycra/image/upload/v1700924732/Gym-app/Background_7_mpkdps.png';
  SingingCharacter _character = SingingCharacter.jefferson;
  void setCharacter(SingingCharacter character){
    setState(() {
      _character = character;
    });
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        children: [
          AspectRatio(aspectRatio: 375/459,
          child: PageHeader(title: 'Be Premium',
              sub: 'Get unlimited access',
              description: 'When you subscribe, you’ll get instant unlimited access', image: bgImage) ,
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: RadioSubmit(
                character: _character,
                value: SingingCharacter.jefferson,
                fn: setCharacter,
                isActive: SingingCharacter.jefferson == _character,
                title: 'Monthly',
                sub: 'Pay monthly, cancel any time',
                price: '19.99'),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15,left: 15,right: 15),
            child: RadioSubmit(
                character: _character,
                value: SingingCharacter.lafayette,
                fn: setCharacter,
                isActive: SingingCharacter.lafayette == _character,
                title: 'Monthly',
                sub: 'Pay monthly, cancel any time',
                price: '19.99'),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30),
            height: 60,
            width: 250,
            child: ButtonCustom(
              title: 'Subscribe now',
              fn: (){},
            icon: false,),
          )
        ],
      ),
    );
  }
}