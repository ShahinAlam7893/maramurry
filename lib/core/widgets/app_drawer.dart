import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_assets.dart';
import '../../core/constants/app_colors.dart';
import '../../core/routes/app_router.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  // Menu items definition - single source of truth
  static const List<({String title, String route, IconData icon, String? badge})> _menuItems = [
    (title: 'Home', route: RoutePaths.home, icon: Icons.home_outlined, badge: null),
    (title: 'My Projects', route: RoutePaths.projects, icon: Icons.folder_outlined, badge: '3'),
    (title: 'New Project', route: RoutePaths.newProject, icon: Icons.add_circle_outline, badge: null),
    (title: 'Schedule', route: RoutePaths.schedule, icon: Icons.calendar_today_outlined, badge: '5'),
    (title: 'Explore', route: RoutePaths.explore, icon: Icons.explore_outlined, badge: null),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 280.w,
      child: Column(
        children: [
          // Header
          _buildHeader(),
          
          // Menu items
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemCount: _menuItems.length,
              separatorBuilder: (_, i) => i == 4 ? const Divider() : const SizedBox.shrink(),
              itemBuilder: (_, i) {
                final item = _menuItems[i];
                return _buildMenuItem(
                  context,
                  title: item.title,
                  route: item.route,
                  icon: item.icon,
                  badge: item.badge,
                );
              },
            ),
          ),

          // Settings & Logout
          _buildSettingsSection(context),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return UserAccountsDrawerHeader(
      accountName: Text(
        "Sarah Miller",
        style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
      ),
      accountEmail: Text(
        "sarah@email.com",
        style: TextStyle(fontSize: 14.sp),
      ),
      currentAccountPicture: CircleAvatar(
        backgroundImage: AssetImage(AppAssets.profilePlaceholder ?? 'assets/images/profile.jpg'),
        radius: 36.r,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF2E7D32).withOpacity(0.08),
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required String title,
    required String route,
    required IconData icon,
    String? badge,
  }) {
    final isSelected = GoRouterState.of(context).uri.path == route;

    return ListTile(
      leading: Icon(
        icon,
        color: isSelected ? AppColors.primary : AppColors.textSecondary,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16.sp,
          color: isSelected ? AppColors.primary : AppColors.textPrimary,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
        ),
      ),
      trailing: badge != null
          ? Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Text(
                badge,
                style: TextStyle(color: Colors.white, fontSize: 12.sp),
              ),
            )
          : null,
      selected: isSelected,
      selectedTileColor: AppColors.primary?.withOpacity(0.08),
      onTap: () {
        context.go(route);
        Navigator.pop(context);
      },
    );
  }

  Widget _buildSettingsSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(Icons.settings_outlined, color: AppColors.textSecondary),
            title: Text(
              'Settings',
              style: TextStyle(fontSize: 16.sp, color: AppColors.textPrimary),
            ),
            onTap: () {
              context.go(RoutePaths.settings);
              Navigator.pop(context);
            },
          ),
          SizedBox(height: 8.h),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(Icons.logout_rounded, color: AppColors.error),
            title: Text(
              'Log Out',
              style: TextStyle(color: AppColors.error, fontSize: 16.sp),
            ),
            onTap: () {
              // TODO: Real logout logic
              context.go(RoutePaths.login);
            },
          ),
        ],
      ),
    );
  }
}