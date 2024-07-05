class PhotoEntity {
  final int? albumId;
  final int? id;
  final String? title;
  final String? url;
  final String? thumbnailUrl;

  const PhotoEntity({
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  });

  factory PhotoEntity.empty() {
    return const PhotoEntity(
      albumId: 0,
      id: 0,
      title: '',
      url: '',
      thumbnailUrl: '',
    );
  }
}
