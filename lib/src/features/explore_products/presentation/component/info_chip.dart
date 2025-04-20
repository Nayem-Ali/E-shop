import 'package:flutter/material.dart';

class InfoChip extends StatelessWidget {
  final String label;
  final String value;

  const InfoChip({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text("$label: $value"),
      backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
    );
  }
}
