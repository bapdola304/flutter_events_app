import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  final String hintText;
  final Function(DateTime date)? onChanged;
  const DatePicker({super.key, required this.hintText, this.onChanged});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime? _selectedDate;

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1975),
      lastDate: DateTime(2300),
    );
    if (picked != null && widget.onChanged != null) {
      widget.onChanged!(picked);
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectDate(context),
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 8),
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: const Color(0xFFE8E8E8)),
            color: const Color(0xFFF6F6F6),
            borderRadius: BorderRadius.circular(10)),
        child: Text(
          _selectedDate != null
              ? '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
              : widget.hintText,
          style: TextStyle(
              fontWeight:
                  _selectedDate != null ? FontWeight.w500 : FontWeight.w600,
              color: _selectedDate != null ? Colors.black : Color(0xFFBDBDBD)),
        ),
      ),
    );
  }
}
