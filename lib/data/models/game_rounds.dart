class GameRounds {
  final String roundName;
  final int roundPosition;
  final int roundPositiveScore;
  final int roundNegativeScore;

  GameRounds({
    required this.roundName,
    required this.roundPosition,
    required this.roundPositiveScore,
    required this.roundNegativeScore,
  });

  Map<String, dynamic> toJson() => {
        'RoundName': roundName,
        'RoundPosition': roundPosition,
        'RoundPositiveScore': roundPositiveScore,
        'RoundNegativeScore': roundPositiveScore,
      };
}
