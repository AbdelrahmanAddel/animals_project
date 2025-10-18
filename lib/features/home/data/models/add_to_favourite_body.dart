import 'package:json_annotation/json_annotation.dart';

part 'add_to_favourite_body.g.dart';

@JsonSerializable()
class AddToFavoriteModel {
  @JsonKey(name: 'sub_id')
  String id;
  @JsonKey(name: 'image_id')
  String imageId;

  AddToFavoriteModel({required this.id, required this.imageId});
  Map<String, dynamic> toJson() => _$AddToFavoriteModelToJson(this);
}
