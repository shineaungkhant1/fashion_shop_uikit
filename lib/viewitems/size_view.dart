
import 'package:fashion_shop_uikit/resources/colors.dart';
import 'package:fashion_shop_uikit/resources/dimens.dart';
import 'package:fashion_shop_uikit/resources/string.dart';
import 'package:flutter/material.dart';

const kAnimationDuration = Duration(milliseconds: 500);

class SizeView extends StatefulWidget {

  final ClothSizeVO sizeVo;

  const SizeView({super.key, required this.sizeVo});

  @override
  State<SizeView> createState() => _SizeViewState();
}

class _SizeViewState extends State<SizeView> {
  @override
  Widget build(BuildContext context) {
    ClothSizeVO sizeVo = widget.sizeVo;
    return GestureDetector(
      onTap: () {
        setState(() {
          sizeVo.isSelected = !(sizeVo.isSelected ?? false);
        });
      },
      child: AnimatedContainer(
        duration: kAnimationDuration,
        margin: const EdgeInsets.only(right: MARGIN_MEDIUM_2),
        decoration: BoxDecoration(
          color: (sizeVo.isSelected == false) ? const Color.fromRGBO(228, 224, 226, 1.0) : BLUE_DARK_COLOR,
          borderRadius: BorderRadius.circular(MARGIN_CARD_MEDIUM_2),
        ),
        child: Center(
          child: Text(
            widget.sizeVo.size ?? "",
            style: TextStyle(
              color: (sizeVo.isSelected == false) ? const Color.fromRGBO(159, 159, 159, 1.0) : Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: TEXT_REGULAR_3X,
            ),
          ),
        ),
      ),
    );
  }
}