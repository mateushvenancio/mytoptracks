import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class YesNoDialog extends StatelessWidget {
  final String title;
  final Function() onYes;
  final Function()? onNo;

  const YesNoDialog({
    super.key,
    required this.title,
    required this.onYes,
    this.onNo,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      actions: [
        TextButton(
          onPressed: () {
            context.pop();
            onYes();
          },
          child: Text('SIM'),
        ),
        TextButton(
          onPressed: () {
            onNo?.call() ?? context.pop();
          },
          child: Text('NÃO'),
        ),
      ],
    );
  }
}
