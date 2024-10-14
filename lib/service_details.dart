import 'package:flutter/material.dart';
import 'booking_page.dart'; // Ensure this import is correct
import 'models/service.dart';

class ServiceDetails extends StatelessWidget {
  final Service service;

  ServiceDetails({required this.service});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(service.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(service.icon, size: 100),
            SizedBox(height: 20),
            Text(service.name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('Description of ${service.name} services.'),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BookingPage(
                          serviceName: service.name)), // Pass the service name
                );
              },
              child: Text('Book Now'),
            ),
          ],
        ),
      ),
    );
  }
}
