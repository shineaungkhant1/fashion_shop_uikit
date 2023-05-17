import 'package:fashion_shop_uikit/resources/colors.dart';
import 'package:fashion_shop_uikit/resources/dimens.dart';
import 'package:flutter/material.dart';

class RecommendedItemView extends StatelessWidget {
  const RecommendedItemView({super.key});


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 5,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(255, 205, 210, 0.4),
                borderRadius:
                BorderRadius.circular(MARGIN_MEDIUM_3),
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      "assets/heel.png",
                      height: 100,
                    ),
                    const SizedBox(height: MARGIN_MEDIUM_2),
                    const Text(
                      "Heels",
                      style: TextStyle(
                        color: SECONDARY_PINK_COLOR,
                        fontSize: TEXT_REGULAR_2X + 2,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: MARGIN_MEDIUM_3),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(197, 202, 233, 0.5),
                borderRadius:
                BorderRadius.circular(MARGIN_MEDIUM_3),
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      "assets/cactus-flower.png",
                      height: 100,
                    ),
                    const SizedBox(height: MARGIN_MEDIUM_2),
                    const Text(
                      "Cactus",
                      style: TextStyle(
                        color: Color.fromRGBO(70,40,162, 0.6),
                        fontSize: TEXT_REGULAR_2X + 2,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}