import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maramurry/core/constants/app_assets.dart';
import 'package:maramurry/core/widgets/app_button.dart';

class HomeProjectCard extends StatelessWidget {
  final VoidCallback onTap;

  const HomeProjectCard({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(28.r),
      onTap: onTap,
      child: Container(
        height: 240.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28.r),
          image: DecorationImage(
            image: AssetImage(AppAssets.homeCardBG),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28.r),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(20.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 40.w,
                    height: 40.w,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFD9DED5),
                    ),
                    child: Icon(Icons.add, size: 20.sp),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "Start Your Garden Project",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    "Upload a photo and design with AI",
                    style: TextStyle(fontSize: 14.sp, color: Colors.grey[700]),
                  ),
                  SizedBox(height: 16.h),
                  AppButton(
                    label: "+ New Project",
                    width: 160.w,
                    onPressed: onTap,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
