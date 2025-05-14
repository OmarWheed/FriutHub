import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/utils/app_assets.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/search_text_field.dart';
import 'package:fruits_hub/features/home/presentation/views/widget/best_seller_grid_view.dart';
import 'package:fruits_hub/features/home/presentation/views/widget/best_seller_header.dart';
import 'package:fruits_hub/features/home/presentation/views/widget/custom_home_app_bar.dart';
import 'package:fruits_hub/features/home/presentation/views/widget/custom_nav_bar.dart';
import 'package:fruits_hub/features/home/presentation/views/widget/offer_list.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const CustomNavBar(),
        body: _buildHomeViewBody(),
      ),
    );
  }

  Widget _buildHomeViewBody() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              spacing: 16,
              children: [
                SizedBox(height: 16),
                CustomHomeAppBar(),
                SearchTextField(),
                OfferList(),
                BestSellerHeader(),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
          BestSellingGridView()
        ],
      ),
    );
  }
}
