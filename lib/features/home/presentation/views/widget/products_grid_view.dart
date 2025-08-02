import 'package:flutter/material.dart';
import 'package:fruits_hub/core/entitys/product_entity.dart';
import 'package:fruits_hub/features/home/presentation/views/widget/friut_item.dart';

class BestSellingGridView extends StatelessWidget {
  const BestSellingGridView({super.key, required this.products});
  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 16,
          childAspectRatio: 163 / 214),
      itemBuilder: (context, index) =>
          FruitItem(productEntity: products[index]),
    );
  }
}
