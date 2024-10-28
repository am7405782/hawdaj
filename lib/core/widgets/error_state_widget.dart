import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hawdaj/core/app_color.dart';
import 'package:hawdaj/core/app_style.dart';

class ErrorStateWidget extends StatelessWidget {
  const ErrorStateWidget(
      {super.key, this.refresh, this.title, required this.subTitle});

  final void Function()? refresh;
  final String? title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: double.infinity,
      height: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'anErrorOccurred !',
            textAlign: TextAlign.center,
            maxLines: 2,
            style: AppStyle.style24W500Black,
          ),
          SizedBox(height: 20.h),
          Text(subTitle,
              textAlign: TextAlign.center, style: AppStyle.style14W500Black),
          SizedBox(height: 30.h),
          InkWell(
            onTap: refresh,
            child: Container(
              padding: EdgeInsets.all(10.0.w),
              width: 150.w,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("",
                      textAlign: TextAlign.center,
                      style: AppStyle.style14W500Black.copyWith(
                        color: AppColor.primary,
                      )),
                  const SizedBox(width: 10),
                  Icon(Icons.refresh, color: AppColor.primary, size: 14),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
