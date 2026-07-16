enum UserRole { student, teacher }

class User {
  final int? id;
  final String? name;
  final UserRole? role;
  final DateTime? expirationDate;

  User({this.id, this.name, this.role, this.expirationDate});
  static User fromJson(Map<String, dynamic> json) {
    UserRole? parsedRole;

    parsedRole = UserRole.values.firstWhere((e) => e.name == json["role"]);

    return User(
      id: json['id'],
      name: json['name'],
      role: parsedRole,
      expirationDate: json["expirationDate"],
    );
  }

  @override
  String toString() {
    return "user = $name - role = ${role?.name} - expires = $expirationDate";
  }
}
