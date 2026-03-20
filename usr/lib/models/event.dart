class Event {
  final String id;
  final String title;
  final DateTime date;
  final String location;
  final String description;
  final String image;
  final String category;
  final DateTime createdAt;
  bool isBookmarked;

  Event({
    required this.id,
    required this.title,
    required this.date,
    required this.location,
    required this.description,
    required this.image,
    required this.category,
    required this.createdAt,
    this.isBookmarked = false,
  });

  Event copyWith({
    String? id,
    String? title,
    DateTime? date,
    String? location,
    String? description,
    String? image,
    String? category,
    DateTime? createdAt,
    bool? isBookmarked,
  }) {
    return Event(
      id: id ?? this.id,
      title: title ?? this.title,
      date: date ?? this.date,
      location: location ?? this.location,
      description: description ?? this.description,
      image: image ?? this.image,
      category: category ?? this.category,
      createdAt: createdAt ?? this.createdAt,
      isBookmarked: isBookmarked ?? this.isBookmarked,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'date': date.toIso8601String(),
      'location': location,
      'description': description,
      'image': image,
      'category': category,
      'createdAt': createdAt.toIso8601String(),
      'isBookmarked': isBookmarked,
    };
  }

  factory Event.fromMap(Map<String, dynamic> map) {
    return Event(
      id: map['id'],
      title: map['title'],
      date: DateTime.parse(map['date']),
      location: map['location'],
      description: map['description'],
      image: map['image'],
      category: map['category'],
      createdAt: DateTime.parse(map['createdAt']),
      isBookmarked: map['isBookmarked'] ?? false,
    );
  }
}
