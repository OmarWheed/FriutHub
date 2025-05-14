import 'package:flutter/material.dart';
import 'package:fruits_hub/features/home/domin/entity/bottom_nav_entity.dart';
import 'package:fruits_hub/features/home/presentation/views/widget/active_item_nav_bar.dart';
import 'package:fruits_hub/features/home/presentation/views/widget/in_active_item_nav_bar.dart';

class BottomNavItem extends StatelessWidget {
  const BottomNavItem(
      {super.key, required this.isSelected, required this.entity});
  final bool isSelected;
  final BottomNavItemEntity entity;
  @override
  Widget build(BuildContext context) {
    return isSelected
        ? ActiveItem(icon: entity.activeIcon, name: entity.name)
        : InActiveItem(icon: entity.inActiveIcon);
  }
}
