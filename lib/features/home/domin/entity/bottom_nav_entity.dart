import 'package:fruits_hub/core/utils/app_assets.dart';

class BottomNavItemEntity {
  final String activeIcon;
  final String inActiveIcon;
  final String name;

  BottomNavItemEntity(
      {required this.activeIcon,
      required this.inActiveIcon,
      required this.name});
}
// 

List<BottomNavItemEntity> get bottomNavItemList => [
      BottomNavItemEntity(
          activeIcon: Assets.activeHome,
          inActiveIcon: Assets.inActiveHome,
          name: "الرئيسية"),
      BottomNavItemEntity(
          activeIcon: Assets.activeProduct,
          inActiveIcon: Assets.inActiveProduct,
          name: "المنتجات"),
      BottomNavItemEntity(
          activeIcon: Assets.activeShoppingCart,
          inActiveIcon: Assets.inActiveShoppingCart,
          name: "سلة التسوق"),
      BottomNavItemEntity(
          activeIcon: Assets.activeUser,
          inActiveIcon: Assets.inActiveUser,
          name: "حسابي"),
    ];