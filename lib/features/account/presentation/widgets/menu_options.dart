// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restart_tagxi/app/localization.dart';
import 'package:restart_tagxi/common/app_colors.dart';
import 'package:restart_tagxi/common/app_images.dart';
import 'package:restart_tagxi/core/utils/custom_text.dart';
import 'package:restart_tagxi/features/account/application/acc_bloc.dart';
import '../../../../common/local_data.dart';

class MenuOptions extends StatelessWidget {
  final IconData? icon;
  final String label;
  final String? subtitle;
  final VoidCallback onTap;
  final bool? showTheme;
  final bool? showroute;
  final bool? showrouteValue;
  final String? imagePath;
  final Color? textColor;
  final Color? iconColor;
  final double? margin;
  final Color? imageColor;

  const MenuOptions({
    super.key,
    this.icon,
    required this.label,
    this.subtitle,
    required this.onTap,
    this.showTheme = false,
    this.showroute = false,
    this.showrouteValue = false,
    this.imagePath,
    this.textColor,
    this.iconColor,
    this.margin,
    this.imageColor,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          margin:margin!=null&&margin!=0? EdgeInsets.symmetric(vertical: margin!):null,
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.04,
            vertical: size.width * 0.04,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Theme.of(context).dividerColor.withOpacity(0.1),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.03),
                blurRadius: 8,
                offset: const Offset(0, 2),
                spreadRadius: 0,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (icon != null)
                Container(
                  padding: EdgeInsets.all(size.width * 0.025),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    icon,
                    color: AppColors.primary,
                    size: size.width * 0.06,
                  ),
                ),
              if (imagePath != null)
                Container(
                  padding: EdgeInsets.all(size.width * 0.025),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset(
                    imagePath!,
                    height: size.width * 0.05,
                    width: size.width * 0.05,
                    color: AppColors.primary,
                    fit: BoxFit.contain,
                  ),
                ),
              SizedBox(width: size.width * 0.04),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      text: label,
                      textStyle: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(
                              color: textColor ??
                                  Theme.of(context).primaryColorDark,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                    ),
                    if (subtitle != null && subtitle!.isNotEmpty) ...[
                      SizedBox(height: size.width * 0.01),
                      MyText(
                        text: subtitle!,
                        textStyle: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(
                              color: textColor ??
                                  Theme.of(context).hintColor,
                              fontSize: 12,
                            ),
                      ),
                    ],
                  ],
                ),
              ),
              if (showTheme!)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Transform.scale(
                    scaleX: size.width * 0.0025,
                    scaleY: size.width * 0.0024,
                    child: Switch(
                      value: context.read<AccBloc>().isDarkTheme,
                      activeColor: Theme.of(context).primaryColorDark,
                      activeTrackColor: Theme.of(context).primaryColor,
                      inactiveTrackColor: AppColors.white,
                      activeThumbImage: const AssetImage(AppImages.sun),
                      inactiveThumbImage: const AssetImage(AppImages.moon),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      onChanged: (value) async {
                        context.read<AccBloc>().isDarkTheme = value;
                        final locale =
                            await AppSharedPreference.getSelectedLanguageCode();
                        if (!context.mounted) return;
                        context.read<LocalizationBloc>().add(
                            LocalizationInitialEvent(
                                isDark: value, locale: Locale(locale)));
                      },
                    ),
                  ),
                ),
              if (showroute!)
                Switch(
                  value: showrouteValue!,
                  activeColor: Theme.of(context).primaryColorDark,
                  activeTrackColor: Theme.of(context).primaryColor,
                  inactiveTrackColor: AppColors.white,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  onChanged: null, // disables the switch if false
                ),
              if (!showTheme! && !showroute!)
                Icon(
                  Icons.chevron_right,
                  color: AppColors.hintColor.withOpacity(0.5),
                  size: 24,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
