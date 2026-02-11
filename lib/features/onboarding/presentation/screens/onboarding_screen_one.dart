import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:maramurry/core/constants/app_assets.dart';
import 'package:maramurry/core/constants/app_colors.dart';
import 'package:maramurry/core/routes/app_router.dart';
import 'package:maramurry/core/widgets/app_button.dart';

class OnboardingScreen1 extends StatelessWidget {
  const OnboardingScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: SvgPicture.asset(
              AppAssets.onboarding1,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),

          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 60.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AppAssets.logo,
                        width: 32.w,
                        height: 32.h,
                      ),
                    ],
                  ),

                  SizedBox(height: 8.h),

                  Text(
                    'Design Your Dream Garden',
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: AppColors.seconderyGreen,
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  const Spacer(flex: 2),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.r),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.seconderyGreen,
                          blurRadius: 20,
                          spreadRadius: -6,
                          offset: const Offset(0, 40),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24.r),
                      child: Image.asset(
                        AppAssets.onboardingOneImage,
                        height: 220.h,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  SizedBox(height: 40.h),

                  _FeatureItem(
                    icon: Icons.camera_alt_outlined,
                    text: 'AI-Powered Plant Recommendations',
                  ),
                  SizedBox(height: 16.h),
                  _FeatureItem(
                    icon: Icons.auto_awesome_outlined,
                    text: '3D Visualization & AR Preview',
                  ),
                  SizedBox(height: 16.h),
                  _FeatureItem(
                    icon: Icons.calendar_today_outlined,
                    text: 'Smart Garden Scheduling',
                  ),

                  const Spacer(flex: 3),
                  AppButton(
                    label: 'Get Started',
                    onPressed: () {
                      context.go(RoutePaths.onBoardingTwo);
                    },
                    type: ButtonType.primary,
                  ),
                  SizedBox(height: 16.h),

                  AppButton(
                    label: 'Log In',
                    onPressed: () {
                      context.go(RoutePaths.login);
                    },
                    type: ButtonType.outlined,
                  ),

                  SizedBox(height: 40.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FeatureItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const _FeatureItem({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 40.h,
          width: 40.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.r),
            color: Color(0xFFD6E0CF),
          ),
          child: Icon(icon, color: AppColors.deepGreen, size: 20.w),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.deepGreen,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
