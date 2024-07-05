import 'package:omniprotest/domain/entities/photo_entity.dart';

class PhotoModel extends PhotoEntity {
  PhotoModel({
    int? albumId,
    int? id,
    String? title,
    String? url,
    String? thumbnailUrl,
  }) : super(
          albumId: albumId,
          id: id,
          title: title,
          url: url,
          thumbnailUrl: thumbnailUrl,
        );

  factory PhotoModel.fromJson(Map<String, dynamic> json) => PhotoModel(
        albumId: json['albumId'] ?? 0,
        id: json['id'] ?? 0,
        title: json['title'] ?? '',
        url: json['url'] ?? '',
        thumbnailUrl: json['thumbnailUrl'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'albumId': albumId,
        'id': id,
        'title': title,
        'url': url,
        'thumbnailUrl': thumbnailUrl,
      };
}
