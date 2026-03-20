class News {
  final String id;
  final String title;
  final String source;
  final String summary;
  final String image;
  final DateTime createdAt;

  News({
    required this.id,
    required this.title,
    required this.source,
    required this.summary,
    required this.image,
    required this.createdAt,
  });

  News copyWith({
    String? id,
    String? title,
    String? source,
    String? summary,
    String? image,
    DateTime? createdAt,
  }) {
    return News(
      id: id ?? this.id,
      title: title ?? this.title,
      source: source ?? this.source,
      summary: summary ?? this.summary,
      image: image ?? this.image,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'source': source,
      'summary': summary,
      'image': image,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory News.fromMap(Map<String, dynamic> map) {
    return News(
      id: map['id'],
      title: map['title'],
      source: map['source'],
      summary: map['summary'],
      image: map['image'],
      createdAt: DateTime.parse(map['createdAt']),
    );
  }
}
