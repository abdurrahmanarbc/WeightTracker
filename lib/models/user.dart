class User {
  int? id;
  String? name;
  String? surname;
  String? email;
  String? password;
  double? weight;
  double? goalWeight;
  double? height;

  User({this.id, required this.name, required this.surname, required this.email, required this.password, required this.weight, this.goalWeight, required this.height});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      surname: json['surname'],
      email: json['email'],
      password: json['password'],
      weight: json['weight'].toDouble(),
      goalWeight: json['goal_weight'] != null ? json['goal_weight'].toDouble() : null,
      height: json['height'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'name': name,
      'surname': surname,
      'email': email,
      'password': password,
      'weight': weight,
      'height': height,
    };
    if (id != null) {
      data['id'] = id;
    }
    if (goalWeight != null) {
      data['goal_weight'] = goalWeight;
    }
    return data;
  }
}
