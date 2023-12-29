import 'package:flutter/material.dart';

class HomeMeetingButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;
  const HomeMeetingButton({super.key, required this.onPressed, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.black.withOpacity(0.06),
                  offset: const Offset(0, 4)
                )
              ]
            ),
            width: 60,
            height: 60,
            child: Icon(icon, color: Theme.of(context).colorScheme.secondary, size: 30),
          ),
          const SizedBox(height: 10),
          Text(text, style: TextStyle(color: Theme.of(context).colorScheme.secondary))
        ],
      ),
    );
  }
}
