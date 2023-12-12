import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_app/block/models/review_model.dart';
import 'package:project_app/common_widget/bottom_button.dart';
import 'package:project_app/common_widget/card_review.dart';
import 'package:project_app/common_widget/custome_icon_button.dart';
import 'package:project_app/common_widget/group_button.dart';
import 'package:project_app/common_widget/rate_custom.dart';
import 'package:project_app/constant/index.dart';
import 'package:project_app/constant/list_data_start.dart';
import 'package:project_app/screens/write_comment_screen.dart';
import 'package:project_app/widgetGroup/review_layout.dart';

class RattingScreen extends StatefulWidget{
  final Map<String,dynamic> rattingCalculate ;
  final String idTrainer;
  final List<ReviewModel> reviewsList;
  const RattingScreen({super.key, required this.rattingCalculate, required this.reviewsList, required this.idTrainer});
  @override
  State<StatefulWidget> createState() {
    return _RattingScreenState();
  }
}
class _RattingScreenState extends State<RattingScreen>{
  String initSelected = 'Recent';
  void setInitSelected(value){
    setState(() {
      initSelected = value;
    });
  }
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
            padding: const EdgeInsets.only(left: 15),
            child: CustomeIconButton(imageIcon: arrowLeft,fn: (){},)),
      ),
      bottomNavigationBar: SizedBox(
        height: 100,
          child: BottomButton(title: "Write a Review", fn: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => WriteCommentScreen(idTrainer: widget.idTrainer),));
          },heightOver: 120,)
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            height: 50,
              child: GroupButtonCustom(
                initSelected:initSelected ,
                  fn: (value){
                   setInitSelected(value);
                  }, listButton: const ['Recent','Critical','Favourable'])),
         Container(
           margin: const EdgeInsets.only(top: 25),
           height: 60,
           child: Row(
             children: [
               Expanded(
                 flex: 1,
                   child: Center(child: Text('4.6',style: labelTitle.copyWith(fontSize: 48),))),
                Expanded(
                 flex: 3,
                 child: Container(
                   padding: const EdgeInsets.only(left: 30),
                   child:  Column(
                     children: [
                       RateCustom(label:'5',ratting: ((widget.rattingCalculate['5'] ?? 0) * 10), size: 2,height: 10),
                       RateCustom(label:'4',ratting: ((widget.rattingCalculate['4'] ?? 0) * 10), size: 2,height: 10,),
                       RateCustom(label:'3',ratting: ((widget.rattingCalculate['3'] ?? 0) * 10), size: 2,height: 10,),
                       RateCustom(label:'2',ratting: ((widget.rattingCalculate['2'] ?? 0 ) * 10), size: 2,height: 10,),
                       RateCustom(label:'1',ratting: ((widget.rattingCalculate['1'] ?? 0 )* 10), size: 2,height: 10,),
                     ],
                   ),
                 ),
               )
             ],
           ),
         ),
          const SizedBox(height: 10,),
          Align(alignment: Alignment.topRight,
            child: Text('${widget.rattingCalculate.length!.toString()} Ratings'),),
          const SizedBox(height: 35,),
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              child:
           ReviewLayOut(idTrainer: widget.idTrainer,)
            ),
          ),
        ],),
      ),
    );
  }

}