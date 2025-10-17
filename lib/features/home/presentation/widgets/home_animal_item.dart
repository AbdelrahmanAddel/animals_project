import 'package:animal_task/features/details/presentation/screen/details_screen.dart';
import 'package:animal_task/features/home/data/models/add_to_favourite_body.dart';
import 'package:animal_task/features/home/domain/entities/cat_entity.dart';
import 'package:animal_task/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:animal_task/core/constants/assets.dart';
import 'package:animal_task/core/theme/app_colors.dart';
import 'package:animal_task/core/theme/app_text_style.dart';

class HomeAnimalItem extends StatelessWidget {
  const HomeAnimalItem({super.key, required this.cat});
  final Cat cat;

  @override
  Widget build(BuildContext context) {
    final homeCubit = context.watch<HomeCubit>();
    final isFavorite = homeCubit.isFavorite(cat.id);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (builder) => DetailsScreen(cat: cat)),
        );
      },
      child: Container(
        width: 343,
        height: 124,
        decoration: _boxDecoration(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  cat.imageUrl,
                  width: 112,
                  height: 112,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(width: 16),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      overflow: TextOverflow.ellipsis,

                      cat.name,
                      style: AppTextStyle.poppins700Bold24.copyWith(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      overflow: TextOverflow.ellipsis,

                      cat.description,
                      style: AppTextStyle.poppins400Regular14.copyWith(
                        color: AppColors.grey,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      overflow: TextOverflow.ellipsis,
                      cat.origin,
                      style: AppTextStyle.poppins400Regular14.copyWith(
                        color: AppColors.grey,
                      ),
                    ),
                  ],
                ),
              ),

              Spacer(),
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () async {
                    await homeCubit.addFavorite(
                      body: AddToFavoriteModel(
                        id: cat.id,
                        imageId: cat.imageId,
                      ),
                    );
                  },
                  child: SvgPicture.asset(
                    images.svgHeart,
                    colorFilter: ColorFilter.mode(
                      isFavorite ? Colors.red : Colors.grey,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(8),

      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          offset: const Offset(-3, -3),
          blurRadius: 6,
        ),
      ],
    );
  }
}
