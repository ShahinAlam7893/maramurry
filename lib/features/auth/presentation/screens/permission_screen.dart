// features/onboarding/permissions_setup_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:maramurry/core/constants/app_assets.dart';
import 'package:maramurry/core/constants/app_colors.dart';
import 'package:maramurry/core/widgets/app_button.dart';
import 'package:maramurry/features/auth/presentation/widgets/permission_card.dart';

class PermissionsSetupScreen extends StatelessWidget {
  const PermissionsSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: SizedBox(
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  AppAssets.signUpBackground,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20.h),
                      Container(
                        width: 100.w,
                        height: 150.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(32.r),
                          border: Border.all(
                            color: AppColors.primary,
                            width: 4.w,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primary.withOpacity(0.4),
                              blurRadius: 20.r,
                              offset: Offset(-15.w, 0),
                            ),
                            BoxShadow(
                              color: AppColors.primary.withOpacity(0.4),
                              blurRadius: 20.r,
                              offset: Offset(15.w, 0),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildDot(
                              AppColors.blueAccent,
                              Icons.camera_alt_outlined,
                            ),
                            SizedBox(height: 10.h),
                            _buildDot(
                              AppColors.greenAccent,
                              Icons.location_on_outlined,
                            ),
                            SizedBox(height: 10.h),
                            _buildDot(
                              AppColors.orangeAccent,
                              Icons.notifications_none,
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 32.h),

                      Text(
                        "Let's Get You Set Up",
                        style: TextStyle(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),

                      SizedBox(height: 12.h),

                      Text(
                        "We need a few permissions to give you\nthe best experience",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: AppColors.textSecondary,
                          height: 1.4,
                        ),
                      ),

                      SizedBox(height: 20.h),

                      // Permission Cards
                      PermissionCard(
                        icon: Icons.camera_alt_rounded,
                        title: "Camera",
                        description:
                            "Take photos of your garden for\nAI analysis and design",
                        status: PermissionStatus.required,
                      ),

                      SizedBox(height: 16.h),

                      PermissionCard(
                        icon: Icons.location_on_rounded,
                        title: "Location",
                        description:
                            "Get personalized plant recommendations\nbased on your climate zone and local weather",
                        status: PermissionStatus.recommended,
                      ),

                      SizedBox(height: 16.h),

                      PermissionCard(
                        icon: Icons.notifications_active_rounded,
                        title: "Notifications",
                        description:
                            "Receive reminders for planting,\nwatering, and seasonal tasks",
                        status: PermissionStatus.optional,
                      ),

                      TextButton(
                        onPressed: () {
                          context.go('/home');
                        },
                        child: Text(
                          "Skip",
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: AppColors.textSecondary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),

                      SizedBox(height: 12.h),

                      // Continue Button
                      SafeArea(
                        child: AppButton(
                          label: "Continue",
                          onPressed: () {
                            // TODO: Request permissions (permission_handler)
                            // Example: Permission.camera.request();
                            // After success → context.go('/home');
                          },
                        ),
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDot(Color color, IconData iconData) {
    return Container(
      width: 30.w,
      height: 30.h,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      child: Icon(iconData, color: AppColors.surface, size: 18.w),
    );
  }
}
