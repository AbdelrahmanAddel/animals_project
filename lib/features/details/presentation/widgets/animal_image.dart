import 'package:animal_task/core/common/dependency_injection.dart';
import 'package:animal_task/core/constants/assets.dart';
import 'package:animal_task/features/home/data/models/add_to_favourite_body.dart';
import 'package:animal_task/features/home/domain/entities/cat_entity.dart';
import 'package:animal_task/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AnimalImage extends StatelessWidget {
  const AnimalImage({super.key, required this.cat});
  final Cat cat;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _boxDecoration(),
      width: double.infinity,
      height: 375,
      child: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 50),
          child: _buildAnimalImage(context),
        ),
      ),
    );
  }

  Decoration _boxDecoration() {
    return BoxDecoration(
      image: DecorationImage(
        image: NetworkImage(cat.imageUrl),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildAnimalImage(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: Icon(Icons.arrow_back, size: 30),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.white,
        ),
        GestureDetector(
          onTap: () async {
            await sl<HomeCubit>().addFavorite(
              body: AddToFavoriteModel(id: cat.id, imageId: cat.imageId),
            );
          },
          child: SvgPicture.asset(images.svgHeart, color: Colors.white),
        ),
      ],
    );
  }
}
