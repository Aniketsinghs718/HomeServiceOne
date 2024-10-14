// lib/providers/booking_provider.dart
import 'package:flutter/material.dart';

class BookingProvider with ChangeNotifier {
  List<String> _bookingHistory = [];

  List<String> get bookingHistory => _bookingHistory;

  void addBooking(String booking) {
    _bookingHistory.add(booking);
    notifyListeners();
  }
}
