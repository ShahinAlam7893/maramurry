import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:maramurry/core/constants/app_assets.dart';
import 'package:maramurry/core/constants/app_colors.dart';
import 'package:maramurry/core/routes/app_router.dart';
import 'package:maramurry/core/widgets/app_app_bar.dart';
import 'package:maramurry/features/explore/data/inspiration_model.dart';
import 'package:maramurry/features/explore/presentation/widgets/inspiration_card.dart';
import 'package:maramurry/features/home/presentation/widgets/home_card.dart';
import 'package:maramurry/features/home/presentation/widgets/upcoming_tasks_section.dart';
import 'package:maramurry/features/home/presentation/widgets/your_project_section.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final List<InspirationModel> _inspirationItems = [
    InspirationModel(
      imageUrl: 'https://images.unsplash.com/photo-1585320806297-9794b3e4eeae',
      title: 'Lorem ipsum dolor sit amet',
    ),
    InspirationModel(
      imageUrl: 'https://images.unsplash.com/photo-1585320806297-9794b3e4eeae',
      title: 'Lorem ipsum dolor sit amet',
    ),
    InspirationModel(
      imageUrl: 'https://images.unsplash.com/photo-1585320806297-9794b3e4eeae',
      title: 'Lorem ipsum dolor sit amet',
    ),
    InspirationModel(
      imageUrl: 'https://images.unsplash.com/photo-1585320806297-9794b3e4eeae',
      title: 'Lorem ipsum dolor sit amet',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppAppBar(
        greeting: "Good afternoon",
        userName: "Sarah",
        onMenuPressed: () => Scaffold.of(context).openDrawer(),
        onNotificationPressed: () {},
      ),
      body: Container(
        decoration: const BoxDecoration(gradient: AppColors.BackgroundGradient),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16.h),
                HomeProjectCard(
                  onTap: () {
                    context.push(RoutePaths.newProject);
                  },
                ),

                SizedBox(height: 10.h),

                Row(
                  children: [
                    Expanded(
                      child: _StatCard(
                        svgPath: AppAssets.projectSvg,
                        title: "PROJECTS",
                        value: "3",
                        color: Colors.green,
                        onTap: () => context.push(RoutePaths.projects),
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: _StatCard(
                        svgPath: AppAssets.todayTaskSvg,
                        title: "TASKS TODAY",
                        value: "5",
                        color: Colors.orange,
                        onTap: () => context.go(RoutePaths.schedule),
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: _StatCard(
                        svgPath: AppAssets.plantSvg,
                        title: "PLANTS",
                        value: "24",
                        color: Colors.blue,
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                const YourProjectsSection(),
                SizedBox(height: 10.h),
                const UpcomingTasksSection(),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Get Inspired",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    TextButton(
                      onPressed: () => context.push(RoutePaths.explore),
                      child: Text(
                        "Explore",
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 10.h),

                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _inspirationItems.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12.w,
                    mainAxisSpacing: 12.h,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (context, index) {
                    final item = _inspirationItems[index];

                    return GestureDetector(
                      onTap: () => context.push(RoutePaths.explore),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(18.r),
                        child: Image.network(item.imageUrl, fit: BoxFit.cover),
                      ),
                    );
                  },
                ),

                SizedBox(height: 10.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData? icon;
  final String? svgPath;
  final String title;
  final String value;
  final Color color;
  final VoidCallback onTap;

  const _StatCard({
    this.icon,
    this.svgPath,
    required this.title,
    required this.value,
    required this.color,
    required this.onTap,
  }) : assert(
         icon != null || svgPath != null,
         'Either icon or svgPath must be provided',
       );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(22.r),
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40.w,
              height: 40.w,
              decoration: BoxDecoration(
                color: color.withOpacity(0.15),
                shape: BoxShape.circle,
              ),
              child: Center(child: _buildIcon()),
            ),

            SizedBox(height: 8.h),

            Text(
              value,
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),

            SizedBox(height: 4.h),

            Text(
              title,
              style: TextStyle(
                fontSize: 11.sp,
                letterSpacing: 0.8,
                color: Colors.grey[600],
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon() {
    if (svgPath != null) {
      return SvgPicture.asset(
        svgPath!,
        width: 22.w,
        height: 22.w,
        colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      );
    }
    return Icon(icon, size: 24.sp, color: color);
  }
}
