import 'package:flutter/material.dart';
import '../../../../common/common.dart';
import 'custom_loader.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String buttonName;
  final double? height;
  final double? width;
  final double? borderRadius;
  final Color? buttonColor;
  final Color? textColor;
  final double? textSize;
  final Function()? onTap;
  final bool? isLoader;
  final bool? isBorder;
  final Border? border;
  const CustomButton({
    super.key,
    required this.buttonName,
    this.height,
    this.width,
    this.borderRadius,
    this.buttonColor,
    this.textColor,
    this.textSize,
    this.border,
    this.onTap,
    this.isLoader = false,
    this.isBorder,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: (isLoader != null && !isLoader!) ? onTap : null,
        borderRadius: BorderRadius.circular(borderRadius ?? 12),
        child: Container(
          height: height ?? size.width * 0.12,
          width: width ?? size.width * 0.5,
          decoration: BoxDecoration(
            border: (isBorder != null && isBorder!)
                ? Border.all(color: AppColors.buttonColor, width: 1.5)
                : border,
            color: buttonColor ?? AppColors.buttonColor,
            borderRadius: BorderRadius.circular(borderRadius ?? 12),
            boxShadow: [
              BoxShadow(
                color: (buttonColor ?? AppColors.buttonColor).withOpacity(0.3),
                blurRadius: 12,
                offset: const Offset(0, 4),
                spreadRadius: 0,
              ),
            ],
          ),
          child: Center(
            child: !isLoader!
                ? MyText(
                    text: buttonName,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    textStyle: AppTextStyle.boldStyle().copyWith(
                      color: textColor ?? AppColors.buttonTextColor,
                      fontSize: textSize ?? 16,
                      letterSpacing: 0.5,
                    ),
                  )
                : SizedBox(
                    height: size.width * 0.05,
                    width: size.width * 0.05,
                    child: const Loader(
                      color: AppColors.buttonTextColor,
                    )),
          ),
        ),
      ),
    );
  }
}
