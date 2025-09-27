import 'package:farooqtrading/Components/appcolor.dart';
import 'package:farooqtrading/Components/calender.dart';
import 'package:farooqtrading/Components/dashborad.dart';
import 'package:farooqtrading/Components/desktoplayout.dart';
import 'package:farooqtrading/Components/drop.dart';
import 'package:farooqtrading/Components/mybutton.dart';
import 'package:farooqtrading/Components/mytextfield.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

// Balance Widget Can not Be Called More 4 Container No:3
class Banks extends StatefulWidget {
  const Banks({super.key});

  @override
  State<Banks> createState() => _BanksState();
}

class _BanksState extends State<Banks> {
  List<String> banks = [
    "Allied Bank Limited (ABL)",
    "Askari Bank Limited",
    "Bank Alfalah Limited",
    "Bank Al Habib Limited",
    "BankIslami Pakistan Limited",
    "Faysal Bank Limited",
    "First Women Bank Limited",
    "Habib Bank Limited (HBL)",
    "Habib Metropolitan Bank Limited",
    "JS Bank Limited",
    "MCB Bank Limited",
    "MCB Islamic Bank Limited",
    "Meezan Bank Limited",
    "National Bank of Pakistan (NBP)",
    "SME Bank Limited",
    "Sindh Bank Limited",
    "Soneri Bank Limited",
    "Standard Chartered Bank (Pakistan) Limited",
    "Summit Bank Limited",
    "The Bank of Khyber",
    "The Bank of Punjab",
    "United Bank Limited (UBL)",
    "Zarai Taraqiati Bank Limited (ZTBL)",
  ];
  final accountname = TextEditingController();
  final accountnumber = TextEditingController();
  final amounttotransfer = TextEditingController();
  final transferdetail = TextEditingController();
  bool isAddingBank = false;
  bool isTransferring = false;
  bool isPrinting = false;

  String? selectedNewBank;
  int newkey = 0;
  String? selectedTransferBank;
  int transferkey = 0;
  String? selectedPaymentTape;
  int paymentkey = 0;
  String? selectedPrintingBank;
  int printingkey = 0;

  @override
  Widget build(BuildContext context) {
    return DesktopLayout(
      title: "Banks",
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildTiltedContainer(
            context,
            angle: -pi / 12,
            x: -10,
            y: 10,
            chlid: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Add New Banks",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.account_balance, color: Colors.tealAccent),
                    ],
                  ),
                  Text(
                    "You can add new bank account here",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColor.textSecondary,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  Drop(
                    hinttext: "Select Bank",
                    items: banks,
                    key: ValueKey("new bank_$newkey"),
                    initialValue: selectedNewBank,
                    onChanged: (value) {
                      setState(() {
                        selectedNewBank = value;
                      });
                    },
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Mytextfield(
                    controller: accountname,
                    hinttext: "Enter Account Title",
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Mytextfield(
                    controller: accountnumber,
                    hinttext: "Enter Account Number",
                    isNumeric: true,
                  ),
                  Spacer(),
                  Mybutton(
                    width: MediaQuery.of(context).size.width * 0.26,
                    onTapAsync:
                        isAddingBank
                            ? null
                            : () async {
                              setState(() => isAddingBank = true);

                              // simulate saving work
                              await Future.delayed(const Duration(seconds: 1));
                              setState(() {
                                selectedNewBank = null;
                                newkey++;
                                // stop loading
                                isAddingBank = false;
                              });
                            },
                    text: "Add Account",
                    color: isAddingBank ? Colors.grey : AppColor.info,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                ],
              ),
            ),
          ), // ~30°
          _buildTiltedContainer(
            context,
            angle: 0,
            x: 0,
            y: 10,
            chlid: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Bank Transcation",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Icon(MdiIcons.bankTransfer, color: Colors.tealAccent),
                    ],
                  ),
                  Text(
                    "Cash/Bank Inter-Account Transfer",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColor.textSecondary,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  Drop(
                    hinttext: "Select Bank",
                    items: banks,
                    key: ValueKey("bank transfer_$transferkey"),
                    initialValue: selectedTransferBank,
                    onChanged: (value) {
                      setState(() {
                        selectedTransferBank = value;
                      });
                    },
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Drop(
                    hinttext: "Transfer Entry to",
                    items: ["Deposit into Bank", " Withdraw from Bank"],
                    key: ValueKey("payment Methon_$paymentkey"),
                    initialValue: selectedPaymentTape,
                    onChanged: (value) {
                      setState(() {
                        selectedPaymentTape = value;
                      });
                    },
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Mytextfield(
                    controller: amounttotransfer,
                    hinttext: "Amount to Transfer",
                    isNumeric: true,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Mytextfield(
                    controller: transferdetail,
                    hinttext: "Enter Transfer Detail",
                  ),
                  Spacer(),
                  Mybutton(
                    width: MediaQuery.of(context).size.width * 0.26,
                    onTapAsync:
                        isTransferring
                            ? null
                            : () async {
                              setState(() => isTransferring = true);

                              // simulate saving work
                              await Future.delayed(const Duration(seconds: 1));
                              setState(() {
                                selectedTransferBank = null;
                                transferkey++;
                                selectedPaymentTape = null;
                                paymentkey++;
                                // stop loading
                                isTransferring = false;
                              });
                            },
                    text: isTransferring ? "Processing..." : "Transfer",
                    color: isTransferring ? Colors.grey : AppColor.info,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                ],
              ),
            ),
          ), // ~45°
          _buildTiltedContainer(
            context,
            angle: pi / 12,
            x: 10,
            y: 10,
            chlid: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Bank Statement",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.stacked_bar_chart, color: Colors.tealAccent),
                    ],
                  ),
                  Text(
                    "Print any Account Detail Report",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColor.textSecondary,
                    ),
                  ),
                  // Balance Widget Can not Be Called More 4
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  BalanceWidget(
                    text: "Fareed Anas Qta ",
                    amount: 20000000,
                    containercolor: AppColor.info,
                    color: Colors.white,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.005),
                  BalanceWidget(
                    text: "Meezan Account",
                    amount: 20000000,
                    containercolor: AppColor.info,
                    color: Colors.white,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.005),
                  BalanceWidget(
                    text: "Meezan Account",
                    amount: 20000000,
                    containercolor: AppColor.info,
                    color: Colors.white,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.005),
                  BalanceWidget(
                    text: "Meezan Account",
                    amount: 20000000,
                    containercolor: AppColor.info,
                    color: Colors.white,
                    //useEllipsis: true,
                  ),

                  Spacer(),
                  Text(
                    "Print Bank Statement",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Drop(
                    hinttext: "Select Bank",
                    items: banks,
                    key: ValueKey("printing_$printingkey"),
                    initialValue: selectedPrintingBank,
                    onChanged: (value) {
                      setState(() {
                        selectedPrintingBank = value;
                      });
                    },
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CalendarTextField(
                        hint: "Select",
                        width: MediaQuery.of(context).size.width * 0.11,
                      ),
                      CalendarTextField(
                        hint: "Select",
                        width: MediaQuery.of(context).size.width * 0.11,
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Mybutton(
                    width: MediaQuery.of(context).size.width * 0.26,
                    onTapAsync:
                        isPrinting
                            ? null
                            : () async {
                              setState(() => isPrinting = true);

                              // simulate saving work
                              await Future.delayed(const Duration(seconds: 1));
                              setState(() {
                                selectedPrintingBank = null;
                                printingkey++;
                                // stop loading
                                isPrinting = false;
                              });
                            },
                    text: isPrinting ? "Processing..." : "Print Statement",
                    color: isPrinting ? Colors.grey : AppColor.info,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                ],
              ),
            ),
          ), // tilt other way
        ],
      ),
    );
  }

  Widget _buildTiltedContainer(
    BuildContext context, {
    required double angle,
    required Widget chlid,
    double x = 0,
    double y = 0,
  }) {
    return Transform(
      transform:
          Matrix4.identity()
            ..setEntry(3, 2, 0.001) // perspective depth
            ..rotateY(angle), // rotate along Y-axis
      alignment: Alignment.center,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.24,
        height: MediaQuery.of(context).size.width * 0.4,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 10,
              offset: Offset(x, y),
            ),
          ],
        ),
        child: chlid,
      ),
    );
  }
}
