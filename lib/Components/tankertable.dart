import 'package:flutter/material.dart';

class TankerTable extends StatelessWidget {
  const TankerTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: DataTable(
          headingRowColor: WidgetStateProperty.all(Colors.blue),
          border: TableBorder.all(color: Colors.white, width: 1),
          columns: const [
            DataColumn(label: Text("Tanker No")),
            DataColumn(label: Text("No Plate")),
            DataColumn(label: Text("Date")),
            DataColumn(label: Text("Quantity")),
            DataColumn(label: Text("Transferred")),
            DataColumn(label: Text("Tax + Expenese")),
            DataColumn(label: Text("Processed")),
            DataColumn(label: Text("Action")),
          ],
          rows: [
            DataRow(
              cells: [
                const DataCell(Text("01")),
                const DataCell(Text("XH-087B")),
                const DataCell(Text("21-02-2025")),
                const DataCell(Text("600")),
                const DataCell(Text("No")), // or Yes/No switch
                const DataCell(Text("0")),
                const DataCell(Text("No")),
                DataCell(
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          // delete action
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.play_circle_fill,
                          color: Colors.blue,
                        ),
                        tooltip: "Process",
                        onPressed: () {
                          // process action
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            DataRow(
              cells: [
                const DataCell(Text("01")),
                const DataCell(Text("XH-087B")),
                const DataCell(Text("21-02-2025")),
                const DataCell(Text("600")),
                const DataCell(Text("No")), // or Yes/No switch
                const DataCell(Text("0")),
                const DataCell(Text("No")),
                DataCell(
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          // delete action
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.play_circle_fill,
                          color: Colors.blue,
                        ),
                        tooltip: "Process",
                        onPressed: () {
                          // process action
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            DataRow(
              cells: [
                const DataCell(Text("01")),
                const DataCell(Text("XH-087B")),
                const DataCell(Text("21-02-2025")),
                const DataCell(Text("600")),
                const DataCell(Text("No")), // or Yes/No switch
                const DataCell(Text("0")),
                const DataCell(Text("No")),
                DataCell(
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          // delete action
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.play_circle_fill,
                          color: Colors.blue,
                        ),
                        tooltip: "Process",
                        onPressed: () {
                          // process action
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            DataRow(
              cells: [
                const DataCell(Text("01")),
                const DataCell(Text("XH-087B")),
                const DataCell(Text("21-02-2025")),
                const DataCell(Text("600")),
                const DataCell(Text("No")), // or Yes/No switch
                const DataCell(Text("0")),
                const DataCell(Text("No")),
                DataCell(
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          // delete action
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.play_circle_fill,
                          color: Colors.blue,
                        ),
                        tooltip: "Process",
                        onPressed: () {
                          // process action
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            DataRow(
              cells: [
                const DataCell(Text("01")),
                const DataCell(Text("XH-087B")),
                const DataCell(Text("21-02-2025")),
                const DataCell(Text("600")),
                const DataCell(Text("No")), // or Yes/No switch
                const DataCell(Text("0")),
                const DataCell(Text("No")),
                DataCell(
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          // delete action
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.play_circle_fill,
                          color: Colors.blue,
                        ),
                        tooltip: "Process",
                        onPressed: () {
                          // process action
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            DataRow(
              cells: [
                const DataCell(Text("01")),
                const DataCell(Text("XH-087B")),
                const DataCell(Text("21-02-2025")),
                const DataCell(Text("600")),
                const DataCell(Text("No")), // or Yes/No switch
                const DataCell(Text("0")),
                const DataCell(Text("No")),
                DataCell(
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          // delete action
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.play_circle_fill,
                          color: Colors.blue,
                        ),
                        tooltip: "Process",
                        onPressed: () {
                          // process action
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            DataRow(
              cells: [
                const DataCell(Text("01")),
                const DataCell(Text("XH-087B")),
                const DataCell(Text("21-02-2025")),
                const DataCell(Text("600")),
                const DataCell(Text("No")), // or Yes/No switch
                const DataCell(Text("0")),
                const DataCell(Text("No")),
                DataCell(
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          // delete action
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.play_circle_fill,
                          color: Colors.blue,
                        ),
                        tooltip: "Process",
                        onPressed: () {
                          // process action
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            DataRow(
              cells: [
                const DataCell(Text("01")),
                const DataCell(Text("XH-087B")),
                const DataCell(Text("21-02-2025")),
                const DataCell(Text("600")),
                const DataCell(Text("No")), // or Yes/No switch
                const DataCell(Text("0")),
                const DataCell(Text("No")),
                DataCell(
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          // delete action
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.play_circle_fill,
                          color: Colors.blue,
                        ),
                        tooltip: "Process",
                        onPressed: () {
                          // process action
                        },
                      ),
                    ],
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
