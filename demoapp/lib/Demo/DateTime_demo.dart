import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class DatetimeDemo extends StatefulWidget {
  const DatetimeDemo({super.key});

  @override
  State<DatetimeDemo> createState() => _DatetimeDemoState();
}

class _DatetimeDemoState extends State<DatetimeDemo> {

  DateTime selectedDate = DateTime.now();

  TimeOfDay selectedTime = TimeOfDay(hour: 9, minute: 30);

  Future<void> _selectedDate() async {
    final DateTime? date = await showDatePicker(
      context: context, 
      initialDate: selectedDate,
      firstDate: DateTime(1900), 
      lastDate: DateTime(2100),
    );

    if (date != null) {
      setState(() {
        selectedDate = date;
      });
    }
  }

  Future<void> _selectedTime() async {
    final TimeOfDay? time = await showTimePicker(
      context: context, 
      initialTime: selectedTime
    );

    if (time != null) {
      selectedTime = time;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DateTimeDemo"),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: _selectedDate,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(DateFormat.yMMMd().format(selectedDate), style: TextStyle(fontSize: 18.0)),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
            SizedBox(height: 18.0),
            InkWell(
              onTap: _selectedTime,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(selectedTime.format(context), style: TextStyle(fontSize: 18.0)),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}