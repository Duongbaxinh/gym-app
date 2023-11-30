import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_app/common_widget/bottom_button.dart';
import 'package:project_app/common_widget/card_review.dart';
import 'package:project_app/common_widget/custome_icon_button.dart';
import 'package:project_app/common_widget/group_button.dart';
import 'package:project_app/common_widget/rate_custom.dart';
import 'package:project_app/constant/index.dart';
import 'package:project_app/constant/list_data_start.dart';

class RattingScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _RattingScreenState();
  }
}
class _RattingScreenState extends State<RattingScreen>{
  @override
  Widget build(BuildContext context){
    TextStyle titleStyle = Theme.of(context).textTheme.headline2!;
    TextStyle labelTitle = Theme.of(context).textTheme.headline1!;
    TextStyle subStyle = Theme.of(context).textTheme.subtitle1!;
    TextStyle subLabel = Theme.of(context).textTheme.subtitle2!;

    return Scaffold(
      appBar: AppBar(
        title: Text('reviews'.toUpperCase(),style: titleStyle,),
        centerTitle: true,
        elevation: 0,
        leading: Container(
            padding: EdgeInsets.only(left: 15),
            child: CustomeIconButton(imageIcon: arrowLeft,fn: (){},)),
      ),
      bottomNavigationBar: SizedBox(
        height: 100,
          child: BottomButton(title: "Write a Review", fn: (){},heightOver: 120,)),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            height: 50,
              child: GroupButtonCustom(fn: (value){}, listButton: const ['Recent','Critical','Favourable'])),
         Container(
           margin: const EdgeInsets.only(top: 30),
           height: 50,
           child: Row(
             children: [
               Expanded(
                 flex: 1,
                   child: Center(child: Text('4.6',style: labelTitle.copyWith(fontSize: 48),))),
                Expanded(
                 flex: 3,
                 child: Container(
                   padding: const EdgeInsets.only(left: 30),
                   child: const Column(
                     children: [
                       RateCustom(label:'5',ratting: 80, size: 2,height: 10,),
                       RateCustom(label:'4',ratting: 50, size: 2,height: 10,),
                       RateCustom(label:'3',ratting: 30, size: 2,height: 10,),
                       RateCustom(label:'2',ratting: 40, size: 2,height: 10,),
                       RateCustom(label:'1',ratting: 15, size: 2,height: 10,),
                     ],
                   ),
                 ),
               )
             ],
           ),
         ),
          SizedBox(height: 10,),
          Align(alignment: Alignment.topRight,
            child: Text('${trainerReview['reviews']!.toString()} Ratings'),),
          SizedBox(height: 35,),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              child: ListView.separated(
                  itemBuilder: (context, index) => CardReview(
                      avatar:
                      review[index]!['client']!['avatar']!,
                      name: review[index]!['client']!['name']!,
                      evaluate:
                      review[index]!['client']!['evaluate']!
                          .toString(),
                      comment: review[index]!['comment']!),
                  separatorBuilder: (context, index) => SizedBox(height: 10,) ,
                  itemCount: review.length),
            ),
          ),
        ],),
      ),
    );
  }

}