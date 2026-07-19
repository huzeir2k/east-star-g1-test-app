/// A category of driving-test questions (e.g. "Road Signs").
class QuizCategory {
  final String name;
  final List<QuizQuestion> questions;

  QuizCategory({required this.name, required this.questions});

  factory QuizCategory.fromJson(Map<String, dynamic> json) {
    return QuizCategory(
      name: json['name'] as String,
      questions: (json['questions'] as List<dynamic>)
          .map((q) => QuizQuestion.fromJson(q as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// A single multiple-choice driving-test question.
class QuizQuestion {
  final int id;
  final String question;
  final String? image;
  final List<String> options;
  final int correctOption;

  /// Index of the option the user picked, or null if unanswered.
  int? selectedOption;

  QuizQuestion({
    required this.id,
    required this.question,
    required this.options,
    required this.correctOption,
    this.image,
    this.selectedOption,
  });

  bool get isCorrect => selectedOption == correctOption;

  factory QuizQuestion.fromJson(Map<String, dynamic> json) {
    return QuizQuestion(
      id: json['id'] as int,
      question: json['question'] as String,
      image: json['image'] as String?,
      options: List<String>.from(json['options'] as List<dynamic>),
      correctOption: json['correct_option'] as int,
    );
  }
}
