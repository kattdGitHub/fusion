import 'package:flutter/material.dart';
import 'package:fusion/Theme/theme.dart';
import 'package:fusion/app_config/app_config.dart';
import 'package:velocity_x/velocity_x.dart';

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
    this.isLoading = false, // Default value for isLoading
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: height,
          width: AppConfig.width * width,
          child: ElevatedButton(
            onPressed: isLoading ? null : onPressed,
            style: ButtonStyle(
              maximumSize: MaterialStateProperty.all(
                  Size(AppConfig.width * width, height)),
              minimumSize: MaterialStateProperty.all(
                  Size(AppConfig.width * width, height)),
              backgroundColor:
                  MaterialStateProperty.all(color ?? AppColors.primaryColor),
            ),
            child:
                !isLoading // Show loading indicator only if isLoading is false
                    ? Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          title,
                          style: style ??
                              const TextStyle(
                                fontFamily: "Jost",
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                          textAlign: TextAlign.left,
                        ),
                      )
                    : CircularProgressIndicator(), // Loading indicator
          ),
        ),
      ],
    );
  }
}
