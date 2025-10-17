import 'package:animal_task/features/home/data/models/cat_model.dart';
import 'package:animal_task/features/home/domain/entities/cat_entity.dart';

class CatMapper {
  static Cat toEntity(CatModel catModel) {
    return Cat(
      id: catModel.id ?? '',
      name: catModel.breeds?[0].name ?? '',
      origin: catModel.breeds?[0].origin ?? '',
      temperament: catModel.breeds?[0].temperament ?? '',
      lifeSpan: catModel.breeds?[0].lifeSpan ?? '',
      description: catModel.breeds?[0].description ?? '',
      wikipediaUrl: catModel.breeds?[0].wikipediaUrl ?? '',
      referenceImageId: catModel.breeds?[0].referenceImageId ?? '',
      imageUrl: catModel.url ?? '',
      imageId: catModel.breeds?[0].referenceImageId ?? '',
    );
  }
}
