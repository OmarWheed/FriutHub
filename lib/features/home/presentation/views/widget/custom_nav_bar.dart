import 'package:flutter/material.dart';
import 'package:fruits_hub/features/home/domin/entity/bottom_nav_entity.dart';
import 'package:fruits_hub/features/home/presentation/views/widget/bottom_nav_bar_items.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key, required this.changeSelectedIndex});
  final ValueChanged<int> changeSelectedIndex;

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 25,
            color: Color(0x19000000),
            offset: Offset(0, -3),
            spreadRadius: 2,
          )
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Row(
        children: bottomNavItemList.asMap().entries.map((e) {
          var index = e.key;
          var entity = e.value;
          return Expanded(
            flex: selectIndex == index ? 3 : 2,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectIndex = index;
                  widget.changeSelectedIndex(selectIndex);
                });
              },
              child: BottomNavItem(
                entity: entity,
                isSelected: selectIndex == index,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
