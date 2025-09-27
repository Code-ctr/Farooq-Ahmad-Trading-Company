import 'package:farooqtrading/Company/companyhome.dart';
import 'package:farooqtrading/Components/adding_name.dart';
import 'package:farooqtrading/Components/appcolor.dart';
import 'package:farooqtrading/Components/desktoplayout.dart';
import 'package:farooqtrading/Components/flippage.dart';
import 'package:farooqtrading/Components/mybutton.dart';
import 'package:farooqtrading/Components/table.dart';
import 'package:flutter/material.dart';

class Customers extends StatefulWidget {
  const Customers({super.key});

  @override
  State<Customers> createState() => _CustomersState();
}

class _CustomersState extends State<Customers> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: DesktopLayout(
        title: "Customer Panel",
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
                        "Customer Panel",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "Manage and record all customer transactions",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColor.textSecondary,
                        ),
                      ),
                      Companypayment(user: "Customer"),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.005,
                      ),
                      Text(
                        "Print customer transactions by date to date",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColor.textSecondary,
                        ),
                      ),
                      LedagerPrint(showtext: "customer"),
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
                        child: TransactionTable(data: []),
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
                                    hint: "Customer ",
                                    onBack:
                                        () => Navigator.push(
                                          context,
                                          FlipPageRoute(page: Customers()),
                                        ),
                                  ),
                                ),
                              );
                            },
                            text: "Add Customer",
                            width: MediaQuery.of(context).size.width * 0.2,
                            color: AppColor.info,
                          ),
                          Mybutton(
                            onTap: () {},
                            text: "Delete Selected",
                            buttoncolor: Colors.white,
                            color: Colors.red,
                            width: MediaQuery.of(context).size.width * 0.2,
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
