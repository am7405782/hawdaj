import 'package:flutter/material.dart';
import 'package:hawdaj/core/app_color.dart';
import 'package:hawdaj/core/app_style.dart';

class SelectableItem extends StatelessWidget {
  const SelectableItem(
      {super.key,
      required this.text,
      required this.isSelected,
      required this.onTap});

  final String text;
  final Function() onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        margin: const EdgeInsetsDirectional.only(end: 8),
        decoration: ShapeDecoration(
          color: isSelected ? AppColor.primary : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(44),
          ),
        ),
        child: Text(text,
            style: AppStyle.style12W500Black.copyWith(
              color: isSelected ? Colors.white : const Color(0xFF242424),
            )),
      ),
    );
  }
}
