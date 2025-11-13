import 'package:brone/features/report/presentation/widgets/statistic_widget2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/statistik_widget.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mijozlar qabuli bo’yicha\nstatistka',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.filter_list, color: Color(0xff22348A)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            StatistikWidget(),
            SizedBox(height: 20.h,),
            StatistikWidget2(
              text: 'Bugun',
              text1: 'Mijozlar: 53ta',
              text2: 'Daromad: 2,145,000 so’m',
            ),
            SizedBox(height: 20.h,),
            StatistikWidget2(
              text: 'Kecha',
              text1: 'Mijozlar: 53ta',
              text2: 'Daromad: 2,145,000 so’m',
            ),
            SizedBox(height: 20.h,),
            StatistikWidget2(
              text: 'Haftalik',
              text1: 'Mijozlar: 53ta',
              text2: 'Daromad: 2,145,000 so’m',
            ),
          ],
        ),
      ),
    );
  }
}
