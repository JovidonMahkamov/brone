import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InformationWidget extends StatefulWidget {
  const InformationWidget({super.key});

  @override
  State<InformationWidget> createState() => _InformationWidgetState();
}

class _InformationWidgetState extends State<InformationWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 130.w,
          height: 130.h,
          child: Image.asset('assets/add/Barber.png'),
        ),
        SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Xizmat turi yoziladi',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
              ),
              Text(
                'Xizmat tasnifi haqida batafsil ...',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
              ),
              Row(
                children: [
                  Icon(Icons.phone, color: Color(0xff656E9C)),
                  SizedBox(width: 10.w),
                  Text(
                    '+998 99 855 44 77',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff656E9C),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.location_on, color: Color(0xff656E9C)),
                  SizedBox(width: 10.w),
                  Text(
                    'Yunusobod mavzesi 12 daha',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff656E9C),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
