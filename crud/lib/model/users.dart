class Users {
  int id;
  final String name;
  final int age;
  final String email;

  Users({
    required this.id,
    required this.name,
    required this.age,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'email': email,
    };
  }

  @override
  String toString() {
    return "Name: $name, Age: $age, Email:$email";
  }
}