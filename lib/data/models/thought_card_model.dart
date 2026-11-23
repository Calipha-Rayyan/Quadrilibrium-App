/// Thought Reframer card preserving all three documented fields:
/// Stressful Thought, Thinking Trap, and Realistic Counter-Statement.
class ThoughtCardModel {
  const ThoughtCardModel({
    required this.id,
    required this.stressfulThought,
    required this.thinkingTrap,
    required this.counterStatement,
    required this.savedDateLabel,
  });

  final String id;
  final String stressfulThought;
  final String thinkingTrap;
  final String counterStatement;
  final String savedDateLabel;
}
