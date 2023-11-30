
import 'package:flutter/material.dart';

class PageHeader extends StatelessWidget{
  final String image;
  final String title;
  final String? sub;
  final String? description;
  const PageHeader({super.key,
    required this.title,
    required this.image,
    this.sub,
    this.description,
  });
  @override
  Widget build(BuildContext context ){
    return
        DefaultTabController(
          length: 2,
          initialIndex: 1,
          child: Container(
          padding: EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.cover
              )
          ),
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title.toUpperCase(),style: Theme.of(context).textTheme.headline1,),
              if(sub != null)Text( sub!.toUpperCase(),style: Theme.of(context).textTheme.headline2,),
              if(description != null)Text( description!,style: Theme.of(context).textTheme.subtitle1,),
              SizedBox(height: 80,)
            ],
          ),
            ),
        );

  }
}