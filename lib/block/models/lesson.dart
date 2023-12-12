class LessonModel {
  late String? nameLesson;
  late String? thumbnail;
  late String? typeLesson;
  late String? timeLesson;
  late String? video;
  LessonModel();
  Map<String,dynamic> toMap(LessonModel lesson){
    return {
      "nameLesson":lesson.nameLesson,
      "thumbnail":lesson.thumbnail,
      "typeLesson":lesson.typeLesson,
      "timeLesson":lesson.timeLesson,
      "video":lesson.video
    };
  }

  factory LessonModel.fromJson(Map<String , dynamic> lesson){
     LessonModel lessonModel = LessonModel();
     lessonModel.nameLesson =  lesson['nameLesson'];
     lessonModel.thumbnail =  lesson['thumbnail'];
     lessonModel.typeLesson =  lesson['typeLesson'];
     lessonModel.timeLesson =  lesson['timeLesson'];
     lessonModel.video =  lesson['video'];
     return lessonModel;
  }

  @override
  String toString() {
    return 'LessonModel{nameLesson: $nameLesson, thumbnail: $thumbnail, typeLesson: $typeLesson, timeLesson: $timeLesson, video: $video}';
  }
}