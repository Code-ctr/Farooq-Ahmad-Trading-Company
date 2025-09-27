import 'package:farooqtrading/Components/appcolor.dart';
import 'package:flutter/material.dart';

class Lottable extends StatefulWidget {
  final List<Map<String, dynamic>>? rows;
  final void Function(int index) onDelete;
  final void Function(int index) onProcess;

  const Lottable({
    super.key,
    this.rows,
    required this.onDelete,
    required this.onProcess,
  });

  @override
  State<Lottable> createState() => _SellTableState();
}

class _SellTableState extends State<Lottable> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: DataTable(
          columnSpacing: 30, // reduce space between columns
          headingRowColor: WidgetStateProperty.all(Colors.blue),
          border: TableBorder.all(color: Colors.white, width: 1),
          headingTextStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15, // smaller heading font
          ),
          dataTextStyle: const TextStyle(
            fontSize: 12, // smaller body font
          ),
          columns: const [
            DataColumn(label: Text("LOT ID", overflow: TextOverflow.ellipsis)),
            DataColumn(
              label: Text("Seller Name", overflow: TextOverflow.ellipsis),
            ),
            DataColumn(
              label: Text("Purchase Date", overflow: TextOverflow.ellipsis),
            ),
            DataColumn(label: Text("Amount", overflow: TextOverflow.ellipsis)),
            DataColumn(
              label: Text("Quantity", overflow: TextOverflow.ellipsis),
            ),
            DataColumn(
              label: Text("Received", overflow: TextOverflow.ellipsis),
            ),
            DataColumn(label: Text("Action", overflow: TextOverflow.ellipsis)),
            DataColumn(
              label: Text("Discount", overflow: TextOverflow.ellipsis),
            ),
          ],
          rows:
              widget.rows!.isEmpty
                  ? []
                  : widget.rows!.asMap().entries.map((entry) {
                    final index = entry.key;
                    final row = entry.value;
                    return DataRow(
                      color: WidgetStateProperty.all(Colors.white),
                      cells: [
                        DataCell(
                          Text(
                            row["lotId"].toString(),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        DataCell(
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.1,
                            child: Text(
                              row["sellerName"].toString(),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ),
                        DataCell(
                          Text(
                            row["purchaseDate"].toString(),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        DataCell(
                          Text(
                            row["amount"].toString(),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        DataCell(
                          Text(
                            row["quantity"].toString(),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        DataCell(
                          Text(
                            row["received"].toString(),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        DataCell(
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.play_arrow,
                                  color: AppColor.info,
                                ),
                                hoverColor: AppColor.primaryLight,
                                tooltip: "Process",
                                onPressed: () => widget.onProcess(index),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                tooltip: "Delete",
                                onPressed: () => widget.onDelete(index),
                              ),
                            ],
                          ),
                        ),
                        DataCell(
                          IconButton(
                            icon: const Icon(
                              Icons.discount,
                              color: Colors.grey,
                            ),
                            tooltip: "Discount",
                            onPressed: () {},
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
