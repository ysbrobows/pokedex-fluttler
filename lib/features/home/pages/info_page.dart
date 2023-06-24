import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informações'),
      ),
      body: const Center(
        child: Text.rich(
          TextSpan(
            text: 'Projeto Flutter Pós-graduação IESB 2023\n\n',
            style: TextStyle(fontSize: 24),
            children: [
              TextSpan(
                text: 'Aluno: Renan Costa dos Santos\nContato: ',
                style: TextStyle(fontSize: 18),
              ),
              TextSpan(
                text: 'https://www.linkedin.com/in/renancds/',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

