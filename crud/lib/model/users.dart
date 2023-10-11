class Users {
  int id;
  final String name;
  final int age;
  final num mobile;
  final String email;

  Users(
      {required this.id,
      required this.name,
      required this.age,
      required this.mobile,
      required this.email});
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'mobile': mobile,
      'email': email,
    };
  }
  @override
  String toString() {
    return "Name: $name, Age: $age, Mobile:$mobile";
  }
}
