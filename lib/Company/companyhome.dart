import 'package:farooqtrading/Components/adding_name.dart';
import 'package:farooqtrading/Components/appcolor.dart';
import 'package:farooqtrading/Components/calender.dart';
import 'package:farooqtrading/Components/dashborad.dart';
import 'package:farooqtrading/Components/desktoplayout.dart';
import 'package:farooqtrading/Components/drop.dart';
import 'package:farooqtrading/Components/flippage.dart';
import 'package:farooqtrading/Components/mybutton.dart';
import 'package:farooqtrading/Components/mytextfield.dart';
import 'package:farooqtrading/Components/table.dart';
import 'package:flutter/material.dart';

class Companyhome extends StatefulWidget {
  const Companyhome({super.key});

  @override
  State<Companyhome> createState() => _CompanyhomeState();
}

class _CompanyhomeState extends State<Companyhome> {
  void _refreshData() {
    setState(() {
      // This will trigger a rebuild and reload the data
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: DesktopLayout(
        title: "Company",
        child: Container(
          height: MediaQuery.of(context).size.height * 0.9,
          width: MediaQuery.of(context).size.width * 0.81,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.01,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.01,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Company Panel",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "Manage and record all company transactions",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColor.textSecondary,
                        ),
                      ),
                      Companypayment(user: "Company"),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.005,
                      ),
                      Text(
                        "Print company transactions by date to date",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColor.textSecondary,
                        ),
                      ),
                      LedagerPrint(showtext: "Company"),
                    ],
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.75,
                      width: MediaQuery.of(context).size.width * 0.52,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: TransactionTable(
                          data: [
                            {
                              "detail": "Zero Amount Test",
                              "debit": 0.0,
                              "credit": 0.0,
                              "balance": 0.0,
                            },
                            // Large numbers
                            {
                              "detail": "Large Credit - Property Sale",
                              "debit": 0.0,
                              "credit": 250000.0,
                              "balance": 250000.0,
                            },
                            {
                              "detail": "Large Debit - Car Purchase",
                              "debit": 35000.0,
                              "credit": 0.0,
                              "balance": 215000.0,
                            },
                            // Long description
                            {
                              "detail":
                                  "Very long transaction description that should test text overflow and ellipsis functionality in the table cell",
                              "debit": 123.45,
                              "credit": 0.0,
                              "balance": 214876.55,
                            },
                            // Special characters
                            {
                              "detail": "Payment #12345 - Café & Restaurant 🍕",
                              "debit": 78.90,
                              "credit": 0.0,
                              "balance": 214797.65,
                            },
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.52,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Mybutton(
                            onTap: () {
                              Navigator.push(
                                context,
                                FlipPageRoute(
                                  page: AddingName(
                                    hint: "Company ",
                                    onBack:
                                        () => Navigator.push(
                                          context,
                                          FlipPageRoute(page: Companyhome()),
                                        ),
                                  ),
                                ),
                              );
                            },
                            text: "Add Company",
                            width: MediaQuery.of(context).size.width * 0.15,
                            color: AppColor.info,
                          ),
                          Mybutton(
                            onTap: _refreshData,
                            text: "Refresh Data",
                            width: MediaQuery.of(context).size.width * 0.15,
                            color: AppColor.success,
                          ),
                          Mybutton(
                            onTap: () {},
                            text: "Delete Selected",
                            buttoncolor: Colors.white,
                            color: Colors.red,
                            width: MediaQuery.of(context).size.width * 0.15,
                          ),
                        ],
                      ),
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

// Your existing Companypayment and LedagerPrint classes remain the same
class Companypayment extends StatelessWidget {
  final String user;
  Companypayment({super.key, required this.user});

  final amount = TextEditingController();
  final detail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.26,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Drop(hinttext: "Select An $user", items: ["X", "Y"]),
          BalanceWidget(color: Colors.red, text: "-1000000000"),
          Mytextfield(
            width: MediaQuery.of(context).size.width * 0.26,
            controller: amount,
            hinttext: "Enter Amount",
            isNumeric: true,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.005),
          Drop(
            hinttext: "Select Transaction Type",
            items: ["Receiving", "Paying"],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.005),
          Drop(hinttext: "Select Payment Source", items: ["Cash", "Bank"]),
          SizedBox(height: MediaQuery.of(context).size.height * 0.005),
          Drop(hinttext: "Select Bank", items: ["X", "Y"]),
          SizedBox(height: MediaQuery.of(context).size.height * 0.005),
          Mytextfield(
            width: MediaQuery.of(context).size.width * 0.26,
            controller: detail,
            hinttext: "Transfer Detail",
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.005),
          Mybutton(
            onTap: () {},
            text: "Submit Transaction",
            color: AppColor.info,
            enableHover: true,
            width: MediaQuery.of(context).size.width * 0.26,
          ),
        ],
      ),
    );
  }
}

class LedagerPrint extends StatelessWidget {
  final String showtext;
  const LedagerPrint({super.key, required this.showtext});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.26,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Drop(hinttext: "Select An $showtext", items: ["X", "Y"]),
          SizedBox(height: MediaQuery.of(context).size.height * 0.005),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CalendarTextField(
                hint: "Select Start Date",
                width: MediaQuery.of(context).size.width * 0.095,
              ),
              CalendarTextField(
                hint: "Select End Date",
                width: MediaQuery.of(context).size.width * 0.095,
              ),
              Mybutton(
                onTap: () {},
                text: "Print",
                width: MediaQuery.of(context).size.width * 0.055,
                height: MediaQuery.of(context).size.height * 0.065,
                color: AppColor.info,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
