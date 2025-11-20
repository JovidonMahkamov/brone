import 'package:brone/features/Add/presentation/widgets/text_field_widget2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../bottom_nav_bar.dart';
import '../widgets/elevated_button_widget.dart';
import '../widgets/toggle_widget.dart';

class SavePage extends StatefulWidget {
  const SavePage({super.key});

  @override
  State<SavePage> createState() => _SavePageState();
}

class _SavePageState extends State<SavePage> {
  int currentStep = 5;

  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsetsGeometry.all(20.sp),
            child: Column(
              children: [
                SizedBox(height: 10.h),
                Text(
                  'Ish Kunlari',
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
                PreferredSize(
                  preferredSize: const Size.fromHeight(70),
                  child: TabBar(
                    tabAlignment: TabAlignment.center,
                    dividerColor: Colors.transparent,
                    isScrollable: true,
                    labelColor: Color(0xff22348A),
                    unselectedLabelColor: Color(0xffB8BFE1),
                    labelStyle: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    tabs: const [
                      Tab(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 6),
                          child: Text("Du"),
                        ),
                      ),
                      Tab(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 6),
                          child: Text("Se"),
                        ),
                      ),
                      Tab(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 6),
                          child: Text("Chor"),
                        ),
                      ),
                      Tab(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 6),
                          child: Text("Pay"),
                        ),
                      ),
                      Tab(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 6),
                          child: Text("Jum"),
                        ),
                      ),
                      Tab(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 6),
                          child: Text("Shan"),
                        ),
                      ),
                      Tab(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 6),
                          child: Text("Yak"),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ToggleWidget(
                              isOn: isOn,
                              isOff: (v) {
                                setState(() {
                                  isOn = v;
                                });
                              },
                            ),
                            SizedBox(height: 25.h),
                            Text(
                              'Ish vaqti',
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Row(
                              children: [
                                TextFieldWidget2(isOn: isOn),
                                Expanded(child: SizedBox()),
                                TextFieldWidget2(isOn: isOn),
                              ],
                            ),
                            SizedBox(height: 25.h),
                            Text(
                              'Tushlik vaqti',
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Row(
                              children: [
                                TextFieldWidget2(isOn: isOn),
                                Expanded(child: SizedBox()),
                                TextFieldWidget2(isOn: isOn),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ToggleWidget(
                              isOn: isOn,
                              isOff: (v) {
                                setState(() {
                                  isOn = v;
                                });
                              },
                            ),
                            SizedBox(height: 25.h),
                            Text(
                              'Ish vaqti',
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Row(
                              children: [
                                TextFieldWidget2(isOn: isOn),
                                Expanded(child: SizedBox()),
                                TextFieldWidget2(isOn: isOn),
                              ],
                            ),
                            SizedBox(height: 25.h),
                            Text(
                              'Tushlik vaqti',
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Row(
                              children: [
                                TextFieldWidget2(isOn: isOn),
                                Expanded(child: SizedBox()),
                                TextFieldWidget2(isOn: isOn),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ToggleWidget(
                              isOn: isOn,
                              isOff: (v) {
                                setState(() {
                                  isOn = v;
                                });
                              },
                            ),
                            SizedBox(height: 25.h),
                            Text(
                              'Ish vaqti',
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Row(
                              children: [
                                TextFieldWidget2(isOn: isOn),
                                Expanded(child: SizedBox()),
                                TextFieldWidget2(isOn: isOn),
                              ],
                            ),
                            SizedBox(height: 25.h),
                            Text(
                              'Tushlik vaqti',
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Row(
                              children: [
                                TextFieldWidget2(isOn: isOn),
                                Expanded(child: SizedBox()),
                                TextFieldWidget2(isOn: isOn),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ToggleWidget(
                              isOn: isOn,
                              isOff: (v) {
                                setState(() {
                                  isOn = v;
                                });
                              },
                            ),
                            SizedBox(height: 25.h),
                            Text(
                              'Ish vaqti',
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Row(
                              children: [
                                TextFieldWidget2(isOn: isOn),
                                Expanded(child: SizedBox()),
                                TextFieldWidget2(isOn: isOn),
                              ],
                            ),
                            SizedBox(height: 25.h),
                            Text(
                              'Tushlik vaqti',
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Row(
                              children: [
                                TextFieldWidget2(isOn: isOn),
                                Expanded(child: SizedBox()),
                                TextFieldWidget2(isOn: isOn),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ToggleWidget(
                              isOn: isOn,
                              isOff: (v) {
                                setState(() {
                                  isOn = v;
                                });
                              },
                            ),
                            SizedBox(height: 25.h),
                            Text(
                              'Ish vaqti',
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Row(
                              children: [
                                TextFieldWidget2(isOn: isOn),
                                Expanded(child: SizedBox()),
                                TextFieldWidget2(isOn: isOn),
                              ],
                            ),
                            SizedBox(height: 25.h),
                            Text(
                              'Tushlik vaqti',
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Row(
                              children: [
                                TextFieldWidget2(isOn: isOn),
                                Expanded(child: SizedBox()),
                                TextFieldWidget2(isOn: isOn),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ToggleWidget(
                              isOn: isOn,
                              isOff: (v) {
                                setState(() {
                                  isOn = v;
                                });
                              },
                            ),
                            SizedBox(height: 25.h),
                            Text(
                              'Ish vaqti',
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Row(
                              children: [
                                TextFieldWidget2(isOn: isOn),
                                Expanded(child: SizedBox()),
                                TextFieldWidget2(isOn: isOn),
                              ],
                            ),
                            SizedBox(height: 25.h),
                            Text(
                              'Tushlik vaqti',
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Row(
                              children: [
                                TextFieldWidget2(isOn: isOn),
                                Expanded(child: SizedBox()),
                                TextFieldWidget2(isOn: isOn),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ToggleWidget(
                              isOn: isOn,
                              isOff: (v) {
                                setState(() {
                                  isOn = v;
                                });
                              },
                            ),
                            SizedBox(height: 25.h),
                            Text(
                              'Ish vaqti',
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Row(
                              children: [
                                TextFieldWidget2(isOn: isOn),
                                Expanded(child: SizedBox()),
                                TextFieldWidget2(isOn: isOn),
                              ],
                            ),
                            SizedBox(height: 25.h),
                            Text(
                              'Tushlik vaqti',
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Row(
                              children: [
                                TextFieldWidget2(isOn: isOn),
                                Expanded(child: SizedBox()),
                                TextFieldWidget2(isOn: isOn),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedWidget(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BottomNavBarPage(initialIndex: 2),
                      ),
                    );
                  },
                  text: 'Xizmatlarni saqlash',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
