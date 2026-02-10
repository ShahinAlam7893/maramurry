import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maramurry/core/constants/app_assets.dart';
import 'package:maramurry/core/constants/app_colors.dart';
import 'package:maramurry/core/widgets/app_button.dart';

class OnboardingScreenFive extends StatefulWidget {
  const OnboardingScreenFive({super.key});

  @override
  State<OnboardingScreenFive> createState() => _OnboardingScreenFiveState();
}

class _OnboardingScreenFiveState extends State<OnboardingScreenFive>
    with SingleTickerProviderStateMixin {
  late AnimationController _dotController;
  late List<Animation<double>> _dotAnimations;

  @override
  void initState() {
    super.initState();

    _dotController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2200),
    )..repeat(reverse: true);

    _dotAnimations = List.generate(4, (index) {
      return Tween<double>(begin: 0.5, end: 1.2).animate(
        CurvedAnimation(
          parent: _dotController,
          curve: Interval(
            index * 0.18,
            (index + 1) * 0.18,
            curve: Curves.easeInOutCubic,
          ),
        ),
      );
    });

    _dotController.forward();
  }

  @override
  void dispose() {
    _dotController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset(
            AppAssets.onboarding5,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          SafeArea(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(40.h, 40.h, 40.h, 10.h),
                  child: Image.asset(AppAssets.instaCard),
                ),

                // Title
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.w),
                  child: Text(
                    "Get Inspired",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.deepGreen,
                      height: 1.22,
                    ),
                  ),
                ),

                SizedBox(height: 12.h),

                // Description
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 44.w),
                  child: Text(
                    "Discover ideas from our growing community.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15.5.sp,
                      color: AppColors.grey,
                      height: 1.45,
                    ),
                  ),
                ),

                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(4, (index) {
                    final isActive = index <= 3;
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6.w),
                      child: AnimatedBuilder(
                        animation: _dotAnimations[index],
                        builder: (context, child) {
                          return Container(
                            width: 10.w,
                            height: 10.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: isActive
                                  ? AppColors.primary
                                  : AppColors.divider,
                              boxShadow: isActive
                                  ? [
                                      BoxShadow(
                                        color: AppColors.primary.withOpacity(
                                          0.4,
                                        ),
                                        blurRadius: 8.r,
                                        spreadRadius: 1.r,
                                      ),
                                    ]
                                  : null,
                            ),
                            child: isActive && index == 1
                                ? ScaleTransition(
                                    scale: _dotAnimations[index],
                                    child: child,
                                  )
                                : null,
                          );
                        },
                        child: const SizedBox(),
                      ),
                    );
                  }),
                ),

                SizedBox(height: 12.h),

                Text(
                  "4 of 4",
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: AppColors.textSecondary,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.w),
                  child: Column(
                    children: [
                      TextButton(
                        onPressed: () {
                          // Skip to login/home
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
                      AppButton(
                        label: "Next",
                        onPressed: () {
                          // context.go('/onboarding/4') or next screen
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
