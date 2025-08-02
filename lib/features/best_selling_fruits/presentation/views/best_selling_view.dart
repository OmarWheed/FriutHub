import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/build_notification.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {}, icon: const Icon(Icons.arrow_back_ios_rounded)),
        title: const Text(
          "الاكثر مبيعا",
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: buildNotificationIcon(),
          )
        ],
      ),
    );
  }
}
