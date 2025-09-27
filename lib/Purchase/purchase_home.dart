import 'package:farooqtrading/Components/appcolor.dart';
import 'package:farooqtrading/Components/desktoplayout.dart';
import 'package:farooqtrading/Components/drop.dart';
import 'package:farooqtrading/Components/flippage.dart';
import 'package:farooqtrading/Components/lottable.dart';
import 'package:farooqtrading/Components/mybutton.dart';
import 'package:farooqtrading/Components/mytextfield.dart';
import 'package:farooqtrading/Purchase/processing.dart';
import 'package:flutter/material.dart';

class PurchaseHome extends StatefulWidget {
  const PurchaseHome({super.key});

  @override
  State<PurchaseHome> createState() => _PurchaseHomeState();
}

class _PurchaseHomeState extends State<PurchaseHome> {
  final quantity = TextEditingController();
  final amount = TextEditingController();

  /// Example rows (later you will load from DB)
  List<Map<String, dynamic>> rows = [
    {
      "lotId": "L001",
      "sellerName": "Syed Habib Ur Rehman",
      "purchaseDate": "2025-09-10",
      "amount": 1200,
      "quantity": 20,
      "received": "No",
    },
    {
      "lotId": "L002",
      "sellerName":
          "Xyzajnsdsdknsfindfkjnkfnnlfkjndlfndfekwemwlmewlme'lwme'lwmelmwe'lmw'elmwle",
      "purchaseDate": "2025-09-08",
      "amount": 1500,
      "quantity": 15,
      "received": "Yes",
    },
  ];

  // Delete row
  void onDelete(int index) {
    setState(() {
      rows.removeAt(index);
    });
  }

  // Process row
  void onProcess(int index) {
    Navigator.push(context, FlipPageRoute(page: Processing()));
  }

  @override
  Widget build(BuildContext context) {
    return DesktopLayout(
      title: "Purchasing Panel",
      child: Align(
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Top Form
            Container(
              height: MediaQuery.of(context).size.height * 0.33,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 30.0,
                      ),
                      child: Text(
                        "Add An New Lot",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Drop(
                    hinttext: "Select Seller",
                    items: ["X", "Y"],
                    width: MediaQuery.of(context).size.width * 0.5,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Mytextfield(
                        controller: quantity,
                        hinttext: "Enter Quantity of Lot",
                        isNumeric: true,
                        width: MediaQuery.of(context).size.width * 0.19,
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                      Mytextfield(
                        controller: amount,
                        hinttext: "Enter Amount per Ton",
                        isNumeric: true,
                        width: MediaQuery.of(context).size.width * 0.19,
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                      Mybutton(
                        onTap: () {
                          // Example add row (later save to DB)
                          setState(() {
                            rows.add({
                              "lotId": "L00${rows.length + 1}",
                              "sellerName": "X",
                              "purchaseDate":
                                  DateTime.now().toString().split(" ")[0],
                              "amount": amount.text,
                              "quantity": quantity.text,
                              "received": "No",
                            });
                            quantity.clear();
                            amount.clear();
                          });
                        },
                        text: "Add",
                        width: MediaQuery.of(context).size.width * 0.1,
                        height: MediaQuery.of(context).size.height * 0.07,
                        color: AppColor.info,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: MediaQuery.of(context).size.height * 0.04),

            // Table
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Lottable(
                  rows: rows,
                  onDelete: onDelete,
                  onProcess: onProcess,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
