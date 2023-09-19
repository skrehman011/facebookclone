class Post{
  String id,userId,description,mediaUrl,type;
  int timeStamp;

//<editor-fold desc="Data Methods">
  Post({
    required this.id,
    required this.userId,
    required this.description,
    required this.mediaUrl,
    required this.type,
    required this.timeStamp,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Post &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          userId == other.userId &&
          description == other.description &&
          mediaUrl == other.mediaUrl &&
          type == other.type &&
          timeStamp == other.timeStamp);

  @override
  int get hashCode =>
      id.hashCode ^
      userId.hashCode ^
      description.hashCode ^
      mediaUrl.hashCode ^
      type.hashCode ^
      timeStamp.hashCode;

  @override
  String toString() {
    return 'Post{' +
        ' id: $id,' +
        ' userId: $userId,' +
        ' description: $description,' +
        ' mediaUrl: $mediaUrl,' +
        ' type: $type,' +
        ' timeStamp: $timeStamp,' +
        '}';
  }

  Post copyWith({
    String? id,
    String? userId,
    String? description,
    String? mediaUrl,
    String? type,
    int? timeStamp,
  }) {
    return Post(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      description: description ?? this.description,
      mediaUrl: mediaUrl ?? this.mediaUrl,
      type: type ?? this.type,
      timeStamp: timeStamp ?? this.timeStamp,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'userId': this.userId,
      'description': this.description,
      'mediaUrl': this.mediaUrl,
      'type': this.type,
      'timeStamp': this.timeStamp,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map['id'] as String,
      userId: map['userId'] as String,
      description: map['description'] as String,
      mediaUrl: map['mediaUrl'] as String,
      type: map['type'] as String,
      timeStamp: map['timeStamp'] as int,
    );
  }

//</editor-fold>
}