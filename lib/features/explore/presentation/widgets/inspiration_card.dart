// core/widgets/inspiration_card.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:maramurry/core/constants/app_colors.dart';
import 'package:maramurry/core/routes/app_router.dart';
import 'package:maramurry/features/explore/data/inspiration_model.dart';

class InspirationCard extends StatelessWidget {
  final InspirationModel item;

  const InspirationCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        /// navigate to details page
        context.push(
          RoutePaths.exploreDetail,
          extra: item,
        );
      },
      
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18.r),
        child: Stack(
          children: [
            Image.network(
              item.imageUrl,
              fit: BoxFit.cover,
            ),
      
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.7),
                    ],
                  ),
                ),
                child: Text(
                  item.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
