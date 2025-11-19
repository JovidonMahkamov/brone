import 'package:brone/core/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/information_widget.dart';

class GeneralAddPage extends StatefulWidget {
  const GeneralAddPage({super.key});

  @override
  State<GeneralAddPage> createState() => _GeneralAddPageState();
}

class _GeneralAddPageState extends State<GeneralAddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          "Xizmat qo'shish",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.sp),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, RouteNames.add);
            },
            icon: Icon(Icons.add, color: Color(0xff22348A)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.all(20),
          child: Column(
            children: [
              InformationWidget(),
              SizedBox(height: 30.h,),
              InformationWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
