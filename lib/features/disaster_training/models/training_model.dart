class TrainingModel {
  final String name;
  final Map<String, List<String>> trainingGuide;

  TrainingModel({required this.name, required this.trainingGuide});

  factory TrainingModel.fromJson(Map<String, dynamic> json) {
    return TrainingModel(
      name: json['name'],
      trainingGuide: {
        'before': List<String>.from(json['trainingGuide']['before'] ?? []),
        'during': List<String>.from(json['trainingGuide']['during'] ?? []),
        'after': List<String>.from(json['trainingGuide']['after'] ?? []),
      },
    );
  }
}
