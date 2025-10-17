import 'package:animal_task/core/constants/assets.dart';
import 'package:animal_task/features/favorites/presentation/screen/favorites_screen.dart';
import 'package:animal_task/features/home/presentation/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

List<Widget> screens = [
  HomeScreen(),
  FavoritesScreen(),
  Placeholder(),
  Placeholder(),
];
int screenIndex = 0;

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigation(screenIndex),

      body: screens[screenIndex],
    );
  }

  Widget _bottomNavigation(int currentIndex) {
    return BottomNavigationBar(
      currentIndex: screenIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (value) {
        setState(() {
          screenIndex = value;
        });
      },
      items: [
        _bottomNavigationBarItem(currentIndex == 0, images.svgHomeIcon),
        _bottomNavigationBarItem(currentIndex == 1, images.svgHeart),
        _bottomNavigationBarItem(currentIndex == 2, images.svgMessagesIcon),
        _bottomNavigationBarItem(currentIndex == 3, images.svgProfileIcon),
      ],
    );
  }

  BottomNavigationBarItem _bottomNavigationBarItem(
    bool isSelected,
    String iconPath,
  ) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        iconPath,
        colorFilter: isSelected
            ? null
            : ColorFilter.mode(Colors.grey, BlendMode.srcIn),
      ),
      label: '',
    );
  }
}
