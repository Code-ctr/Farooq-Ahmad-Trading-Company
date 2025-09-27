import 'package:flutter/material.dart';

class Drop extends StatefulWidget {
  final String? hinttext;
  final List<String> items;
  final double? width;
  final ValueChanged<String?>? onChanged;
  final String? initialValue;
  const Drop({
    super.key,
    required this.hinttext,
    required this.items,
    this.width,
    this.onChanged,
    this.initialValue,
  });

  @override
  State<Drop> createState() => _DropState();
}

class _DropState extends State<Drop> {
  String? _selectedName;
  @override
  void didUpdateWidget(covariant Drop oldWidget) {
    super.didUpdateWidget(oldWidget);
    // 👇 if parent changes initialValue, reset selection
    if (widget.initialValue != oldWidget.initialValue) {
      setState(() {
        _selectedName = widget.initialValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      enableSearch: true,
      width: widget.width ?? MediaQuery.of(context).size.width * 0.26,
      menuStyle: MenuStyle(
        backgroundColor: WidgetStateProperty.all(Colors.white),
        elevation: WidgetStateProperty.all(4),
        maximumSize: WidgetStateProperty.all(
          Size.fromHeight(
            MediaQuery.of(context).size.height * 0.6,
          ), // 👈 limit height of dropdown popup
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        //contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10), // main field border
          borderSide: BorderSide(color: Colors.grey.shade600, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade600, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade700, width: 1),
        ),
      ),
      hintText: widget.hinttext ?? "Select an Option",
      initialSelection: _selectedName,
      onSelected: (String? value) {
        setState(() {
          _selectedName = value;
        });
        if (widget.onChanged != null) {
          widget.onChanged!(value);
        }
      },
      dropdownMenuEntries:
          widget.items
              .map(
                (String value) =>
                    DropdownMenuEntry<String>(value: value, label: value),
              )
              .toList(),
    );
  }
}
