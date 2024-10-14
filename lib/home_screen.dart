// lib/home_screen.dart
import 'package:flutter/material.dart';
import 'booking_page.dart'; // Ensure this import is present

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, String>> _bookings = [];

  void _addBooking(Map<String, String> booking) {
    setState(() {
      _bookings.add(booking);
    });
  }

  final List<Map<String, dynamic>> services = [
    {'name': 'Plumbing', 'icon': Icons.plumbing},
    {'name': 'Electrical', 'icon': Icons.electrical_services},
    {'name': 'Cleaning', 'icon': Icons.cleaning_services},
    {'name': 'Gardening', 'icon': Icons.grass},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Service App'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Grid of Services
            GridView.builder(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                childAspectRatio: 1.2, // Adjust this for grid item aspect ratio
              ),
              itemCount: services.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(), // Prevent scrolling
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () async {
                    final booking = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            BookingPage(serviceName: services[index]['name']!),
                      ),
                    );

                    if (booking != null) {
                      _addBooking(booking);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              'Booking for ${booking['service']} successful!'),
                        ),
                      );
                    }
                  },
                  child: Card(
                    elevation: 4.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(services[index]['icon'],
                            size: 60, color: Colors.blueAccent),
                        SizedBox(height: 10),
                        Text(
                          services[index]['name']!,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

            // Booking History Section
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                'Booking History',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ..._bookings.map((booking) {
              return Card(
                margin: EdgeInsets.symmetric(vertical: 5.0),
                child: ListTile(
                  title: Text(booking['service']!),
                  subtitle: Text(
                    'Date: ${booking['date']!}\n'
                    'Time: ${booking['time']!}\n'
                    'Address: ${booking['address']!}',
                  ),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
