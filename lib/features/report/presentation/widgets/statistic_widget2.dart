import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatistikWidget2 extends StatefulWidget {
  final String  text;
  final String  text1;
  final String  text2;
   StatistikWidget2({super.key,required this.text, required this.text1, required this.text2});

  @override
  State<StatistikWidget2> createState() => _StatistikWidget2State();
}

class _StatistikWidget2State extends State<StatistikWidget2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(right: 5),
      height: 150.h,
      width: double.infinity,
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/report/ajibuji.png'),
          fit: BoxFit.contain,
          alignment: Alignment.centerRight,

        ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color(0xffDEE3FB), width: 1),
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 5),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsGeometry.only(left: 10, top: 10, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.text,
                  style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 20.h),
                Text(
                  widget.text1,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15.sp,
                  ),
                ),
                SizedBox(height: 5.h,),
                Text(
                  widget.text2,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
