import 'package:flutter/material.dart';

class ShowDialogz extends StatelessWidget {
  const ShowDialogz({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Example"),
      content: Text("data"),
      actions: [
        FloatingActionButton(child: Text("YES"), onPressed: () {}),
        FloatingActionButton(child: Text("NO"), onPressed: () {}),
      ],
    );
  }
}
