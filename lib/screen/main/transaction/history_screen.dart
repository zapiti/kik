import 'package:flutter/material.dart';
import 'package:kik/theme.dart';
import 'package:kik/widget/no_transaction_message.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: SingleChildScrollView(
          child: NoTranscationMessage(
            messageTitle: "Nenhum agendamento ainda",
            messageDesc:
                "Você nunca fez um pedido. Vamos explorar um servico para voce.",
          ),
        ),
      ),
    );
  }
}
