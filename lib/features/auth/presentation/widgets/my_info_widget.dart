import 'package:flutter/material.dart';

class CustomInputField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final bool initiallyReadOnly;

  const CustomInputField({
    super.key,
    required this.label,
    required this.controller,
    this.initiallyReadOnly = false,
  });

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  final FocusNode _focusNode = FocusNode();
  late bool isReadOnly;

  @override
  void initState() {
    super.initState();
    isReadOnly = widget.initiallyReadOnly;
    _focusNode.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    bool isFocused = _focusNode.hasFocus;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label,
            style: TextStyle(color: Colors.grey.shade700, fontSize: 15)),
        const SizedBox(height: 6),

        GestureDetector(
          onTap: () {
            // readonly bo'lsa -> bosilganda editable bo'ladi
            if (isReadOnly) {
              setState(() => isReadOnly = false);
              _focusNode.requestFocus();
            }
          },
          child: AbsorbPointer(
            absorbing: isReadOnly, // bosilganda tahrir bloklanadi
            child: TextField(
              controller: widget.controller,
              focusNode: _focusNode,
              readOnly: isReadOnly,
              decoration: InputDecoration(
                filled: true,
                fillColor: isFocused ? Colors.white : const Color(0xffF3F6FA),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: isFocused
                      ? const BorderSide(color: Colors.blue, width: 2)
                      : BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.blue, width: 2),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
