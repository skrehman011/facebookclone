class Student {
  String id, email, password, firstName, lastName;
  int age;

//<editor-fold desc="Data Methods">
  Student({
    required this.id,
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.age,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Student &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          email == other.email &&
          password == other.password &&
          firstName == other.firstName &&
          lastName == other.lastName &&
          age == other.age);

  @override
  int get hashCode =>
      id.hashCode ^
      email.hashCode ^
      password.hashCode ^
      firstName.hashCode ^
      lastName.hashCode ^
      age.hashCode;

  @override
  String toString() {
    return 'Student{' +
        ' id: $id,' +
        ' email: $email,' +
        ' password: $password,' +
        ' firstName: $firstName,' +
        ' lastName: $lastName,' +
        ' age: $age,' +
        '}';
  }

  Student copyWith({
    String? id,
    String? email,
    String? password,
    String? firstName,
    String? lastName,
    int? age,
  }) {
    return Student(
      id: id ?? this.id,
      email: email ?? this.email,
      password: password ?? this.password,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      age: age ?? this.age,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'email': this.email,
      'password': this.password,
      'firstName': this.firstName,
      'lastName': this.lastName,
      'age': this.age,
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      age: map['age'] as int,
    );
  }

//</editor-fold>
}