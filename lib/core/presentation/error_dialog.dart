import 'package:flutter/material.dart';
import 'package:todo/core/constants/lang_keys.dart';

class ErrorDialog extends StatelessWidget {
  final String errorMessage;

  const ErrorDialog({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(LangKeys.ERROR),
      content: Text(errorMessage),
      actions: [
        TextButton(
          child: const Text(LangKeys.CLOSE),
          onPressed: () => Navigator.of(context).pop(),
        )
      ],
    );
  }
}
