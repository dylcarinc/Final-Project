import 'package:flutter/material.dart';

typedef AuditCallback = Function(
    String value,
    String name,
    String address,
    int funds,
    TextEditingController textController);

  String valueText = "";

class AuditDialogState {
  // Dialog with text from https://www.appsdeveloperblog.com/alert-dialog-with-a-text-field-in-flutter/
  final TextEditingController _inputController = TextEditingController();
  final TextEditingController _breedController = TextEditingController();
}

// @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: const Text('School'),
//       content: Column(
//         children: [
//           TextField(
//             onChanged: (value) {
//               setState(() {
//                 valueText = value;
//               });
//             },
//             controller: _inputController,
//             decoration: const InputDecoration(hintText: "Dog Name:"),
//           ),