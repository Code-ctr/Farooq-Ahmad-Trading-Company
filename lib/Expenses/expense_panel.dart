import 'package:farooqtrading/Components/appcolor.dart';
import 'package:farooqtrading/Components/desktoplayout.dart';
import 'package:farooqtrading/Components/drop.dart';
import 'package:farooqtrading/Components/mybutton.dart';
import 'package:farooqtrading/Components/mytextfield.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ExpensePanel extends StatefulWidget {
  const ExpensePanel({super.key});

  @override
  State<ExpensePanel> createState() => _ExpensePanelState();
}

class _ExpensePanelState extends State<ExpensePanel> {
  final amount = TextEditingController();
  final detail = TextEditingController();
  final name = TextEditingController();
  bool isExpense = false;
  bool isSaving = false;
  bool isPrinting = false;
  String? selectedExpense;
  String? selectedExpenseforPrinting;
  int restkey = 0;
  int printingrestkey = 0;
  List<_ExpenseData> getData() {
    return [
      _ExpenseData('Food', 70),
      _ExpenseData('Transport', 40),
      _ExpenseData('Shopping', 55),
      _ExpenseData('Bills', 1630),
      _ExpenseData('Bills', 30),
      _ExpenseData('Bills', 30),
      _ExpenseData('Bills', 30),
      _ExpenseData('Bills', 30),
      _ExpenseData('Bills', 30),
      _ExpenseData('Bills', 30),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return DesktopLayout(
      title: "Expense Panel",
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ContainersEx(
            width: MediaQuery.of(context).size.width * 0.28,
            height: MediaQuery.of(context).size.height * 0.9,
            chlid: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 5,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Expense Manager",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                  ),
                  Text(
                    "Note your every day spending by category",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColor.textSecondary,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  Text(
                    "Add New Category",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Mytextfield(
                    controller: name,
                    hinttext: "Enter expense category name",
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Center(
                    child: Mybutton(
                      onTapAsync:
                          isSaving
                              ? null
                              : () async {
                                setState(() => isSaving = true);

                                // simulate saving work
                                await Future.delayed(
                                  const Duration(seconds: 1),
                                );
                                setState(() {
                                  name.clear();
                                  isSaving = false;
                                });
                              },
                      text: isSaving ? "Processing..." : "Add",
                      color: isSaving ? Colors.grey : AppColor.info,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "Add Expense",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Drop(
                    key: ValueKey("expense_$restkey"),
                    initialValue: selectedExpense,
                    onChanged: (value) {
                      setState(() {
                        selectedExpense = value;
                      });
                    },
                    hinttext: "Select Expense Category",
                    items: ["X", "Y", "Z"],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.005),
                  Mytextfield(
                    controller: amount,
                    hinttext: "Enter expense amount",
                    isNumeric: true,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.005),
                  Mytextfield(controller: detail, hinttext: "Enter detail"),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.005),
                  Center(
                    child: Mybutton(
                      onTapAsync:
                          isExpense
                              ? null
                              : () async {
                                setState(() => isExpense = true);

                                // simulate saving work
                                await Future.delayed(
                                  const Duration(seconds: 1),
                                );
                                setState(() {
                                  selectedExpense = null;
                                  restkey++;
                                  amount.clear();
                                  detail.clear();
                                  isExpense = false;
                                });
                              },
                      text: isExpense ? "Processing..." : "Add",
                      color: isExpense ? Colors.grey : AppColor.info,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                ],
              ),
            ),
          ),
          ContainersEx(
            width: MediaQuery.of(context).size.width * 0.53,
            height: MediaQuery.of(context).size.height * 0.9,
            chlid: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5.0,
                      horizontal: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Expense Tracker",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          "Track your every day spending by category",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppColor.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.065,
                    ),
                    child: Text(
                      "Print detail report for each categroy",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColor.textSecondary,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Drop(
                      hinttext: "Select Expense Category",
                      items: ["x", "y", "z"],
                      key: ValueKey("expense for Printing_$printingrestkey"),
                      initialValue: selectedExpenseforPrinting,
                      onChanged: (value) {
                        setState(() {
                          selectedExpenseforPrinting = value;
                        });
                      },
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.04),
                    Mybutton(
                      onTapAsync:
                          isPrinting
                              ? null
                              : () async {
                                setState(() => isPrinting = true);

                                // simulate saving work
                                await Future.delayed(
                                  const Duration(seconds: 1),
                                );
                                setState(() {
                                  selectedExpenseforPrinting = null;
                                  printingrestkey++;
                                  isPrinting = false;
                                });
                              },
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width * 0.1,
                      text: isPrinting ? "Processing..." : "Print",
                      color: isPrinting ? Colors.grey : AppColor.info,
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                SfCircularChart(
                  legend: Legend(isVisible: true),
                  series: <RadialBarSeries<_ExpenseData, String>>[
                    RadialBarSeries<_ExpenseData, String>(
                      dataSource: getData(),
                      xValueMapper: (_ExpenseData data, _) => data.category,
                      yValueMapper: (_ExpenseData data, _) => data.value,
                      dataLabelSettings: const DataLabelSettings(
                        isVisible: true,
                      ),
                      maximumValue: 100, // optional, sets max radial value
                      gap: '2%', // adds space between bars
                      radius: '100%',
                      innerRadius: '30%', // makes it compact
                      cornerStyle: CornerStyle.bothCurve, // makes bars rounded
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ContainersEx extends StatelessWidget {
  final Widget chlid;
  final double width;
  final double height;
  const ContainersEx({
    super.key,
    required this.chlid,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: chlid,
    );
  }
}

class _ExpenseData {
  final String category;
  final double value;
  _ExpenseData(this.category, this.value);
}
