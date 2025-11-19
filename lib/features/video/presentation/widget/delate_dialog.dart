import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DelateDialog extends StatefulWidget {
  final Color? textColor;
  final IconData? icons;
  final String text;
  final Color? backgroundColor;
  final double? withSize;
  final VoidCallback onPressed;

  const DelateDialog({
    super.key,
    this.withSize,
    required this.onPressed,
    required this.text,
    this.icons,
    this.backgroundColor, this.textColor,
  });

  @override
  State<DelateDialog> createState() => _DelateDialogState();
}

class _DelateDialogState extends State<DelateDialog> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.withSize,
      height: 47.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: widget.backgroundColor,
        ),
        onPressed: widget.onPressed,
        child: Center(
          child: Row(
            children: [
              Text(widget.text, style: TextStyle(color: widget.textColor)),
            ],
          ),
        ),
      ),
    );
  }
}
