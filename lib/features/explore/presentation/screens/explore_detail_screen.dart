import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:maramurry/core/constants/app_colors.dart';
import 'package:maramurry/core/widgets/app_app_bar.dart';
import 'package:maramurry/features/explore/data/inspiration_model.dart';
import 'package:maramurry/features/explore/presentation/widgets/inspiration_card.dart';
import 'package:maramurry/features/explore/presentation/widgets/plant_info_card.dart';

class ExploreDetailScreen extends StatelessWidget {
  final InspirationModel item;

  const ExploreDetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(
        title: "Explore",
        centerTitle: true,
        showBackButton: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// IMAGE SECTION
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(24.r),
                      child: Hero(
                        tag: item.imageUrl,
                        child: Image.network(
                          item.imageUrl,
                          height: 360.h,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    /// back button
                    Positioned(
                      top: 16,
                      left: 16,
                      child: _circleIcon(
                        icon: Icons.arrow_back_ios_new,
                        onTap: () => Navigator.pop(context),
                      ),
                    ),

                    /// bookmark
                    Positioned(
                      bottom: 16,
                      left: 16,
                      child: _circleIcon(icon: Icons.bookmark_border),
                    ),

                    /// share
                    Positioned(
                      bottom: 16,
                      right: 16,
                      child: _circleIcon(icon: Icons.share_outlined),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20.h),

              /// TITLE
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  "Plant Names",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              SizedBox(height: 12.h),

              /// PLANT LIST
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return const PlantInfoCard();
                },
              ),

              SizedBox(height: 20.h),

              /// RELATED SECTION TITLE
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  "Related",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              SizedBox(height: 12.h),

              /// RELATED GRID (2 columns, staggered)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: MasonryGridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12.h,
                  crossAxisSpacing: 12.w,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: inspirations.length,
                  itemBuilder: (context, index) {
                    final relatedItem = inspirations[index];
                    return SizedBox(
                      height: index % 3 == 0 ? 200.h : 140.h,
                      child: InspirationCard(item: relatedItem),
                    );
                  },
                ),
              ),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _circleIcon({required IconData icon, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 42.w,
        height: 42.w,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.35),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: 20),
      ),
    );
  }
}
