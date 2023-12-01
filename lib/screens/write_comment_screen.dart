import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_app/common_widget/button_widget.dart';
import 'package:project_app/common_widget/custome_icon_button.dart';
import 'package:project_app/common_widget/rate_custom.dart';
import 'package:project_app/constant/index.dart';
import 'package:text_area/text_area.dart';

class WriteCommentScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WriteCommentScreenState();
  }
}

class _WriteCommentScreenState extends State<WriteCommentScreen> {
  double ratting = 1;
  void handleRatting(double value) {
    setState(() {
      if (value >= 1) {
        ratting = value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Color yelSchema = Theme.of(context).colorScheme.onSecondary;
    TextStyle titleStyle = Theme.of(context).textTheme.headline2!;
    TextStyle subStyle = Theme.of(context).textTheme.headline3!;

    final comment = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Write a Review',
          style: titleStyle,
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: CustomeIconButton(
            imageIcon: arrowLeft,
            fn: () {},
          ),
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: RateCustom(
                toplables: true,
                ratting: ratting,
                thumShape: true,
                min: 0,
                max: 5,
                size: 35,
                height: 35,
                colorTrack: yelSchema,
                onRatting: handleRatting,
              )),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Column(
                children: [
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      constraints: const BoxConstraints(),
                      decoration: BoxDecoration(
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15))),
                      child: TextField(
                        minLines: 10,
                        maxLines: 12,
                        style: subStyle.copyWith(fontWeight: FontWeight.normal),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Type something',
                          hintStyle: subStyle,
                          contentPadding: const EdgeInsets.all(15),
                        ),
                      )),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    margin: const EdgeInsets.symmetric(vertical: 30),
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: ButtonCustom(
                      title: "Send".toUpperCase(),
                      fn: () {},
                      icon: false,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
