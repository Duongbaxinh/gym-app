import 'package:flutter/material.dart';
import 'package:project_app/block/models/review_model.dart';
import 'package:project_app/block/review_provider.dart';
import 'package:project_app/common_widget/card_review.dart';
import 'package:provider/provider.dart';

class ReviewLayOut extends StatelessWidget {
  final String idTrainer;
  final Axis scrollDirection;
  final double? height;
  const ReviewLayOut(
      {super.key,
      required this.idTrainer,
      this.scrollDirection = Axis.vertical,
      this.height});
  @override
  Widget build(BuildContext context) {
    final reviewProvider = Provider.of<ReviewProvider>(context);
    return FutureBuilder<List<ReviewModel>>(
        future: reviewProvider.getReviewOfTrainer(idTrainer),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<ReviewModel> reviewsData = snapshot.data!;
            return SizedBox(
              height: height ?? MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView.separated(
                  scrollDirection: scrollDirection,
                  itemBuilder: (context, index) => CardReview(
                        avatar: reviewsData[index].avatar!,
                        name: reviewsData[index].name!,
                        evaluate:
                            reviewsData[index].evaluate!.toStringAsFixed(1),
                        comment: reviewsData[index].comment! ?? '',
                        date: reviewsData[index].createAt ?? '',
                      ),
                  separatorBuilder: (context, index) => const SizedBox(
                        width: 15,
                        height: 15,
                      ),
                  itemCount: reviewsData.length),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
