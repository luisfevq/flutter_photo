import 'package:flutter/material.dart';

class OmniProDialog {
  OmniProDialog._();

  static customDialog({
    required BuildContext context,
    required String title,
    required String message,
    bool barrerDismissible = false,
    bool showSecondaryButton = false,
    String primaryButton = "Aceptar",
    VoidCallback? primaryButtonTap,
    String secondaryButton = "Cerrar",
    VoidCallback? secondaryButtonTap,
  }) {
    _showDialog(
      context: context,
      dialog: _Dialog(
        title: title,
        message: message,
        primaryButtonText: primaryButton,
        primaryButtonTap: primaryButtonTap,
        secondaryButtonText: secondaryButton,
        secondaryButtonTap: secondaryButtonTap,
        showSecondaryButton: showSecondaryButton,
      ),
      barrierDismissible: barrerDismissible,
    );
  }

  static void _showDialog({
    required BuildContext context,
    required Widget dialog,
    required bool barrierDismissible,
  }) {
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) => dialog,
    );
  }
}

class _Dialog extends StatelessWidget {
  const _Dialog({
    required this.title,
    required this.message,
    this.showSecondaryButton = false,
    this.primaryButtonText = 'Aceptar',
    this.primaryButtonTap,
    this.secondaryButtonText = 'Cerrar',
    this.secondaryButtonTap,
  });

  final String title;
  final String message;
  final String primaryButtonText;
  final String secondaryButtonText;
  final VoidCallback? primaryButtonTap;
  final VoidCallback? secondaryButtonTap;
  final bool showSecondaryButton;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(
        message,
        textAlign: TextAlign.center,
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: [
            showSecondaryButton
                ? TextButton(
                    onPressed:
                        secondaryButtonTap ?? () => Navigator.of(context).pop(),
                    child: Text(secondaryButtonText),
                  )
                : const SizedBox.shrink(),
            TextButton(
              onPressed: primaryButtonTap ?? () => Navigator.of(context).pop(),
              child: Text(primaryButtonText),
            ),
          ],
        )
      ],
    );
  }
}
