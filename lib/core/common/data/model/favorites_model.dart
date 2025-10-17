import 'package:json_annotation/json_annotation.dart';
part 'favorites_model.g.dart';

@JsonSerializable()
class FavoritesModel {
  final int? id;
  @JsonKey(name: 'user_id')
  final String? userId;
  @JsonKey(name: 'image_id')
  final String? imageId;
  @JsonKey(name: 'sub_id')
  final String? subId;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  final ImageModel? image;

  FavoritesModel({
    required this.id,
    required this.userId,
    required this.imageId,
    required this.subId,
    required this.createdAt,
    required this.image,
  });

  factory FavoritesModel.fromJson(Map<String, dynamic> json) =>
      _$FavoritesModelFromJson(json);
}
@JsonSerializable()
class ImageModel {
  final String? id;
  final String? url;

  ImageModel({required this.id, required this.url});

  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);
}

