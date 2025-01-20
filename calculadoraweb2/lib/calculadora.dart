import 'package:expressions/expressions.dart';
import 'package:flutter/material.dart';

class Calculadora extends StatefulWidget {
  const Calculadora({super.key});

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  final String _botaoLimpar = 'Limpar';
  String _inputAtual = '';
  String _resultadoFinal = '';

  void _manipularEntrada(String valor) {
    setState(() {
      if (valor == _botaoLimpar) {
        _inputAtual = '';
        _resultadoFinal = '';
      } else if (valor == '=') {
        _calcular();
      } else {
        _inputAtual += valor;
      }
    });
  }

  void _calcular() {
    try {
      _resultadoFinal = _processarExpressao(_inputAtual).toString();
    } catch (e) {
      _resultadoFinal = 'Erro de cálculo';
    }
  }

  double _processarExpressao(String expressao) {
    expressao = expressao.replaceAll('x', '*');
    expressao = expressao.replaceAll('÷', '/');
    ExpressionEvaluator avaliador = const ExpressionEvaluator();
    return avaliador.eval(Expression.parse(expressao), {});
  }

  Widget _criarBotao(String valor) {
    return TextButton(
      onPressed: () => _manipularEntrada(valor),
      child: Text(
        valor,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Text(
            _inputAtual,
            style: const TextStyle(fontSize: 22),
          ),
        ),
        Expanded(
          child: Text(
            _resultadoFinal,
            style: const TextStyle(fontSize: 22),
          ),
        ),
        Expanded(
          flex: 3,
          child: GridView.count(
            crossAxisCount: 4,
            childAspectRatio: 2.2,
            children: [
              _criarBotao('7'),
              _criarBotao('8'),
              _criarBotao('9'),
              _criarBotao('÷'),
              _criarBotao('4'),
              _criarBotao('5'),
              _criarBotao('6'),
              _criarBotao('x'),
              _criarBotao('1'),
              _criarBotao('2'),
              _criarBotao('3'),
              _criarBotao('-'),
              _criarBotao('0'),
              _criarBotao('.'),
              _criarBotao('='),
              _criarBotao('+'),
            ],
          ),
        ),
        Expanded(
          child: _criarBotao(_botaoLimpar),
        ),
      ],
    );
  }
}
