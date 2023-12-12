class UserModel {
  late String name;
  late int age;
  late String email;
  late String address;
  late String avatar;
  late String background;
  UserModel(this.name, this.age, this.email, this.address,this.avatar,this.background);

  @override
  String toString() {
    return 'UserModel{name: $name, age: $age, email: $email, address: $address, avatar: $avatar, background: $background}';
  }
}