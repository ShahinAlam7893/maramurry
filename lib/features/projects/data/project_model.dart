import 'package:maramurry/core/constants/app_assets.dart';

class ProjectModel {
  final String id;
  final String title;
  final String image;
  final int progress; 
  final String status;

  const ProjectModel({
    required this.id,
    required this.title,
    required this.image,
    required this.progress,
    required this.status,
  });
}



const dummyProjects = [
  ProjectModel(
    id: '1',
    title: 'Front Yard Garden',
    image: AppAssets.projectImage,
    progress: 75,
    status: 'In Progress',
  ),
  ProjectModel(
    id: '2',
    title: 'Herb Garden',
    image: AppAssets.projectImage,
    progress: 45,
    status: 'In Progress',
  ),
];