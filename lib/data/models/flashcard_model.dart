/// Individual flashcard belonging to a [SubjectModel].
class FlashcardModel {
  const FlashcardModel({
    required this.id,
    required this.subjectId,
    required this.term,
    required this.description,
  });

  final String id;
  final String subjectId;
  final String term;
  final String description;

  FlashcardModel copyWith({String? term, String? description}) {
    return FlashcardModel(
      id: id,
      subjectId: subjectId,
      term: term ?? this.term,
      description: description ?? this.description,
    );
  }
}
