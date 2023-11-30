abstract class ConvertData<T>{
  Map<String,dynamic> toMap(dynamic data);
  T fromJson(Map<String,dynamic> data);
}