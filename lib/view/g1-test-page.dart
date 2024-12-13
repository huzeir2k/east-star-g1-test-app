import 'dart:convert';
import 'package:flutter/material.dart';

class G1Page extends StatefulWidget {
  const G1Page({super.key});

  @override
  State<G1Page> createState() => _G1PageState();
}

class _G1PageState extends State<G1Page> {
  late List<dynamic> _questions;
  int _currentQuestionIndex = 0;
  String? _selectedAnswer;
  bool _isAnswerCorrect = false;
  String? _explanation;

  @override
  void initState() {
    super.initState();
    _loadQuestions();
  }

  Future<void> _loadQuestions() async {
    final String data = await DefaultAssetBundle.of(context)
        .loadString('assets/questions.json');
    setState(() {
      _questions = jsonDecode(data);
    });
  }

  void _submitAnswer(String selectedAnswer) {
    final correctAnswer = _questions[_currentQuestionIndex]['correctAnswer'];
    final explanation = _questions[_currentQuestionIndex]['explanation'];

    setState(() {
      _selectedAnswer = selectedAnswer;
      _isAnswerCorrect = selectedAnswer == correctAnswer;
      _explanation = explanation;
    });
  }

  void _nextQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex + 1) % _questions.length;
      _selectedAnswer = null;
      _isAnswerCorrect = false;
      _explanation = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_questions.isEmpty) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final currentQuestion = _questions[_currentQuestionIndex];
    final answers = currentQuestion['answers'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('G1 Practice Quiz'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildQuestion(currentQuestion),
            const SizedBox(height: 20),
            _buildAnswers(answers),
            if (_selectedAnswer != null) _buildFeedback(),
            const Spacer(),
            if (_selectedAnswer != null) _buildNextButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestion(Map<String, dynamic> question) {
    final isImageQuestion = question['type'] == 'image';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isImageQuestion)
          Center(
            child: Image.asset(
              question['content'],
              height: 200,
              fit: BoxFit.contain,
            ),
          )
        else
          Text(
            question['content'],
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
      ],
    );
  }

  Widget _buildAnswers(List<dynamic> answers) {
    return Column(
      children: answers.map((answer) {
        final isSelected = _selectedAnswer == answer;
        return GestureDetector(
          onTap: () => _submitAnswer(answer),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isSelected
                  ? (_isAnswerCorrect ? Colors.green : Colors.red)
                  : Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.black12),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Text(
              answer,
              style: TextStyle(
                fontSize: 16,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildFeedback() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _isAnswerCorrect ? 'Correct!' : 'Incorrect!',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: _isAnswerCorrect ? Colors.green : Colors.red,
            ),
          ),
          if (!_isAnswerCorrect)
            Text(
              'Explanation: $_explanation',
              style: const TextStyle(fontSize: 16, color: Colors.black54),
            ),
        ],
      ),
    );
  }

  Widget _buildNextButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton(
        onPressed: _nextQuestion,
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        child: const Text('Next Question'),
      ),
    );
  }
}
