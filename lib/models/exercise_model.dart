class ExerciseModel {
  final int id;
  final String name;
  final String category;
  final String level;
  final String description;
  final List<String> steps;
  final String durationOrReps;
  final String benefits;
  final String warnings;
  final String imageUrl;
  final String videoUrl;

  ExerciseModel({
    required this.id,
    required this.name,
    required this.category,
    required this.level,
    required this.description,
    required this.steps,
    required this.durationOrReps,
    required this.benefits,
    required this.warnings,
    required this.imageUrl,
    required this.videoUrl,
  });

  factory ExerciseModel.fromJson(Map<String, dynamic> json) {
    return ExerciseModel(
      id: json['id'],
      name: json['name'],
      category: json['category'],
      level: json['level'],
      description: json['description'],
      steps: List<String>.from(json['steps']),
      durationOrReps: json['duration_or_reps'],
      benefits: json['benefits'],
      warnings: json['warnings'],
      imageUrl: json['image_url'],
      videoUrl: json['video_url'],
    );
  }
}
