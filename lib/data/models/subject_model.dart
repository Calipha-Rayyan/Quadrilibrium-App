/// Study flashcard subject / deck model.
class SubjectModel {
  const SubjectModel({
    required this.id,
    required this.name,
    this.description = '',
  });

  final String id;
  final String name;
  final String description;

  SubjectModel copyWith({String? name, String? description}) {
    return SubjectModel(
      id: id,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }
}
