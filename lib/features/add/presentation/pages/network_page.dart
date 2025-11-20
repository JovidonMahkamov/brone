import 'package:brone/core/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/elevated_button_widget.dart';
import '../widgets/text_field_widget.dart';

class NetworkPage extends StatefulWidget {
  const NetworkPage({super.key});

  @override
  State<NetworkPage> createState() => _NetworkPageState();
}

class _NetworkPageState extends State<NetworkPage> {
  int currentStep = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsGeometry.all(20.sp),
            child: Column(
              children: [
                SizedBox(height: 10.h),
                Text(
                  'Ijtimoiy tarmoqlar',
                  style: TextStyle(
                    fontSize: 23.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(6, (index) {
                    bool isCompleted = index < currentStep;
                    bool isCurrent = index == currentStep;
                    return Row(
                      children: [
                        Container(
                          width: 25.w,
                          height: 25.h,
                          decoration: BoxDecoration(
                            color: isCompleted
                                ? Colors.indigo
                                : (isCurrent ? Colors.white : Colors.white),
                            border: Border.all(
                              color: isCompleted
                                  ? Colors.indigo
                                  : (isCurrent
                                  ? Colors.indigo
                                  : Colors.grey.shade400),
                              width: 1,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: isCompleted
                                ? const Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 16,
                            )
                                : (isCurrent
                                ? Container(
                              width: 8.w,
                              height: 8.h,
                              decoration: const BoxDecoration(
                                color: Colors.indigo,
                                shape: BoxShape.circle,
                              ),
                            )
                                : null),
                          ),
                        ),
                        // Step line
                        if (index != 5)
                          Container(
                            width: 40.w,
                            height: 2.h,
                            color: index < currentStep
                                ? Colors.indigo
                                : Colors.grey.shade400,
                          ),
                      ],
                    );
                  }),
                ),
                SizedBox(height: 40.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Telegram',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextFiledWidget1(
                      text: 't.me/',
                      obscureText: false,
                    ),
                    SizedBox(height: 20.h),
                    SizedBox(height: 20.h),
                    Text(
                      'Instagram',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextFiledWidget1(
                      text: "https://instagram.com/",
                      obscureText: false,
                    ),
                    SizedBox(height: 20.h),

                    SizedBox(height: 50.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedWidget(
                          onPressed: () {
                            if (currentStep < 6) currentStep++;
                            Navigator.pushNamed(context, RouteNames.map);
                          },
                          text: 'Davom etish',
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
