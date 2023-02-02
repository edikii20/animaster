// import 'dart:convert';

// class User {
//   final String? email;

//   final String id;

//   final String? name;

//   final String? photo;
//   const User({
//     this.email,
//     required this.id,
//     this.name,
//     this.photo,
//   });

//   static const empty = User(id: '');

//   bool get isEmpty => this == User.empty;

//   bool get isNotEmpty => this != User.empty;

//   User copyWith({
//     String? email,
//     String? id,
//     String? name,
//     String? photo,
//   }) {
//     return User(
//       email: email ?? this.email,
//       id: id ?? this.id,
//       name: name ?? this.name,
//       photo: photo ?? this.photo,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'email': email,
//       'id': id,
//       'name': name,
//       'photo': photo,
//     };
//   }

//   factory User.fromMap(Map<String, dynamic> map) {
//     return User(
//       email: map['email'] != null ? map['email'] as String : null,
//       id: map['id'] as String,
//       name: map['name'] != null ? map['name'] as String : null,
//       photo: map['photo'] != null ? map['photo'] as String : null,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory User.fromJson(String source) =>
//       User.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   bool operator ==(covariant User other) {
//     if (identical(this, other)) return true;

//     return other.email == email &&
//         other.id == id &&
//         other.name == name &&
//         other.photo == photo;
//   }

//   @override
//   int get hashCode {
//     return email.hashCode ^ id.hashCode ^ name.hashCode ^ photo.hashCode;
//   }
// }
