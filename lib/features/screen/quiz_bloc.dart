import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:zenutri/features/screen/quiz_states.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc() : super(InitialState());

  @override
  Stream<QuizState> mapEventToState(QuizEvent event) async* {
    if (event is NextQuestionEvent) {
      if (state is GetQuestionState) {
        final currentState = state as GetQuestionState;
        yield GetQuestionState(currentState.currentQuestion + 1);
      }
    } else if (event is PrevQuestionEvent) {
      if (state is GetQuestionState) {
        final currentState = state as GetQuestionState;
        yield GetQuestionState(currentState.currentQuestion - 1);
      }
    } else if (event is AnswerQuestionEvent) {
      if (state is GetQuestionState) {
        final currentState = state as GetQuestionState;
        yield QuestionAnswerState(
            currentState.currentQuestion, event.selectedAnswerIndex);
      }
    }
  }
}
