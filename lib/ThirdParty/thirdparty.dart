import 'package:farooqtrading/Company/companyhome.dart';
import 'package:farooqtrading/Components/appcolor.dart';
import 'package:farooqtrading/Components/dashborad.dart';
import 'package:farooqtrading/Components/desktoplayout.dart';
import 'package:farooqtrading/Components/drop.dart';
import 'package:farooqtrading/Components/mybutton.dart';
import 'package:farooqtrading/Components/mytextfield.dart';
import 'package:flutter/material.dart';

class Thirdparty extends StatelessWidget {
  final transferamount = TextEditingController();
  final exchangerate = TextEditingController();
  final name = TextEditingController();
  final contact = TextEditingController();
  Thirdparty({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: DesktopLayout(
        title: "Third Party",
        child: Align(
          alignment: Alignment.topLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.28,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.01,
                    horizontal: MediaQuery.of(context).size.width * 0.01,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Third Party",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "Record all transactions with counterparties",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColor.textSecondary,
                        ),
                      ),
                      Companypayment(user: "Party"),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.005,
                      ),
                      Text(
                        "Print record by date to date",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColor.textSecondary,
                        ),
                      ),
                      LedagerPrint(showtext: "Party"),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.58,
                      width: MediaQuery.of(context).size.width * 0.523,
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
                                vertical: 10.0,
                                horizontal: 30,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Currency Conversion",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Spacer(),
                                      Icon(
                                        Icons.currency_exchange,
                                        color: Colors.tealAccent,
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "Transfer converted currency to the company or counterparties",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: AppColor.textSecondary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Drop(
                            hinttext: "Select Receiving Party",
                            items: ["X", "Y"],
                            width: MediaQuery.of(context).size.width * 0.3,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.005,
                          ),
                          BalanceWidget(containercolor: AppColor.info),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.005,
                          ),
                          Mytextfield(
                            controller: transferamount,
                            hinttext: "Amount To Transfer",
                            isNumeric: true,
                            width: MediaQuery.of(context).size.width * 0.3,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.005,
                          ),
                          Mytextfield(
                            controller: exchangerate,
                            hinttext: "Exchange Rate",
                            isNumeric: true,
                            width: MediaQuery.of(context).size.width * 0.3,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.005,
                          ),
                          Drop(
                            hinttext: "Company",
                            items: ["X", "Y"],
                            width: MediaQuery.of(context).size.width * 0.3,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Mybutton(
                            onTap: () {},
                            text: "Transfer",
                            icon: Icons.near_me,
                            color: AppColor.info,
                            width: MediaQuery.of(context).size.width * 0.12,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.28,
                    width: MediaQuery.of(context).size.width * 0.523,
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
                              vertical: 5.0,
                              horizontal: 20,
                            ),
                            child: Text(
                              "Add New Party",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        Mytextfield(
                          controller: name,
                          hinttext: "Party name",
                          width: MediaQuery.of(context).size.width * 0.3,
                        ),
                        Mytextfield(
                          controller: contact,
                          hinttext: "Contact Number",
                          isNumeric: true,
                          width: MediaQuery.of(context).size.width * 0.3,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.005,
                        ),
                        Mybutton(
                          onTap: () {},
                          text: "Add",
                          color: AppColor.info,
                          width: MediaQuery.of(context).size.width * 0.12,
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
    );
  }
}
