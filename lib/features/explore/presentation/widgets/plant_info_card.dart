import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maramurry/core/widgets/app_button.dart';

class PlantInfoCard extends StatelessWidget {
  const PlantInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 14.h),
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: const Color(0xffE4E7E2),
        borderRadius: BorderRadius.circular(18.r),
      ),
      child: Column(
        children: [
          /// top row
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.network(
                  "https://images.unsplash.com/photo-1567306226416-28f0efdc88ce",
                  width: 52.w,
                  height: 52.w,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 12.w),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Name",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                    ),
                  ),
                  Text(
                    "Details",
                    style: TextStyle(fontSize: 12.sp, color: Colors.grey[700]),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(height: 12.h),

          /// tags
          Row(
            children: const [
              _Tag("Full Sun"),
              _Tag("High water"),
              _Tag("24-36 inches"),
            ],
          ),

          SizedBox(height: 12.h),

          Container(
            height: 40.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xff2F5D34),
              borderRadius: BorderRadius.circular(30.r),
            ),
            child: const Center(
              child: Text(
                "View Details",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Tag extends StatelessWidget {
  final String text;
  const _Tag(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8.w),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(text, style: TextStyle(fontSize: 11.sp)),
    );
  }
}
