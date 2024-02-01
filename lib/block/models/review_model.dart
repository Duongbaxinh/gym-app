class ReviewModel {
  ReviewModel({
    required this.name,
    required this.idTrainer,
    required this.comment,
    required this.avatar,
    required this.createAt,
    required this.evaluate,
  });
  String? name;
  String? idTrainer;
  String? comment;
  String? avatar;
  String? createAt;
  double? evaluate;

  ReviewModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    idTrainer = json['idTrainer'];
    comment = json['comment'];
    avatar = json['avatar'] ??
        'https://res.cloudinary.com/dwu92ycra/image/upload/v1701049337/Gym-app/63_wgsqkq.png';
    createAt = json['create_At'];
    evaluate = json['evaluate'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['idTrainer'] = idTrainer;
    _data['comment'] = comment;
    _data['avatar'] = avatar;
    _data['create_At'] = createAt;
    _data['evaluate'] = evaluate;
    return _data;
  }
}
