abstract class QuizEvent {}

class NextQuestionEvent extends QuizEvent {}

class PrevQuestionEvent extends QuizEvent {}

class AnswerQuestionEvent extends QuizEvent {
  final int selectedAnswerIndex;

  AnswerQuestionEvent(this.selectedAnswerIndex);
}

// states.dart
abstract class QuizState {}

class QuestionAnswerState extends QuizState {
  final int currentQuestion;
  final int selectedAnswerIndex;

  QuestionAnswerState(this.currentQuestion, this.selectedAnswerIndex);
}

class GetQuestionState extends QuizState {
  final int currentQuestion;

  GetQuestionState(this.currentQuestion);
}

class InitialState extends QuizState {
  InitialState();
}

