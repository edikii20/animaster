import 'dart:convert';

class QuizzesCollection {
  final String? title;
  final String? imageUrl;
  final int? playsQuantity;
  final int? quizzesQuantity;
  QuizzesCollection({
    this.title,
    this.imageUrl,
    this.playsQuantity,
    this.quizzesQuantity,
  });

  QuizzesCollection copyWith({
    String? title,
    String? imageUrl,
    int? playsQuantity,
    int? quizzesQuantity,
  }) {
    return QuizzesCollection(
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      playsQuantity: playsQuantity ?? this.playsQuantity,
      quizzesQuantity: quizzesQuantity ?? this.quizzesQuantity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'imageUrl': imageUrl,
      'playsQuantity': playsQuantity,
      'quizzesQuantity': quizzesQuantity,
    };
  }

  factory QuizzesCollection.fromMap(Map<String, dynamic> map) {
    return QuizzesCollection(
      title: map['title'] != null ? map['title'] as String : null,
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
      playsQuantity:
          map['playsQuantity'] != null ? map['playsQuantity'] as int : null,
      quizzesQuantity:
          map['quizzesQuantity'] != null ? map['quizzesQuantity'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizzesCollection.fromJson(String source) =>
      QuizzesCollection.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'QuizzesCollection(title: $title, imageUrl: $imageUrl, playsQuantity: $playsQuantity, quizzesQuantity: $quizzesQuantity)';
  }

  @override
  bool operator ==(covariant QuizzesCollection other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.imageUrl == imageUrl &&
        other.playsQuantity == playsQuantity &&
        other.quizzesQuantity == quizzesQuantity;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        imageUrl.hashCode ^
        playsQuantity.hashCode ^
        quizzesQuantity.hashCode;
  }
}
