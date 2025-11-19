import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldWidget2 extends StatefulWidget {
  final bool isOn;
  const TextFieldWidget2({super.key, required this.isOn});

  @override
  State<TextFieldWidget2> createState() => _TextFieldWidget2State();
}

class _TextFieldWidget2State extends State<TextFieldWidget2> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 180.w,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            enabled: !widget.isOn,
            readOnly: widget.isOn,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: '9 : 00',
              hintStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.grey.shade400,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.blue, width: 1.5),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ),
      ],);
  }
}
