

import 'package:flutter/material.dart';
import 'package:project_app/common_widget/dialog_widget.dart';

Future<void> ShowDialog(String title,String content,String image,BuildContext context,)async{
  return showDialog<void>(
      context: context,
    builder: (BuildContext context){
        return Align(
          alignment: Alignment.bottomCenter,
            child: DialogCustom(title: title, content: content, image: image,));
    }
  );
}