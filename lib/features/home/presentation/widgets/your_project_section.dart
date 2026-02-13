import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maramurry/features/projects/data/project_model.dart';
import 'package:maramurry/features/projects/presentation/widgets/project_card.dart';


class YourProjectsSection extends StatelessWidget {
  const YourProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Your Projects',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('See All'),
            ),
          ],
        ),
        SizedBox(height: 16.h),

        /// Projects list
        SizedBox(
          height: 190.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: dummyProjects.length,
            separatorBuilder: (_, __) => SizedBox(width: 16.w),
            itemBuilder: (context, index) {
              return ProjectCard(
                project: dummyProjects[index],
                onTap: () {},
              );
            },
          ),
        ),
      ],
    );
  }
}
