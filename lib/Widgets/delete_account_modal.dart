import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hawdaj/core/app_color.dart';

class CustmBootomModel extends StatelessWidget {
  const CustmBootomModel({
    super.key,
    required this.title,
    required this.subTitle,
    required this.onTapOk,
    this.onTapCancel,
    this.buttonTextok,
    this.cancelButtonText,
    this.customWidget,
  });

  final String title;
  final String subTitle;
  final Function() onTapOk;

  final Function()? onTapCancel;

  final String? buttonTextok;

  final String? cancelButtonText;

  final Widget? customWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        bottom: 30,
      ),
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 20,
            offset: Offset(0, -10),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 12.h,
          ),
          Container(
              width: 100,
              height: 3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.black.withOpacity(0.10000000149011612),
              )),
          SizedBox(
            height: 30.h,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF242424),
              fontSize: 18,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              height: 0.07,
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Divider(
            color: AppColor.primary.withOpacity(.7),
            thickness: 0.4,
          ),
          SizedBox(
            height: 12.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              subTitle,
              maxLines: 3,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFF797979),
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          if (customWidget != null) customWidget!,
          if (customWidget == null)
            SizedBox(
              height: 29.h,
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: CustmSubButton(
                  titie: cancelButtonText ?? "cancel",
                  textcolor: AppColor.primary,
                  backgroundcolor: const Color(0xFFF6F6F6),
                  onTap: onTapCancel ??
                      () {
                        Navigator.pop(context);
                      },
                ),
              ),
              Expanded(
                child: CustmSubButton(
                  textcolor: Colors.white,
                  backgroundcolor: AppColor.primary,
                  titie: buttonTextok ?? 'delete',
                  onTap: onTapOk,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustmSubButton extends StatelessWidget {
  const CustmSubButton({
    super.key,
    required this.titie,
    required this.onTap,
    required this.textcolor,
    required this.backgroundcolor,
  });

  final String titie;
  final Function() onTap;

  final Color textcolor;

  final Color backgroundcolor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        height: 48,
        width: 65.w,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: ShapeDecoration(
          color: backgroundcolor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(78),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              titie,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: textcolor,
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                height: 0.09,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
