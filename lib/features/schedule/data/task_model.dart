import 'package:maramurry/core/constants/app_assets.dart';

enum TaskPriority { low, medium, high }

class TaskModel {
  final String id;
  final String title;
  final String projectName;
  final String image;
  final DateTime dateTime;
  final TaskPriority priority;
  final bool isCompleted;

  const TaskModel({
    required this.id,
    required this.title,
    required this.projectName,
    required this.image,
    required this.dateTime,
    this.priority = TaskPriority.medium,
    this.isCompleted = false,
  });
}

final dummyUpcomingTasks = [
  TaskModel(
    id: '1',
    title: 'Plant roses',
    projectName: 'Front Yard Garden',
    image: AppAssets.taskRose,
    dateTime: DateTime.now().add(const Duration(hours: 1)),
    priority: TaskPriority.high,
  ),
  TaskModel(
    id: '2',
    title: 'Water herbs',
    projectName: 'Herb Garden',
    image: AppAssets.taskHerbs,
    dateTime: DateTime.now().add(const Duration(hours: 4)),
  ),
  TaskModel(
    id: '3',
    title: 'Add fertilizer',
    projectName: 'Front Yard Garden',
    image: AppAssets.taskFertilizer,
    dateTime: DateTime.now().add(const Duration(days: 1)),
  ),
];