import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyInformationPage extends StatefulWidget {
  const MyInformationPage({super.key});

  @override
  State<MyInformationPage> createState() => _MyInformationPageState();
}

class _MyInformationPageState extends State<MyInformationPage> {
  final nameController = TextEditingController(text: "Aziza");
  final surnameController = TextEditingController(text: "Alimova");

  final phoneCodeController = TextEditingController(text: "+998");
  final phoneController = TextEditingController(text: "(88) 556-44-15");

  String gender = "Ayol";
  DateTime birthdate = DateTime(1999, 12, 11);

  bool isEditingName = false;
  bool isEditingSurname = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: SvgPicture.asset("assets/profile/go_back.svg")),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            // ----------------- AVATAR SECTION -----------------
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(color: Colors.white, width: 3),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 8,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: const CircleAvatar(
                radius: 48,
                backgroundImage: NetworkImage(
                  "https://i.pravatar.cc/300",
                ),
              ),
            ),

            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFE3E9FF),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Rasm yuklash",
                      style: TextStyle(
                        color: Color(0xFF3A4C9A),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFE5E5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Rasmni o‘chirish",
                      style: TextStyle(
                        color: Color(0xFFDD3C3C),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 35),

            // ----------------- NAME -----------------
            CustomEditableField(
              label: "Ism",
              controller: nameController,
              isEditing: isEditingName,
              onTap: () => setState(() => isEditingName = true),
              onSubmit: () => setState(() => isEditingName = false),
            ),

            const SizedBox(height: 20),

            // ----------------- SURNAME -----------------
            CustomEditableField(
              label: "Familiya",
              controller: surnameController,
              isEditing: isEditingSurname,
              onTap: () => setState(() => isEditingSurname = true),
              onSubmit: () => setState(() => isEditingSurname = false),
            ),

            const SizedBox(height: 20),

            // ----------------- GENDER + BIRTHDATE -----------------
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Jinsi",
                          style: TextStyle(
                              color: Colors.grey.shade700, fontSize: 15)),
                      const SizedBox(height: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: const Color(0xffF3F6FA),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: gender,
                            items: const [
                              DropdownMenuItem(
                                  value: "Ayol", child: Text("Ayol")),
                              DropdownMenuItem(
                                  value: "Erkak", child: Text("Erkak")),
                            ],
                            onChanged: (v) =>
                                setState(() => gender = v ?? "Ayol"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Tug‘ilgan sanasi",
                          style: TextStyle(
                              color: Colors.grey.shade700, fontSize: 15)),
                      const SizedBox(height: 6),
                      GestureDetector(
                        onTap: pickDate,
                        child: Container(
                          height: 48,
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            color: const Color(0xffF3F6FA),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            "${birthdate.day.toString().padLeft(2, "0")}/"
                                "${birthdate.month.toString().padLeft(2, "0")}/"
                                "${birthdate.year}",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            // ----------------- PHONE -----------------
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Raqamni o‘zgartirish",
                  style: TextStyle(color: Colors.grey.shade700, fontSize: 15)),
            ),
            const SizedBox(height: 6),

            Row(
              children: [
                SizedBox(
                  width: 90,
                  child: TextField(
                    controller: phoneCodeController,
                    decoration: _grayFieldDecoration(),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: phoneController,
                    decoration: _grayFieldDecoration(),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff2338C1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () {},
                child: const Text(
                  "O‘zgarishlarni saqlash",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  InputDecoration _grayFieldDecoration() {
    return InputDecoration(
      filled: true,
      fillColor: const Color(0xffF3F6FA),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
    );
  }

  Future<void> pickDate() async {
    final newDate = await showDatePicker(
      context: context,
      initialDate: birthdate,
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );

    if (newDate != null) {
      setState(() => birthdate = newDate);
    }
  }
}

// --------------------------------------------------------
// CUSTOM EDITABLE FIELD
// --------------------------------------------------------
class CustomEditableField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool isEditing;
  final VoidCallback onTap;
  final VoidCallback onSubmit;

  const CustomEditableField({
    super.key,
    required this.label,
    required this.controller,
    required this.isEditing,
    required this.onTap,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    final hasValue = controller.text.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(color: Colors.grey.shade700, fontSize: 15)),
        const SizedBox(height: 6),
        GestureDetector(
          onTap: onTap,
          child: AbsorbPointer(
            absorbing: !isEditing,
            child: TextField(
              controller: controller,
              onSubmitted: (_) => onSubmit(),
              decoration: InputDecoration(
                filled: true,
                fillColor: isEditing
                    ? Colors.white
                    : const Color(0xffF3F6FA),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: isEditing
                        ? Colors.blue
                        : Colors.transparent,
                    width: 1.5,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
