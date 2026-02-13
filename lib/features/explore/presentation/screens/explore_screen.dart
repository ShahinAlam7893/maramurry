import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:maramurry/core/constants/app_colors.dart';
import 'package:maramurry/core/widgets/app_app_bar.dart';
import 'package:maramurry/features/explore/data/inspiration_model.dart';
import 'package:maramurry/features/explore/presentation/widgets/featured_card.dart';
import 'package:maramurry/features/explore/presentation/widgets/inspiration_card.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: const AppAppBar(title: "Explore", centerTitle: true),

      body: Container(
        decoration: const BoxDecoration(gradient: AppColors.BackgroundGradient),
        child: Column(
          children: [
            /// SEARCH BAR
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Plants, people, ideas...",
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: const Icon(Icons.tune),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(vertical: 12.h),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.r),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            /// TAGS
            SizedBox(
              height: 40.h,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                children: const [
                  TagChip("#Rose Garden"),
                  TagChip("#Frontyard"),
                  TagChip("Photogenic"),
                  TagChip("#Plant"),
                ],
              ),
            ),

            SizedBox(height: 12.h),

            /// GRID
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: MasonryGridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  itemCount: inspirations.length + 1,
                  itemBuilder: (context, index) {
                    if (index == 4) {
                      return const FeaturedCard();
                    }

                    final item = inspirations[index > 4 ? index - 1 : index];

                    return InspirationCard(item: item);
                  },
                ),
              ),
            ),
            // SizedBox(height: 12.h),
          ],
        ),
      ),
    );
  }
}

class TagChip extends StatelessWidget {
  final String text;
  const TagChip(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10.w),
      child: Chip(
        label: Text(text),
        backgroundColor: Colors.white,
        shape: StadiumBorder(side: BorderSide(color: Colors.grey.shade300)),
      ),
    );
  }
}
