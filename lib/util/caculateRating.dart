import 'package:project_app/block/models/review_model.dart';

Map<String, dynamic> calculateNumberRatting(List<ReviewModel> reviews) {
  Map<String, dynamic> calculate = {};
  double sum = 0;
  for (ReviewModel review in reviews) {
    switch (review.evaluate) {
      case 5:
        if (calculate['5'] != null) {
          calculate['5'] = (calculate['5']! + 1);
        } else {
          calculate['5'] = 1;
        }
        sum += review.evaluate!;
        break;
      case 4:
        if (calculate['4'] != null) {
          calculate['4'] = (calculate['4']! + 1);
        } else {
          calculate['4'] = 1;
        }
        sum += review.evaluate!;
        break;
      case 3:
        if (calculate['3'] != null) {
          calculate['3'] = (calculate['3']! + 1);
        } else {
          calculate['3'] = 1;
        }
        sum += review.evaluate!;
        break;
      case 2:
        if (calculate['2'] != null) {
          calculate['2'] = (calculate['2']! + 1);
        } else {
          calculate['2'] = 1;
        }
        sum += review.evaluate!;
        break;
      case 1:
        if (calculate['1'] != null) {
          calculate['1'] = (calculate['1']! + 1);
        } else {
          calculate['1'] = 1;
        }
        sum += review.evaluate!;
        break;
    }
  }
  double mean = sum / reviews.length;
  calculate['mean'] = mean.isNaN ? 5 : mean;
  return calculate;
}
