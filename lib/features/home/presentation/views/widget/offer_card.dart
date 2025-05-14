import 'package:flutter/material.dart';
import 'package:fruits_hub/core/helper/build_debug_print_color.dart';
import 'package:fruits_hub/core/utils/app_assets.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/features/home/presentation/views/widget/offer_button.dart';

class OfferCard extends StatelessWidget {
  const OfferCard({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width - 32;
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: SizedBox(
        width: width,
        child: AspectRatio(
          aspectRatio: 342 / 158,
          child: Stack(
            children: [
              Positioned(
                  top: 0,
                  left: 0,
                  right: width * 0.3,
                  bottom: 0,
                  child: Image.asset(
                    Assets.watermelon,
                    fit: BoxFit.fill,
                  )),
              SizedBox(
                width: width * 0.5,
                child: CustomPaint(
                  painter: CurvedPainter(
                    color: Colors.green,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 33.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "عروض العيد",
                          style: TextStyles.regular13
                              .copyWith(color: Colors.white),
                        ),
                        const Spacer(),
                        Text(
                          "خصم 25%",
                          style:
                              TextStyles.bold19.copyWith(color: Colors.white),
                        ),
                        const SizedBox(
                          height: 11,
                        ),
                        const Spacer(),
                        OfferButton(onPressed: () {
                          const PrintMessage("pressed").g;
                        }),
                        const SizedBox(
                          height: 29,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CurvedPainter extends CustomPainter {
  final Color? color;

  CurvedPainter({super.repaint, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color ?? Colors.orange
      ..style = PaintingStyle.fill;
    final path = Path();
    path.moveTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(40, size.height);
    path.quadraticBezierTo(0, size.height / 2, 40, 0);
    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
