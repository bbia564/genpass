class PasswordEntity {
  int id;
  DateTime createTime;
  String password;

  PasswordEntity({
    required this.id,
    required this.createTime,
    required this.password,
  });

  factory PasswordEntity.fromJson(Map<String, dynamic> json) {
    return PasswordEntity(
      id: json['id'],
      createTime: DateTime.parse(json['createTime']),
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createTime': createTime.toIso8601String(),
      'password': password,
    };
  }
}