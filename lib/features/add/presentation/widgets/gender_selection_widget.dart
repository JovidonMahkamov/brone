import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenderSelection extends StatefulWidget {
  const GenderSelection({super.key});

  @override
  State<GenderSelection> createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  String? selectGender;
  bool isColor = true;
  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    isColor =! isColor;
    if(selectGender == isColor){
      isColor = true;
    }else{
      isColor = false;
    }
  }


  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      icon: Icon(Icons.keyboard_arrow_down , color: isColor? Colors.grey[400] : Colors.black),
      hint: Text('Xizmat turini tanlang',style: TextStyle(color: Colors.grey[400],fontWeight: FontWeight.w400),),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
        fillColor:  Colors.grey[200],
      ),
      items: ['soch olish', 'mehmonxona', 'boshqalar'].map((String gender) {
        return DropdownMenuItem(
          value: gender,
          child: Text(
            gender,
            style:  TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          selectGender = value;
        });
      },
    );
  }
}
