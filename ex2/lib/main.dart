import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ButtonsApp(),
  ));
}

// Enum for Button Types & Colors
enum ButtonType {
  primary(Colors.blue),
  secondary(Colors.green),
  disabled(Colors.grey);

  final Color color;
  const ButtonType(this.color);
}

// Enum for Icon Position
enum IconPosition {
  left,
  right,
}

// Reusable Stateless Widget
class CustomButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final IconPosition iconPosition;
  final ButtonType buttonType;

  const CustomButton({
    super.key,
    required this.label,
    required this.icon,
    this.iconPosition = IconPosition.left,
    this.buttonType = ButtonType.primary,
  });

  @override
  Widget build(BuildContext context) {
    final iconWidget = Icon(icon, color: Colors.white, size: 22);
    final textWidget = Text(
      label,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    );

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: buttonType.color,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: iconPosition == IconPosition.left
              ? [
                  iconWidget,
                  const SizedBox(width: 10),
                  textWidget,
                ]
              : [
                  textWidget,
                  const SizedBox(width: 10),
                  iconWidget,
                ],
        ),
      ),
    );
  }
}
//Part 2
// Main Screen
class ButtonsApp extends StatelessWidget {
  const ButtonsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom buttons'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomButton(
              label: 'Submit',
              icon: Icons.check,
              buttonType: ButtonType.primary,
              iconPosition: IconPosition.left,
            ),
            CustomButton(
              label: 'Time',
              icon: Icons.access_time,
              buttonType: ButtonType.secondary,
              iconPosition: IconPosition.right,
            ),
            CustomButton(
              label: 'Account',
              icon: Icons.account_circle,
              buttonType: ButtonType.disabled,
              iconPosition: IconPosition.right,
            ),
          ],
        ),
      ),
    );
  }
}