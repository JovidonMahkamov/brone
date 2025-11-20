import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ElevatedWidget extends StatelessWidget {
  final double? size;
  final VoidCallback onPressed;
  final String text;
  const ElevatedWidget({super.key, required this.onPressed,required this.text, this.size});
  @override
  Widget build (BuildContext context) {
    return SizedBox(
      width: size,
      height: 47.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: Color(0xff22348A),
        ),
        onPressed:onPressed,
        child:  Center(
          child: Text(
            text,
            style: const TextStyle (color: Colors.white),
          ),
        ),
      ),
    );
  }

}