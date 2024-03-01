import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fusion/Theme/theme.dart';
import 'package:fusion/app_config/app_config.dart';


class AppBtn extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  final double height;
  final Color? color;
  final double width;
  final TextStyle? style;
  final bool isLoading; // Added loading variable

  const AppBtn({
    Key? key,
    this.onPressed,
    required this.title,
    this.width = 0.7,
    this.height = 50,
    required this.style,
    this.color,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: height.h,
          width: AppConfig.width * width,
          child: ElevatedButton(
            onPressed: isLoading ? null : onPressed,
            style: ButtonStyle(
              maximumSize: MaterialStateProperty.all(
                  Size(AppConfig.width * width, height.h)),
              minimumSize: MaterialStateProperty.all(
                  Size(AppConfig.width * width, height.h)),
              backgroundColor:
                  MaterialStateProperty.all(color ?? AppColors.primaryColor),
            ),
            child:
                !isLoading
                    ? Padding(
                        padding: EdgeInsets.all(10.w),
                        child: Text(
                          title,
                          style: style ??
                              TextStyle(
                                fontFamily: "Jost",
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                          textAlign: TextAlign.left,
                        ),
                      )
                    : const CircularProgressIndicator(
                  color: Colors.white,
                ), // Loading indicator
          ),
        ),
      ],
    );
  }
}
