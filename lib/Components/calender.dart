import 'package:farooqtrading/Components/appcolor.dart';
import 'package:flutter/material.dart';

class CalendarTextField extends StatefulWidget {
  final String hint;
  final double? width;

  const CalendarTextField({super.key, required this.hint, this.width});

  @override
  State<CalendarTextField> createState() => _CalendarTextFieldState();
}

class _CalendarTextFieldState extends State<CalendarTextField> {
  final TextEditingController _controller = TextEditingController();

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // default today
      firstDate: DateTime(2000), // earliest date
      lastDate: DateTime(2100), // latest date
    );

    if (picked != null) {
      setState(() {
        _controller.text =
            "${picked.day}-${picked.month}-${picked.year}"; // formatted date
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? MediaQuery.of(context).size.width * 0.125,
      height: MediaQuery.of(context).size.height * 0.065,
      child: TextField(
        controller: _controller,
        readOnly: true, // prevent manual typing
        decoration: InputDecoration(
          hintText: widget.hint,
          suffixIcon: Icon(
            Icons.calendar_today,
            color: AppColor.primary,
            size: 16,
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          filled: true,
          fillColor: Colors.white,
        ),
        onTap: () => _pickDate(context),
      ),
    );
  }
}
