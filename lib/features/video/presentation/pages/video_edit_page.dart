import 'package:brone/core/routes/route_names.dart';
import 'package:brone/features/video/presentation/widget/delate_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../bottom_nav_bar.dart';
import '../widget/my_dialog_button.dart';

class VideoEditPage extends StatefulWidget {
  const VideoEditPage({super.key});

  @override
  State<VideoEditPage> createState() => _VideoEditPageState();
}

class _VideoEditPageState extends State<VideoEditPage> {
  bool editMode = false;
  List<bool> selected = List.generate(12, (index) => false);

  @override
  Widget build(BuildContext context) {
    int selectedCount = selected.where((e) => e).length;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => BottomNavBarPage(initialIndex: 3),
                ),
              );
            },
            icon: Icon(Icons.arrow_back_ios_new_outlined),
          ),
          title: editMode
              ? Text('Tanlangan: $selectedCount')
              : const Text('Reels up'),
          actions: [
            if (!editMode) ...[
              IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
              IconButton(
                onPressed: () {
                  showSuccessDialog(
                    context: context,
                    title: 'Post turini tanlang',
                    buttons: [
                      MyDialogButton(
                        text: "Xizmatlar bo'yicha videolar",
                        icons: Icons.work_outline,
                        onPressed: () {
                          Navigator.pushNamed(context, RouteNames.addVideo);
                        },
                        backgroundColor: Color(0xffdcedfb),
                      ),
                      SizedBox(height: 15.h),
                      MyDialogButton(
                        text: "Mahsulotlar bo'yicha videolar",
                        icons: Icons.work_outline,
                        onPressed: () {},
                        backgroundColor: Color(0xffdcedfb),
                      ),
                    ],
                  );
                },
                icon: const Icon(Icons.add),
              ),
            ] else ...[
              SizedBox(
                height: 47.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Color(0xff22348A),
                  ),
                  onPressed: selectedCount > 0
                      ? () {
                          showSuccessDialog(
                            context: context,
                            title: 'Haqiqatdan ushbu postni\n  o’chirmoqchimisiz',
                            buttons: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  DelateDialog(
                                    text: 'Bekor qilish',
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    backgroundColor: Color(0xffdcedfb),
                                  ),
                                  DelateDialog(
                                    backgroundColor: Color(0xfffbd4d4),
                                    text: "O'chirish",
                                    textColor: Colors.red,
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ],
                          );
                        }
                      : null,
                  child: Center(
                    child: Text(
                      "O'chirish",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
            SizedBox(width: 10.w),
          ],
        ),
        body: Column(
          children: [
            if (!editMode)
              TextButton(
                onPressed: () {
                  setState(() {
                    editMode = true;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.edit, color: Color(0xff22348A)),
                    Text(
                      "Tahrirlash",
                      style: TextStyle(color: Color(0xff22348A)),
                    ),
                  ],
                ),
              ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(8),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                ),
                itemCount: selected.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      if (editMode) {
                        setState(() {
                          selected[index] = !selected[index];
                          if (selected.where((e) => e).isEmpty) {
                            editMode = false;
                          }
                        });
                      }
                    },
                    child: Stack(
                      children: [
                        Container(
                          color: Colors.grey[300],
                          child: const Center(child: Icon(Icons.play_arrow)),
                        ),
                        if (editMode)
                          Positioned(
                            top: 4,
                            right: 4,
                            child: Checkbox(
                              value: selected[index],
                              onChanged: (value) {
                                setState(() {
                                  selected[index] = value!;
                                  if (selected.where((e) => e).isEmpty) {
                                    editMode = false;
                                  }
                                });
                              },
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void showSuccessDialog({
  required BuildContext context,
  required String title,
  required List<Widget> buttons,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back),
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 18.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              Column(children: buttons),
            ],
          ),
        ),
      );
    },
  );
}
