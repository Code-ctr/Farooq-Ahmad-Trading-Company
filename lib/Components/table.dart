import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class TransactionTable extends StatefulWidget {
  final List<Map<String, dynamic>> data;

  const TransactionTable({super.key, required this.data});

  @override
  State<TransactionTable> createState() => _TransactionTableState();
}

class _TransactionTableState extends State<TransactionTable> {
  final Set<int> _selectedRows = {};

  DataRow _buildTransactionRow(int index) {
    final tx = widget.data[index];
    return DataRow(
      cells: [
        _buildDetailCell(tx, index),
        _buildNumberCell(tx["debit"].toString()),
        _buildNumberCell(tx["credit"].toString()),
        _buildNumberCell(tx["balance"].toString()),
      ],
    );
  }

  DataCell _buildDetailCell(Map<String, dynamic> tx, int index) {
    return DataCell(
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox(
            value: _selectedRows.contains(index),
            onChanged: (bool? selected) {
              setState(() {
                if (selected == true) {
                  _selectedRows.add(index);
                } else {
                  _selectedRows.remove(index);
                }
              });
            },
          ),
          SizedBox(
            width: 250,
            child: Text(
              tx["detail"]?.toString() ?? '',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }

  DataCell _buildNumberCell(String text) {
    return DataCell(Text(text, overflow: TextOverflow.ellipsis, maxLines: 1));
  }

  Widget _buildTableHeader() {
    return DataTable(
      headingRowColor: WidgetStateProperty.all(Colors.grey.shade300),
      columns: const [
        DataColumn(label: Text("Detail")),
        DataColumn(label: Text("Debit")),
        DataColumn(label: Text("Credit")),
        DataColumn(label: Text("Balance")),
      ],
      rows: const [],
    );
  }

  Widget _buildDataTable() {
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: DataTable(
          headingRowColor: WidgetStateProperty.all(Colors.grey.shade300),
          columns: const [
            DataColumn(label: Text("Detail")),
            DataColumn(label: Text("Debit")),
            DataColumn(label: Text("Credit")),
            DataColumn(label: Text("Balance")),
          ],
          rows: List.generate(widget.data.length, _buildTransactionRow),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.data.isEmpty) {
      return _buildTableHeader();
    }

    return _buildDataTable();
  }
}

class CustomerTable extends StatefulWidget {
  final List<Map<String, dynamic>> data;

  const CustomerTable({super.key, required this.data});

  @override
  State<CustomerTable> createState() => _CustomerTableState();
}

class _CustomerTableState extends State<CustomerTable> {
  DataRow _buildCustomerRow(int index) {
    final customer = widget.data[index];
    return DataRow(
      cells: [
        DataCell(Text(customer["name"]?.toString() ?? '')),
        DataCell(Text(customer["contact"]?.toString() ?? '')),
        DataCell(
          SizedBox(
            width: 200,
            child: Text(
              customer["address"]?.toString() ?? '',
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        DataCell(
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.blue),
            onPressed: () {
              if (kDebugMode) {
                print("Edit ${customer["name"]}");
              }
            },
          ),
        ),
        DataCell(
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () {
              if (kDebugMode) {
                print("Deleted ${customer["name"]}");
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTableHeader() {
    return DataTable(
      headingRowColor: WidgetStateProperty.all(Colors.grey.shade300),
      columns: const [
        DataColumn(label: Text("Name")),
        DataColumn(label: Text("Contact Number")),
        DataColumn(label: Text("Address")),
        DataColumn(label: Text("Edit")),
        DataColumn(label: Text("Delete")),
      ],
      rows: const [],
    );
  }

  Widget _buildDataTable() {
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: DataTable(
          headingRowColor: WidgetStateProperty.all(Colors.grey.shade300),
          columns: const [
            DataColumn(label: Text("Name")),
            DataColumn(label: Text("Contact Number")),
            DataColumn(label: Text("Address")),
            DataColumn(label: Text("Edit")),
            DataColumn(label: Text("Delete")),
          ],
          rows: List.generate(widget.data.length, _buildCustomerRow),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.data.isEmpty) {
      return _buildTableHeader();
    }

    return _buildDataTable();
  }
}
