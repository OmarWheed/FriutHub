import 'package:flutter/material.dart';
import 'package:fruits_hub/features/home/presentation/views/widget/offer_card.dart';

class OfferList extends StatelessWidget {
  const OfferList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
            4,
            (index) => const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: OfferCard(),
                )),
      ),
    );
  }
}
