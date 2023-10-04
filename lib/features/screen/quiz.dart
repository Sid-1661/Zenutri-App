import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zenutri/features/screen/quiz_bloc.dart';
import 'package:zenutri/features/screen/quiz_data.dart';
import 'package:zenutri/features/screen/quiz_states.dart';

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuizBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
        ),
        body: BlocBuilder<QuizBloc, QuizState>(
          builder: (context, state) {
            if (state is InitialState) {
              return Center(child: Text('Loading...'));
            } else if (state is GetQuestionState) {
              final questionNumber = state.currentQuestion;
              final questionData = quizData[questionNumber];
              final questionText = questionData!["question"];
              final answerChoices = questionData["answers"] as List<String>;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      questionText,
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                  Column(
                    children: answerChoices
                        .asMap()
                        .entries
                        .map(
                          (entry) => AnswerChoiceButton(
                            answerIndex: entry.key,
                            answerText: entry.value,
                          ),
                        )
                        .toList(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Dispatch the PrevQuestionEvent
                          BlocProvider.of<QuizBloc>(context)
                              .add(PrevQuestionEvent());
                        },
                        child: Text('Previous'),
                      ),
                      SizedBox(width: 16),
                      ElevatedButton(
                        onPressed: () {
                          // Dispatch the NextQuestionEvent
                          BlocProvider.of<QuizBloc>(context)
                              .add(NextQuestionEvent());
                        },
                        child: Text('Next'),
                      ),
                    ],
                  ),
                ],
              );
            } else if (state is QuestionAnswerState) {
              // Display a message or navigate to the next question after answering.
              return Center(
                child: Column(
                  children: [
                    Text(
                        'Answer submitted for Question ${state.currentQuestion}'),
                    ElevatedButton(
                      onPressed: () {
                        // Dispatch the NextQuestionEvent to move to the next question.
                        BlocProvider.of<QuizBloc>(context)
                            .add(NextQuestionEvent());
                      },
                      child: Text('Next'),
                    ),
                  ],
                ),
              );
            } else {
              // Handle other states if necessary.
              return Container();
            }
          },
        ),
      ),
    );
  }
}

class AnswerChoiceButton extends StatelessWidget {
  final int answerIndex;
  final String answerText;

  AnswerChoiceButton({required this.answerIndex, required this.answerText});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Dispatch the AnswerQuestionEvent with the selected answer index
        BlocProvider.of<QuizBloc>(context)
            .add(AnswerQuestionEvent(answerIndex + 1));
      },
      child: Text(answerText),
    );
  }
}
