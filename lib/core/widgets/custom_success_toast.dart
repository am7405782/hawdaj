import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hawdaj/core/app_style.dart';
import 'package:oktoast/oktoast.dart';

class CustomSuccessToastWidget extends StatelessWidget {
  const CustomSuccessToastWidget({super.key, required this.toastText});

  final String toastText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 46,
        child: Container(
          height: 46,
          margin: EdgeInsets.only(left: 16.w),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0.w),
              bottomLeft: Radius.circular(16.0.w),
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                offset: const Offset(0, -2),
                color: const Color(0xFF000000).withOpacity(.12),
                spreadRadius: 0,
              ),
              BoxShadow(
                blurRadius: 5,
                offset: const Offset(0, -2),
                color: const Color(0xFF000000).withOpacity(.16),
                spreadRadius: 0,
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.done_outlined,
                      size: 20.w,
                      // height: 18.h,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    SizedBox(
                      width: 300.w,
                      child: DefaultTextStyle(
                        style: AppStyle.style16W500Black,
                        child: Text(
                          toastText,
                          textDirection: TextDirection.rtl,
                          // textDirection: currentLocale == 'ar'
                          //     ? ui.TextDirection.rtl
                          //     : ui.TextDirection.ltr,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

showCustomSuccessToast(String toastText) {
  showToastWidget(
    CustomSuccessToastWidget(toastText: toastText),
    dismissOtherToast: true,
    handleTouch: true,
    position: ToastPosition.top,
    duration: const Duration(seconds: 3),
  );
}
