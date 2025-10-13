import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/home/cubit/cart_cubit.dart';
import 'package:fruits_hub/features/home/cubit/cart_state.dart';
import 'package:fruits_hub/features/home/presentation/views/cart_view.dart';
import 'package:fruits_hub/features/home/presentation/views/product_view.dart';
import 'package:fruits_hub/features/home/presentation/views/widget/custom_nav_bar.dart';
import 'package:fruits_hub/features/home/presentation/views/home_view.dart';

class AppSection extends StatefulWidget {
  const AppSection({super.key});

  @override
  State<AppSection> createState() => _AppSectionState();
}

class _AppSectionState extends State<AppSection> {
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
        body: BlocListener<CartCubit, CartState>(
            listener: (context, state) {
              if (state.isAdded) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('تمت الاضافة الى السلة'),
                    duration: Duration(seconds: 1),
                  ),
                );
              }
              if (state.isRemoved) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('تمت ازاله من السلة'),
                    duration: Duration(seconds: 1),
                  ),
                );
              }
            },
            child: IndexedStack(
              index: selectIndex,
              children: const [HomeView(), ProductView(), CartView()],
            )),
      ),
    );
  }
}
