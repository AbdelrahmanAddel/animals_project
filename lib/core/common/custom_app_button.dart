import 'package:animal_task/core/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppButton extends StatelessWidget {
  const CustomAppButton({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      color: Color(0xff44BDB6),
      minWidth: 297,
      height: 54,
      onPressed: onPressed ?? () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(images.svgPetsFoot),
          SizedBox(width: 12),
          Text(
            'Get started',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
