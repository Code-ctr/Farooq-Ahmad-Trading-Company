import 'package:farooqtrading/Components/appcolor.dart';
import 'package:flutter/material.dart';
import 'package:farooqtrading/device_config.dart';
import 'package:farooqtrading/Components/desktoplayout.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});

  final List<String> titles = [
    "Cash hand",
    "Bank",
    "Receivable",
    "Payable",
    "Stocks",
    "Profit",
    "Expense",
  ];

  final List<int> values = [
    1000000000,
    2000043000,
    202323000,
    201212000,
    203434000,
    30232300,
    401212120,
  ];

  @override
  Widget build(BuildContext context) {
    return DeviceConfig.isMobile
        // ✅ Mobile Layout (your old version)
        ? Scaffold(
          backgroundColor: Color(0xFFF5F7FA),
          appBar: AppBar(
            title: const Text("Dash Borad"),
            backgroundColor: AppColor.primaryLight,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 150),
                  child: const Text("Mobile Navigation comes here"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      7,
                      (index) => Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: BalanceWidget(
                          text: titles[index],
                          amount: values[index],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
        // ✅ Desktop Layout (using wrapper)
        : DesktopLayout(
          title: "Dash Borad",
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: List.generate(
              7,
              (index) => Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: BalanceWidget(
                  text: titles[index],
                  amount: values[index],
                  width: MediaQuery.of(context).size.width * 0.26,
                  containercolor: AppColor.info,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
  }
}

class BalanceWidget extends StatelessWidget {
  final double? width;
  final Color? color;
  final Color? containercolor;
  final String? text;
  final int? amount;

  const BalanceWidget({
    super.key,
    this.color,
    this.width,
    this.containercolor,
    this.text,
    this.amount,
  });

  @override
  Widget build(BuildContext context) {
    final bool hasAmount = amount != null;

    return Container(
      decoration: BoxDecoration(
        color: containercolor ?? Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      constraints: BoxConstraints(
        minWidth: width ?? MediaQuery.of(context).size.width * 0.3,
        minHeight: MediaQuery.of(context).size.height * 0.075,
        maxWidth: width ?? MediaQuery.of(context).size.width * 0.3,
        maxHeight: MediaQuery.of(context).size.height * 0.075,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child:
          hasAmount
              ? Center(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment:
                      MainAxisAlignment.start, // only matters in ellipsis
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text(
                        "${text ?? ""} ",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        softWrap: false,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: color ?? AppColor.primaryLight,
                        ),
                      ),
                    ),

                    Expanded(
                      flex: 2,
                      child: Text(
                        amount.toString(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        softWrap: false,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: color ?? AppColor.primaryLight,
                        ),
                      ),
                    ),
                  ],
                ),
              )
              : Center(
                child: Text(
                  text ?? "",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  softWrap: false,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: color ?? AppColor.primaryLight,
                  ),
                ),
              ),
    );
  }
}
