// lib/booking_page.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date formatting

class BookingPage extends StatefulWidget {
  final String serviceName;

  BookingPage({required this.serviceName});

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = DateFormat('yyyy-MM-dd').format(_selectedDate!);
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
        _timeController.text = _selectedTime!.format(context);
      });
    }
  }

  void _submitBooking() {
    if (_formKey.currentState!.validate()) {
      final booking = {
        'service': widget.serviceName,
        'date': _dateController.text,
        'time': _timeController.text,
        'address': _addressController.text,
      };
      Navigator.pop(context, booking);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book ${widget.serviceName} Service'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                controller: _dateController,
                decoration: InputDecoration(
                  labelText: "Select Date",
                  prefixIcon: Icon(Icons.calendar_today),
                  border: OutlineInputBorder(),
                ),
                readOnly: true,
                onTap: () => _selectDate(context),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a date';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _timeController,
                decoration: InputDecoration(
                  labelText: "Select Time",
                  prefixIcon: Icon(Icons.access_time),
                  border: OutlineInputBorder(),
                ),
                readOnly: true,
                onTap: () => _selectTime(context),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a time';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(
                  labelText: "Enter Address",
                  prefixIcon: Icon(Icons.location_on),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _submitBooking,
                child: Text('Book Now'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
