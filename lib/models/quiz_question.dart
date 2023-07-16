class QuizQuestion {
  const QuizQuestion(this.text, this.answer);

  final String text;
  final List<String> answer;

  // to have shuffled options
  List<String> getShuffledAnswers() {
    final copiedList = List.of(answer);
    copiedList.shuffle();
    return copiedList;
  }
}
