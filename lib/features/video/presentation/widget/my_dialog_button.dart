import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyDialogButton extends StatefulWidget {
  final IconData? icons;
  final String text;
  final Color? backgroundColor;
  final double? withSize;
  final VoidCallback onPressed;
  const MyDialogButton({super.key, this.withSize, required this.onPressed, required this.text, this.icons, this.backgroundColor});

  @override
  State<MyDialogButton> createState() => _MyDialogButtonState();
}

class _MyDialogButtonState extends State<MyDialogButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.withSize,
      height: 47.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: widget.onPressed,
        child: Center(
          child: Row(
            children: [
              Icon(widget.icons, color: Color(0xff22348A)),
              SizedBox(width: 10.w),
              Text(
                widget.text,
                style:  TextStyle(color: Color(0xff22348A,),fontSize: 15.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
