class GameQuestion {
  final String question;
  final String correctAnswer;
  final String wrongAnswer;
  final String roundName;

  GameQuestion({
    required this.question,
    required this.correctAnswer,
    required this.wrongAnswer,
    required this.roundName,
  });

  Map<String, String> toJson() => {
        'Question': question,
        'CorrectAnswer': correctAnswer,
        'IncorrectAnswer': wrongAnswer,
        'RoundName': roundName,
      };
}
