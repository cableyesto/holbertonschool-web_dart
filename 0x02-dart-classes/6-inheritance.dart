import '6-password.dart';

class User extends Password {
  int id;
  String name;
  int age;
  double height;
  String? _user_password;

  User({
    required this.id,
    required this.name,
    required this.age,
    required this.height,
    String? user_password,
  })  : _user_password = user_password,
        super(password: user_password ?? '');

  set user_password(String value) {
    _user_password = value;
    password = value;
  }

  Map<String, Object> toJson() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'height': height,
    };
  }

  static User fromJson(Map<dynamic, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      age: json['age'],
      height: json['height'],
      user_password: json['user_password'],
    );
  }

  @override
  String toString() {
    return 'User(id : $id ,name: $name, age: $age, height: $height, Password: ${isValid()})';
  }
}