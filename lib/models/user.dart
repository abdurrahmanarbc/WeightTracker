class User {
  int? id;
  String name;
  String surname;
  String email;
  String password;

  User({
    this.id,
    required this.name,
    required this.surname,
    required this.email,
    required this.password,
  });

  User copyWith({
    int? id,
    String? name,
    String? surname,
    String? email,
    String? password,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int?,
      name: json['name'] as String,
      surname: json['surname'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'name': name,
      'surname': surname,
      'email': email,
      'password': password,
    };
    if (id != null) {
      data['id'] = id;
    }
    return data;
  }
}
