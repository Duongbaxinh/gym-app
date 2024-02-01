import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:project_app/block/models/review_model.dart';
import 'package:project_app/util/formatDate.dart';
import 'package:project_app/util/show_diaglog.dart';

class ReviewProvider with ChangeNotifier {
  Future<void> addReview(List<Map<String, dynamic>> reviews) async {
    FirebaseFirestore fireStore = FirebaseFirestore.instance;
    try {
      for (var review in reviews) {
        CollectionReference<Map<String, dynamic>> reviewRef =
            fireStore.collection('review');
        DocumentReference newReview = await reviewRef.add(review);
      }
      print('Added successfully');
    } catch (err) {
      throw Exception(err);
    }
  }

  Future<void> addOneReview(
      Map<String, dynamic> review, BuildContext context) async {
    FirebaseFirestore fireStore = FirebaseFirestore.instance;
    try {
      CollectionReference<Map<String, dynamic>> reviewRef =
          fireStore.collection('review');
      DocumentReference newReview = await reviewRef.add(review);
      // ignore: use_build_context_synchronously
      ShowDialog('Thank you for your contribution', 'You just wrote a comment',
          'assets/images/wrong.png', context);
      notifyListeners();
    } catch (err) {
      throw Exception(err);
    }
  }

  Future<List<ReviewModel>> getAllReview() async {
    List<ReviewModel> reviews = [];
    FirebaseFirestore fireStore = FirebaseFirestore.instance;
    CollectionReference<Map<String, dynamic>> reviewRef =
        fireStore.collection('review');
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await reviewRef.get();
    for (var review in querySnapshot.docs) {
      Map<String, dynamic> fullReview = review.data();
      fullReview['id'] = review.id;
      reviews.add(ReviewModel.fromJson(fullReview));
    }
    return reviews;
  }

  Future<List<ReviewModel>> getReviewOfTrainer(String idTrainer2) async {
    List<ReviewModel> reviews = [];
    FirebaseFirestore fireStore = FirebaseFirestore.instance;
    CollectionReference<Map<String, dynamic>> reviewRef =
        fireStore.collection('review');
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await reviewRef.where('idTrainer', isEqualTo: idTrainer2).get();
    for (var review in querySnapshot.docs) {
      Map<String, dynamic> fullReview = review.data();
      String dateString =
          Util().durationReview(fullReview['create_At'].toDate());
      fullReview['create_At'] = dateString;
      fullReview['id'] = review.id;
      reviews.add(ReviewModel.fromJson(fullReview));
    }
    return reviews ?? [];
  }
}
