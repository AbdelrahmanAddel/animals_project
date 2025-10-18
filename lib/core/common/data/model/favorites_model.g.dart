// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoritesModel _$FavoritesModelFromJson(Map<String, dynamic> json) =>
    FavoritesModel(
      id: (json['id'] as num?)?.toInt(),
      userId: json['user_id'] as String?,
      imageId: json['image_id'] as String?,
      subId: json['sub_id'] as String?,
      createdAt: json['created_at'] as String?,
      image: json['image'] == null
          ? null
          : ImageModel.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FavoritesModelToJson(FavoritesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'image_id': instance.imageId,
      'sub_id': instance.subId,
      'created_at': instance.createdAt,
      'image': instance.image,
    };

ImageModel _$ImageModelFromJson(Map<String, dynamic> json) =>
    ImageModel(id: json['id'] as String?, url: json['url'] as String?);

Map<String, dynamic> _$ImageModelToJson(ImageModel instance) =>
    <String, dynamic>{'id': instance.id, 'url': instance.url};
