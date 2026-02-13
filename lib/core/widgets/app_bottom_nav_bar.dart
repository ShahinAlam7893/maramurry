import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/app_colors.dart';

class AppBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  // Navigation items definition
  static const List<({String label, IconData icon, IconData activeIcon})> _items = [
    (label: 'Home', icon: Icons.home_outlined, activeIcon: Icons.home_rounded),
    (label: 'Explore', icon: Icons.explore_outlined, activeIcon: Icons.explore_rounded),
    (label: 'Schedule', icon: Icons.calendar_month_outlined, activeIcon: Icons.calendar_month_rounded),
    (label: 'My Project', icon: Icons.folder_outlined, activeIcon: Icons.folder_rounded),
    (label: 'Profile', icon: Icons.person_outline_rounded, activeIcon: Icons.person_rounded),
  ];

  const AppBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12.r,
            offset: Offset(0, -4.h),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: onTap,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: AppColors.primary ?? const Color(0xFF2E7D32),
          unselectedItemColor: const Color(0xFF757575),
          selectedFontSize: 11.sp,
          unselectedFontSize: 11.sp,
          iconSize: 26.w,
          elevation: 0,
          items: _items
              .map((item) => BottomNavigationBarItem(
                    icon: Icon(item.icon),
                    activeIcon: Icon(item.activeIcon),
                    label: item.label,
                  ))
              .toList(),
        ),
      ),
    );
  }
}