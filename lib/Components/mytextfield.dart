import 'package:farooqtrading/Components/appcolor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Mytextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hinttext;
  final double? width;
  final double? height;
  final bool? isNumeric;

  const Mytextfield({
    super.key,
    required this.controller,
    required this.hinttext,
    this.width,
    this.height,
    this.isNumeric = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Padding(
        padding: const EdgeInsets.all(1),
        child: TextFormField(
          controller: controller,
          autofocus: false,
          obscureText: false,
          style: const TextStyle(color: AppColor.textPrimary),
          keyboardType: isNumeric! ? TextInputType.number : TextInputType.text,
          inputFormatters:
              isNumeric!
                  ? [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))]
                  : [], // only allow numbers + decimal if isNumeric = true
          decoration: InputDecoration(
            focusColor: AppColor.info,
            hintText: hinttext,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ),
    );
  }
}
