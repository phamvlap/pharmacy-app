import 'dart:io';

class ImageModel {
  final String? id;
  final String url;
  final File? featuredImage;
  final String? type;
  final String? refId;

  ImageModel({
    this.id,
    required this.url,
    this.featuredImage,
    this.type,
    this.refId,
  });

  ImageModel copyWith({
    String? id,
    String? url,
    File? featuredImage,
    String? type,
    String? refId,
  }) {
    return ImageModel(
      id: id ?? this.id,
      url: url ?? this.url,
      featuredImage: featuredImage ?? this.featuredImage,
      type: type ?? this.type,
      refId: refId ?? this.refId,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'type': type,
      'refId': refId,
    };
  }

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      id: json['id'],
      url: json['url'] ?? '',
      type: json['type'],
      refId: json['refId'],
    );
  }

  bool hasFeaturedImage() {
    return featuredImage != null || url.isNotEmpty;
  }
}
