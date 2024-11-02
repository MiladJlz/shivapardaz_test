import 'package:shivapardaz_test/features/main/domain/entities/photo.dart';

class PhotoModel extends Photo {
  PhotoModel({
    required super.albumId,
    required super.id,
    required super.title,
    required super.url,
    required super.thumbnailUrl,
  });
  factory PhotoModel.fromJson(Map<String, dynamic> map) {
    return PhotoModel(
        albumId: map['albumId'] as int,
        id: map['id'] as int,
        title: map['title'] as String,
        url: map['url'] as String,
        thumbnailUrl: map['thumbnailUrl'] as String);
  }
}
