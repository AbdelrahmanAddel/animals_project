import 'package:flutter/material.dart';
import 'package:animal_task/core/theme/app_colors.dart';
import 'package:animal_task/core/theme/app_text_style.dart';

class HomeCategory extends StatefulWidget {
  const HomeCategory({super.key});

  @override
  State<HomeCategory> createState() => _HomeCategoryState();
}

class _HomeCategoryState extends State<HomeCategory>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Categories',
          style: AppTextStyle.poppins700Bold24.copyWith(fontSize: 20),
        ),
        SizedBox(height: 14),
        TabBar(
          indicatorColor: Colors.white,
          tabAlignment: TabAlignment.start,
          isScrollable: true,
          dividerHeight: 0,
          controller: _tabController,
          indicatorPadding: EdgeInsets.zero,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          tabs: [
            Tab(
              child: _buildTabViewContainer(
                'All',
                isSelected: _selectedIndex == 0,
              ),
            ),
            Tab(
              child: _buildTabViewContainer(
                'Dogs',
                isSelected: _selectedIndex == 1,
              ),
            ),
            Tab(
              child: _buildTabViewContainer(
                'Cats',
                isSelected: _selectedIndex == 2,
              ),
            ),
            Tab(
              child: _buildTabViewContainer(
                'Birds',
                isSelected: _selectedIndex == 3,
              ),
            ),
            Tab(
              child: _buildTabViewContainer(
                'Fish',
                isSelected: _selectedIndex == 4,
              ),
            ),
            Tab(
              child: _buildTabViewContainer(
                'Other',
                isSelected: _selectedIndex == 5,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTabViewContainer(String text, {bool isSelected = false}) {
    return Container(
      width: 58,
      height: 35,
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primary : AppColors.lightGrey,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: Text(
          text,
          style: AppTextStyle.poppins500Medium14.copyWith(
            color: isSelected ? Colors.white : AppColors.primary,
          ),
        ),
      ),
    );
  }
}
