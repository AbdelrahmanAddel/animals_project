import 'package:flutter/material.dart';
import 'package:animal_task/features/home/presentation/widgets/home_animal_item.dart';

class AnimalsList extends StatelessWidget {
  const AnimalsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return HomeAnimalItem();
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: 12);
      },
    );
  }
}
