import 'package:flutter/material.dart';
import 'package:fruits_hub/features/home/presentation/views/product_view.dart';
import 'package:fruits_hub/features/home/presentation/views/widget/custom_nav_bar.dart';
import 'package:fruits_hub/features/home/presentation/views/home_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: CustomNavBar(
          changeSelectedIndex: (int value) {
            selectIndex = value;
            setState(() {});
          },
        ),
        body: IndexedStack(
          index: selectIndex,
          children: const [
            HomeView(),
            ProductView(),
          ],
        ),
      ),
    );
  }
}
