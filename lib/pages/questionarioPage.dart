// ignore_for_file: library_private_types_in_public_api, sort_child_properties_last, file_names

import 'package:flutter/material.dart';

class QuestionarioPage extends StatelessWidget {
  const QuestionarioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: MyAppBar(currentQuestion: 1, totalQuestions: 4),
      body: const Center(
        child: Material(
          color: Colors.transparent,
          child: Card(
            margin: EdgeInsets.only(
                left: 30.0, right: 30.0, top: 70.0, bottom: 150.0),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Questionario(),
            ),
          ),
        ),
      ),
    );
  }
}

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  int currentQuestion;
  final int totalQuestions;

  MyAppBar(
      {Key? key, required this.currentQuestion, required this.totalQuestions})
      : super(key: key);

  @override
  _MyAppBarState createState() => _MyAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  void updateQuestion(int currentQuestion) {
    this.currentQuestion = currentQuestion;
  }
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: const Text(
        'Questionario',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {},
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.skip_next),
          onPressed: () {},
        ),
      ],
      bottom: PreferredSize(
        child: Text(
          '${widget.currentQuestion} di ${widget.totalQuestions}',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
        preferredSize: const Size.fromHeight(24.0),
      ),
    );
  }
}

class Questionario extends StatefulWidget {
  const Questionario({super.key});

  @override
  _QuestionarioState createState() => _QuestionarioState();
}

class _QuestionarioState extends State<Questionario> {
  int _selectedOptionIndex =
      -1; // valore di default per nessuna opzione selezionata
  int current = 0;

  MyAppBar myAppBar = MyAppBar(currentQuestion: 1, totalQuestions: 4);

  final List<Map<String, dynamic>> _questionario = [
    {
      'domanda': 'Qual è la capitale dell\'Italia?',
      'risposte': ['Roma', 'Milano', 'Napoli', 'Firenze'],
    },
    {
      'domanda': 'Qual è la capitale della Francia?',
      'risposte': ['Parigi', 'Lione', 'Nizza', 'Marsiglia'],
    },
    {
      'domanda': 'Qual è la capitale della Spagna?',
      'risposte': ['Madrid', 'Barcellona', 'Valencia', 'Sevilla'],
    },
    {
      'domanda': 'Qual è la capitale della Germania?',
      'risposte': ['Berlino', 'Munich', 'Colonia', 'Hannover'],
    },
  ];

  void _selezionaRisposta(int? index) {
    if (index != null) {
      setState(() {
        _selectedOptionIndex = index;
      });
    }
  }

  void _nextQuestion() {
    setState(() {
      current++;
    });
    myAppBar.updateQuestion(current);
  }

  void _previousQuestion() {
    setState(() {
      current--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            _questionario[current]['domanda'],
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16.0),
          ...(_questionario[current]['risposte'] as List<String>)
              .asMap()
              .entries
              .map((entry) {
            int index = entry.key;
            String risposta = entry.value;
            return RadioListTile(
              title: Text(risposta),
              value: index,
              groupValue: _selectedOptionIndex,
              onChanged: _selezionaRisposta,
            );
          }).toList(),
          const SizedBox(height: 16.0),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Spacer(),
              Text(
                '${current + 1} di ${_questionario.length}',
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ElevatedButton(
                  child: const Text('Indietro'),
                  onPressed: current == 0
                      ? null
                      : () {
                          _previousQuestion();
                          _selezionaRisposta(-1);
                        },
                ),
                ElevatedButton(
                  child: const Text('Avanti'),
                  onPressed: _selectedOptionIndex == -1
                      ? null
                      : () {
                          if (current == _questionario.length - 1) {
                            // ignore: todo
                            // TODO: Calcola e mostra il risultato
                          } else {
                            _nextQuestion();
                            _selezionaRisposta(-1);
                          }
                        },
                ),
              ])
        ]);
  }
}
