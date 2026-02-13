import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:maramurry/core/constants/app_colors.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? greeting;
  final String? userName;
  final String? title; // ⭐ for Explore & other pages
  final VoidCallback? onMenuPressed;
  final VoidCallback? onNotificationPressed;
  final bool showBackButton;
  final bool centerTitle; // ⭐ NEW

  const AppAppBar({
    super.key,
    this.greeting,
    this.userName,
    this.title,
    this.onMenuPressed,
    this.onNotificationPressed,
    this.showBackButton = false,
    this.centerTitle = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,

      /// ✅ LEADING ICON
      leading: IconButton(
        icon: Icon(
          showBackButton ? Icons.arrow_back : Icons.menu_rounded,
          color: AppColors.textPrimary,
          size: 26.w,
        ),
        onPressed: showBackButton
            ? () => context.pop()
            : (onMenuPressed ?? () => Scaffold.of(context).openDrawer()),
      ),

      /// ✅ TITLE LOGIC
      title: _buildTitle(),

      centerTitle: centerTitle,

      /// ✅ ACTIONS
      actions: showBackButton
          ? []
          : [
              IconButton(
                icon: Stack(
                  children: [
                    Icon(
                      Icons.notifications_none_rounded,
                      size: 26.w,
                      color: AppColors.textPrimary,
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        padding: EdgeInsets.all(4.w),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
                onPressed: onNotificationPressed,
              ),
              SizedBox(width: 8.w),
            ],
    );
  }

  Widget? _buildTitle() {
    /// Greeting style (Home screen)
    if (greeting != null) {
      return Text(
        '$greeting${userName != null ? ', $userName' : ''}',
        style: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
      );
    }

    /// Center title style (Explore, Details etc.)
    if (title != null) {
      return Text(
        title!,
        style: TextStyle(
          fontSize: 22.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
      );
    }

    return null;
  }

  @override
  Size get preferredSize => Size.fromHeight(60.h);
}
