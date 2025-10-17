import 'package:animal_task/core/common/data/model/favorites_model.dart';
import 'package:animal_task/core/constants/assets.dart';
import 'package:animal_task/core/theme/app_colors.dart';
import 'package:animal_task/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({super.key, required this.favoriteItem});
  final FavoritesModel favoriteItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 162,
      height: 212,
      decoration: _boxDecoration(),
      child: _favoriteItem(),
    );
  }

  Widget _favoriteItem() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            favoriteItem.image?.url ?? '',
            height: 140,
            fit: BoxFit.fill,
          ),
          SizedBox(height: 5),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(child: _favoriteItemText()),
                Flexible(
                  child: GestureDetector(
                    child: SvgPicture.asset(
                      images.svgHeart,
                      width: 20,
                      height: 20,
                    ),
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _favoriteItemText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Text(
            favoriteItem.subId ?? '',
            style: AppTextStyle.poppins500Medium14.copyWith(
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(height: 2),
        Flexible(
          child: Text(
            favoriteItem.createdAt ?? '',
            style: AppTextStyle.poppins400Regular14.copyWith(
              color: AppColors.grey,
            ),
          ),
        ),
      ],
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      color: Color(0xffE1F8F9),
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          offset: const Offset(0, 2),
          blurRadius: 4,
        ),
      ],
    );
  }
}
