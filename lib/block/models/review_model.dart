class ReviewModel {
  late String? name;
  late String? avatar;
  late double? evaluate;
  late String? comment;
  late String? idTrainer;
  late DateTime? createAt;
  ReviewModel();

  factory ReviewModel.fromJson(Map<String , dynamic> lesson){
    ReviewModel lessonModel = ReviewModel();
    lessonModel.name =  lesson['name'];
    lessonModel.avatar =  lesson['avatar'];
    lessonModel.evaluate =  lesson['evaluate'];
    lessonModel.comment =  lesson['comment'];
    lessonModel.createAt =  lesson['createAt'];
    return lessonModel;
  }

  @override
  String toString() {
    return 'ReviewModel{name: $name, avatar: $avatar, evaluate: $evaluate, comment: $comment, createAt: $createAt}';
  }
}