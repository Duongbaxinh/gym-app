class LessonModel {
  LessonModel({
    required this.nameLesson,
    required this.thumbnail,
    required this.typeLesson,
    required this.timeLesson,
    required this.video,
  });
  late final String nameLesson;
  late final String thumbnail;
  late final String typeLesson;
  late final String timeLesson;
  late final String video;

  LessonModel.fromJson(Map<String, dynamic> json) {
    nameLesson = json['nameLesson'];
    thumbnail = json['thumbnail'];
    typeLesson = json['typeLesson'];
    timeLesson = json['timeLesson'];
    video = json['video'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['nameLesson'] = nameLesson;
    _data['thumbnail'] = thumbnail;
    _data['typeLesson'] = typeLesson;
    _data['timeLesson'] = timeLesson;
    _data['video'] = video;
    return _data;
  }

  @override
  String toString() {
    return 'LessonModel{nameLesson: $nameLesson, thumbnail: $thumbnail, typeLesson: $typeLesson, timeLesson: $timeLesson, video: $video}';
  }
}
