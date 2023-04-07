import 'package:flutter/material.dart';
import 'package:input_history_text_field/input_history_text_field.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    this.onChanged,
    this.controller,
    this.inputHistoryController,
    this.onClear,
    this.hintText,
  });

  final ValueSetter<String>? onChanged;
  final TextEditingController? controller;
  final InputHistoryController? inputHistoryController;
  final VoidCallback? onClear;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return InputHistoryTextField(
      historyKey: '01',
      onChanged: onChanged,
      textEditingController: controller,
      inputHistoryController: inputHistoryController,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 18,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(4),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        hintText: hintText,
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.black,
          size: 30,
        ),
        suffixIcon: InkWell(
          onTap: onClear,
          child: const Icon(
            Icons.cancel_outlined,
            color: Colors.black,
            size: 30,
          ),
        ),
      ),
    );
  }
}
