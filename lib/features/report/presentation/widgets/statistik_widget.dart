import 'package:flutter/material.dart';

class StatistikWidget extends StatefulWidget {
  const StatistikWidget({super.key});

  @override
  State<StatistikWidget> createState() => _StatistikWidgetState();
}

class _StatistikWidgetState extends State<StatistikWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(right: 5),
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/report/ajibuji.png'), 
          fit: BoxFit.contain,
          alignment: Alignment.centerRight,

        ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
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
                  'Umumiy daromad',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 20),
                Text(
                  '6,165,000 so’m',
                  style: TextStyle(
                    color: Color(0xff22348A),
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
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
