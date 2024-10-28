import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hawdaj/core/app_color.dart';
import 'package:lottie/lottie.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({
    super.key,
    required this.txtMsg,
    required this.showLoadingButton,
    this.subTxtMsg,
    this.refresh,
    this.image,
    this.imageSvg,
  });

  final String? image;
  final String? imageSvg;
  final String txtMsg;
  final String? subTxtMsg;
  final bool showLoadingButton;
  final void Function()? refresh;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.red,
      height: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (imageSvg != null)
            SvgPicture.asset(
              imageSvg ?? '',
              width: 150.w,
              height: 130.h,
              fit: BoxFit.cover,
            )
          else
            Lottie.asset(
              "AssetsData.emptyState2",
              width: 250.w,
              height: 200,
            ),
          SizedBox(height: 30.h),
          Text(
            txtMsg,
            style: const TextStyle(
              color: Color(0xFF242400),
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          ),
          SizedBox(height: 4.h),
          if (subTxtMsg != null)
            Text(
              subTxtMsg!,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14, color: AppColor.primary.withOpacity(.8)),
              // style: Styles.textStyle14
              //     .copyWith(color: ColorsData.primary500.withOpacity(.8)),
            ),
          SizedBox(height: 10.h),
          if (showLoadingButton)
            InkWell(
              onTap: refresh,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 9,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[200],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "reloading",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColor.primary,
                      ),
                      // style: Styles.textStyle14
                      //     .copyWith(color: ColorsData.primary500),
                    ),
                    SizedBox(width: 10.h),
                    Icon(
                      Icons.refresh,
                      color: AppColor.primary,
                      size: 14,
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
