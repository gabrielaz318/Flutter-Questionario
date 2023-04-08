import 'package:flutter/material.dart';

import './resultado.dart';
import './questionario.dart';

main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 1},
        {'texto': 'Vermelho', 'pontuacao': 3},
        {'texto': 'Verde', 'pontuacao': 10},
        {'texto': 'Branco', 'pontuacao': 6}
      ]
    },
    {
      'texto': 'Qual é o seu animal favorito',
      'respostas': [
        {'texto': 'Girafa', 'pontuacao': 7},
        {'texto': 'Cachorro', 'pontuacao': 10},
        {'texto': 'Gato', 'pontuacao': 2},
        {'texto': 'Macaco', 'pontuacao': 5}
      ]
    },
    {
      'texto': 'Qual é a sua comida favorita',
      'respostas': [
        {'texto': 'Hamburguer', 'pontuacao': 10},
        {'texto': 'Pizza', 'pontuacao': 8},
        {'texto': 'Macarronada', 'pontuacao': 5},
        {'texto': 'Pastel', 'pontuacao': 1}
      ]
    }
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarFormulario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    // List<Widget> widgets = respostas.map((e) => Resposta(e, _responder)).toList();

    // for(String textoResp in respostas) {
    //   widgets.add(Resposta(textoResp, _responder));
    // }

    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text("Perguntas"),
            ),
            body: temPerguntaSelecionada
                ? Questionario(
                    perguntaSelecionada: _perguntaSelecionada,
                    perguntas: _perguntas,
                    responder: _responder,
                  )
                : Resultado(_pontuacaoTotal, _reiniciarFormulario)));
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  _PerguntaAppState createState() => _PerguntaAppState();
}
