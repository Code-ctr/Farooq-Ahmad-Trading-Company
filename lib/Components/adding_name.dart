import 'package:farooqtrading/Components/appcolor.dart';
import 'package:farooqtrading/Components/desktoplayout.dart';
import 'package:farooqtrading/Components/mybutton.dart';
import 'package:farooqtrading/Components/mytextfield.dart';
import 'package:farooqtrading/Components/table.dart';
import 'package:flutter/material.dart';

class AddingName extends StatelessWidget {
  final name = TextEditingController();
  final contact = TextEditingController();
  final address = TextEditingController();
  final String hint;
  final VoidCallback? onBack;
  AddingName({super.key, required this.hint, this.onBack});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: DesktopLayout(
        title: 'Adding New $hint',
        child: Align(
          alignment: Alignment.topLeft,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Mybutton(
                        onTap: () {
                          onBack!();
                        },
                        icon: Icons.arrow_back,
                        text: "",
                        color: Colors.transparent,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Text(
                          "Add New $hint",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Mytextfield(
                          controller: name,
                          hinttext: "Name",
                          width: MediaQuery.of(context).size.width * 0.23,
                        ),
                        Mytextfield(
                          controller: contact,
                          hinttext: "Contact",
                          width: MediaQuery.of(context).size.width * 0.23,
                        ),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Mytextfield(
                      controller: address,
                      hinttext: "Address",
                      width: MediaQuery.of(context).size.width * 0.46,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Mybutton(
                      onTap: () {},
                      text: "Add",
                      width: MediaQuery.of(context).size.width * 0.25,
                      color: AppColor.info,
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: SingleChildScrollView(child: CustomerTable(data: [])),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
