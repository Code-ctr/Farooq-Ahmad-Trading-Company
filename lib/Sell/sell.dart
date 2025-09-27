import 'package:farooqtrading/Components/appcolor.dart';
import 'package:farooqtrading/Components/desktoplayout.dart';
import 'package:farooqtrading/Components/drop.dart';
import 'package:farooqtrading/Components/mybutton.dart';
import 'package:farooqtrading/Components/mytextfield.dart';
import 'package:flutter/material.dart';

class Sell extends StatefulWidget {
  const Sell({super.key});

  @override
  State<Sell> createState() => _SellState();
}

class _SellState extends State<Sell> {
  final List<Map<String, dynamic>> _rows = [];
  final rate = TextEditingController();

  String? selectedTanker;
  String? selectedCustomer;
  int customerResetKey = 0;
  int tankerResetKey = 0;

  bool isLoading = false; // ✅ for Sell Order animation

  @override
  Widget build(BuildContext context) {
    return DesktopLayout(
      title: "Sale Panel",
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.45,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              children: [
                // ======= Input Row ========
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Drop(
                        key: ValueKey("customer_$customerResetKey"),
                        hinttext: "Select Customer",
                        items: ['A', 'B'],
                        width: MediaQuery.of(context).size.width * 0.2,
                        initialValue: selectedCustomer,
                        onChanged: (value) {
                          setState(() {
                            selectedCustomer = value;
                          });
                        },
                      ),
                      Drop(
                        key: ValueKey("tanker_$tankerResetKey"),
                        hinttext: "Select Tanker",
                        items: ['Tanker 1', 'Tanker 2'],
                        width: MediaQuery.of(context).size.width * 0.2,
                        initialValue: selectedTanker,
                        onChanged: (value) {
                          setState(() {
                            selectedTanker = value;
                          });
                        },
                      ),
                      Mytextfield(
                        controller: rate,
                        hinttext: "Rate Per Ton",
                        width: MediaQuery.of(context).size.width * 0.2,
                      ),
                      Mybutton(
                        onTap: () {
                          if (selectedTanker == null || rate.text.isEmpty) {
                            return;
                          }

                          final tanker = selectedTanker!;
                          final tons = 10;
                          final rateVal = double.tryParse(rate.text) ?? 0;
                          final balance = rateVal * tons;

                          setState(() {
                            _rows.add({
                              "tanker": tanker,
                              "weight": tons,
                              "rate": rateVal,
                              "balance": balance,
                            });
                          });

                          // ✅ reset tanker + textfield
                          rate.clear();
                          selectedTanker = null;
                          tankerResetKey++;
                        },
                        text: "Add",
                        width: MediaQuery.of(context).size.width * 0.1,
                        color: AppColor.info,
                      ),
                    ],
                  ),
                ),

                // ======= Table ========
                Expanded(
                  child: SellTable(
                    rows: _rows,
                    onDelete: (index) {
                      setState(() {
                        _rows.removeAt(index);
                      });
                    },
                  ),
                ),

                // ======= Sell Order Button ========
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Total Amount: 10000000",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                      Mybutton(
                        onTapAsync:
                            isLoading
                                ? null
                                : () async {
                                  setState(() => isLoading = true);

                                  // simulate saving work
                                  await Future.delayed(
                                    const Duration(seconds: 2),
                                  );

                                  setState(() {
                                    // ✅ reset customer drop
                                    selectedCustomer = null;
                                    customerResetKey++;

                                    // ✅ clear table
                                    _rows.clear();

                                    // stop loading
                                    isLoading = false;
                                  });
                                },
                        text: isLoading ? "Processing..." : "Sell Order",
                        color: isLoading ? Colors.grey : AppColor.info,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.add_ic_call, size: 100),
                RecentSalesContainer(),
                RecentSalesContainer(),
                RecentSalesContainer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SellTable extends StatefulWidget {
  final List<Map<String, dynamic>> rows;
  final void Function(int index) onDelete;

  const SellTable({super.key, required this.rows, required this.onDelete});

  @override
  State<SellTable> createState() => _SellTableState();
}

class _SellTableState extends State<SellTable> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade100, // grey bg for whole table
      ),
      child: SingleChildScrollView(
        child: DataTable(
          headingRowColor: WidgetStateProperty.all(Colors.blue),
          headingTextStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          columns: const [
            DataColumn(label: Text("Tanker No")),
            DataColumn(label: Text("Net Weight")),
            DataColumn(label: Text("Rate Per Ton")),
            DataColumn(label: Text("Total Balance")),
            DataColumn(label: Text("Option")),
          ],
          rows:
              widget.rows.isEmpty
                  ? []
                  : widget.rows.asMap().entries.map((entry) {
                    final index = entry.key;
                    final row = entry.value;
                    return DataRow(
                      color: WidgetStateProperty.all(Colors.white),
                      cells: [
                        DataCell(Text(row["tanker"].toString())),
                        DataCell(Text(row["weight"].toString())),
                        DataCell(Text(row["rate"].toString())),
                        DataCell(Text(row["balance"].toString())),
                        DataCell(
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => widget.onDelete(index),
                          ),
                        ),
                      ],
                    );
                  }).toList(),
        ),
      ),
    );
  }
}

class RecentSalesContainer extends StatelessWidget {
  const RecentSalesContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.38,
      width: MediaQuery.of(context).size.width * 0.2,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            offset: Offset(2, 5),
            blurRadius: 5,
            color: Colors.grey.shade600,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Text(
                "Syed Habib Ur Rehman",
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w700,
                  color: AppColor.textPrimary,
                ),
              ),
            ),
            Divider(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Row(
              children: [
                Text(
                  "Tanker No",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: AppColor.textPrimary,
                  ),
                ),
                Spacer(),
                Text(
                  "XHKz-81",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: AppColor.textPrimary,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Quantity",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: AppColor.textPrimary,
                  ),
                ),
                Spacer(),
                Text(
                  "23",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: AppColor.textPrimary,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Rate Per Ton",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: AppColor.textPrimary,
                  ),
                ),
                Spacer(),
                Text(
                  "200",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: AppColor.textPrimary,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Net Total",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: AppColor.textPrimary,
                    backgroundColor: Colors.blue,
                  ),
                ),
                Spacer(),
                Text(
                  "4600",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: AppColor.textPrimary,
                    backgroundColor: Colors.blue,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
