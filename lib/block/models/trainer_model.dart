class TrainerModel {
  TrainerModel({
    required this.id,
    required this.address,
    required this.background,
    required this.name,
    required this.completed,
    required this.avatar,
    required this.activeClients,
    required this.experiences,
    required this.evaluate,
    required this.email,
    required this.age,
    required this.specializeIn,
  });
  late final String id;
  late final String address;
  late final String background;
  late final String name;
  late final int completed;
  late final String avatar;
  late final int activeClients;
  late final int experiences;
  late final int evaluate;
  late final String email;
  late final int age;
  late final String specializeIn;

  TrainerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    address = json['address'];
    background = json['background'];
    name = json['name'];
    completed = json['completed'];
    avatar = json['avatar'];
    activeClients = json['activeClients'];
    experiences = json['experiences'];
    evaluate = json['evaluate'];
    email = json['email'];
    age = json['age'];
    specializeIn = json['specializeIn'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['address'] = address;
    _data['background'] = background;
    _data['name'] = name;
    _data['completed'] = completed;
    _data['avatar'] = avatar;
    _data['activeClients'] = activeClients;
    _data['experiences'] = experiences;
    _data['evaluate'] = evaluate;
    _data['email'] = email;
    _data['age'] = age;
    _data['specializeIn'] = specializeIn;
    return _data;
  }

  @override
  String toString() {
    return 'TrainerModel{id: $id, address: $address, background: $background, name: $name, completed: $completed, avatar: $avatar, activeClients: $activeClients, experiences: $experiences, evaluate: $evaluate, email: $email, age: $age, specializeIn: $specializeIn}';
  }
}
