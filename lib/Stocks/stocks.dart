import 'package:farooqtrading/Components/desktoplayout.dart';
import 'package:flutter/material.dart';

class Stocks extends StatelessWidget {
  const Stocks({super.key});

  @override
  Widget build(BuildContext context) {
    //double tableHeight = MediaQuery.of(context).size.height * 0.35; // half-half

    return DesktopLayout(
      title: "Stocks",
      child: Column(
        children: [
          _buildStockCard(
            context,
            title: "🚚 On the Way",
            color: Colors.orange,
            data: stockData,
          ),
          const SizedBox(height: 20),
          _buildStockCard(
            context,
            title: "🏭 Ready to Sell",
            color: Colors.green,
            data: stockData,
          ),
        ],
      ),
    );
  }

  Widget _buildStockCard(
    BuildContext context, {
    required String title,
    required Color color,
    required List<Map<String, dynamic>> data,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
            ),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.27,
            child: SingleChildScrollView(
              child: DataTable(
                headingRowColor: WidgetStatePropertyAll(Colors.blue.shade50),
                headingTextStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                columns: const [
                  DataColumn(label: Text("Tanker No")),
                  DataColumn(label: Text("Number Plate")),
                  DataColumn(label: Text("Qty (tons)")),
                  DataColumn(label: Text("Rate / Ton")),
                  DataColumn(label: Text("Purchase")),
                  DataColumn(label: Text("Tax + Expense")),
                  DataColumn(label: Text("Total Balance")),
                ],
                rows:
                    data
                        .map(
                          (row) => DataRow(
                            cells: [
                              DataCell(Text(row["tankerNo"].toString())),
                              DataCell(Text(row["plate"])),
                              DataCell(Text(row["qty"].toString())),
                              DataCell(Text(row["rate"].toString())),
                              DataCell(Text(row["purchase"].toString())),
                              DataCell(Text(row["tax"].toString())),
                              DataCell(
                                Text(
                                  row["balance"].toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                        .toList(),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 50),
            alignment: Alignment.centerRight,
            child: Text(
              "Total Qty: ${data.fold<int>(0, (sum, row) => sum + (row["qty"] as int))} | "
              "Total Balance: ${data.fold<int>(0, (sum, row) => sum + (row["balance"] as int))}",
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Dummy Data
final List<Map<String, dynamic>> stockData = [
  {
    "tankerNo": 1,
    "plate": "XH-087B",
    "qty": 600,
    "rate": 4500,
    "purchase": 12000,
    "tax": 15000,
    "balance": 27000,
  },
  {
    "tankerNo": 2,
    "plate": "XH-087B",
    "qty": 600,
    "rate": 4500,
    "purchase": 12000,
    "tax": 15000,
    "balance": 27000,
  },
  {
    "tankerNo": 3,
    "plate": "XH-087B",
    "qty": 600,
    "rate": 4500,
    "purchase": 12000,
    "tax": 15000,
    "balance": 27000,
  },
  {
    "tankerNo": 4,
    "plate": "XH-087B",
    "qty": 600,
    "rate": 4500,
    "purchase": 12000,
    "tax": 15000,
    "balance": 27000,
  },
];
