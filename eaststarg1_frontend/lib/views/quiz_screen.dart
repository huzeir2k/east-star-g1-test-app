import 'package:flutter/material.dart';

import '../models/quiz_model.dart';

class QuizScreen extends StatefulWidget {
  final QuizCategory category;

  const QuizScreen({super.key, required this.category});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentIndex = 0;
  int? _selectedOption;

  List<QuizQuestion> get _questions => widget.category.questions;

  void _selectOption(int index) {
    setState(() {
      _selectedOption = index;
    });
  }

  void _next() {
    // Save the answer on the current question.
    _questions[_currentIndex].selectedOption = _selectedOption;

    if (_currentIndex == _questions.length - 1) {
      final score = _questions.where((q) => q.isCorrect).length;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => QuizResultScreen(
            categoryName: widget.category.name,
            score: score,
            total: _questions.length,
          ),
        ),
      );
      return;
    }

    setState(() {
      _currentIndex++;
      _selectedOption = _questions[_currentIndex].selectedOption;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_questions.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text(widget.category.name)),
        body: const Center(
          child: Text('No questions available for this category yet.'),
        ),
      );
    }

    final question = _questions[_currentIndex];

    return Scaffold(
      backgroundColor: const Color(0xFFF7E8A4),
      appBar: AppBar(
        title: Text(widget.category.name),
        backgroundColor: Colors.green,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Question ${_currentIndex + 1} of ${_questions.length}',
                style: const TextStyle(color: Colors.black54, fontSize: 14),
              ),
              const SizedBox(height: 8.0),
              LinearProgressIndicator(
                value: (_currentIndex + 1) / _questions.length,
                backgroundColor: Colors.white,
                color: Colors.green,
              ),
              const SizedBox(height: 16.0),
              if (question.image != null) ...[
                Image.asset(
                  question.image!,
                  height: 150,
                  errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.image_not_supported,
                    size: 80,
                    color: Colors.black38,
                  ),
                ),
                const SizedBox(height: 16.0),
              ],
              Text(
                question.question,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16.0),
              Expanded(
                child: ListView.builder(
                  itemCount: question.options.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 4.0),
                      child: RadioListTile<int>(
                        value: index,
                        groupValue: _selectedOption,
                        title: Text(question.options[index]),
                        onChanged: (value) => _selectOption(value),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _selectedOption == null ? null : _next,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    _currentIndex == _questions.length - 1
                        ? 'Finish'
                        : 'Next',
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class QuizResultScreen extends StatelessWidget {
  final String categoryName;
  final int score;
  final int total;

  const QuizResultScreen({
    super.key,
    required this.categoryName,
    required this.score,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    final passed = total == 0 ? false : (score / total) >= 0.8;

    return Scaffold(
      backgroundColor: const Color(0xFFF7E8A4),
      appBar: AppBar(
        title: Text('$categoryName Results'),
        backgroundColor: Colors.green,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  passed ? Icons.check_circle : Icons.cancel,
                  color: passed ? Colors.green : Colors.red,
                  size: 80,
                ),
                const SizedBox(height: 16.0),
                Text(
                  'You scored $score / $total',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  passed ? 'Great job!' : 'Keep practicing!',
                  style: const TextStyle(fontSize: 16, color: Colors.black54),
                ),
                const SizedBox(height: 32.0),
                ElevatedButton(
                  onPressed: () => Navigator.popUntil(
                    context,
                    (route) => route.isFirst,
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 12.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Back to Home',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
