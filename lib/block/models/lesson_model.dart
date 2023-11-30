class LessonModel {
  late String nameLesson;
  late String timeLesson;
  late String thumbnail;
  late String video;
  late String level;
  late String type;
  late Map<String,dynamic> trainer;

  LessonModel(
      this.nameLesson,
      this.timeLesson,
      this.thumbnail,
      this.video,
      this.level,
      this.type,
      this.trainer);
  factory LessonModel.fromJson(Map<String , dynamic> lesson){
    return LessonModel(
        lesson['nameLesson'],
        lesson['timeLesson'],
        lesson['thumbnail'],
        lesson['video'],
        lesson['level'],
        lesson['type'],
        lesson['trainer'],
        );
  }
}