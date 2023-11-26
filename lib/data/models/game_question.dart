class GameQuestion {
  final String question;
  final String correctAnswer;
  final String wrongAnswer;

  GameQuestion({
    required this.question,
    required this.correctAnswer,
    required this.wrongAnswer,
  });

  Map<String, String> toJson() => {
        'Question': question,
        'CorrectAnswer': correctAnswer,
        'IncorrectAnswer': wrongAnswer,
      };
}
