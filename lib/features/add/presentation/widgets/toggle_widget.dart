import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ToggleWidget extends StatefulWidget {
    final bool isOn;
     void Function(bool)? isOff;
   ToggleWidget({super.key, required this.isOn, this.isOff});

  @override
  State<ToggleWidget> createState() => _ToggleWidgetState();
}

class _ToggleWidgetState extends State<ToggleWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Dam olish kuni',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        Switch(
          activeColor: Colors.white,
          activeTrackColor: Colors.indigo,
          inactiveThumbColor: Colors.white,
          inactiveTrackColor: Colors.grey.shade400,
          value: widget.isOn,
          onChanged: widget.isOff
        ),
      ],
    );
  }
}
