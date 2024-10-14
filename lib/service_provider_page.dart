import 'package:flutter/material.dart';
import 'booking_page.dart';
import 'package:url_launcher/url_launcher.dart';

class ServiceProviderPage extends StatelessWidget {
  final String serviceName;

  ServiceProviderPage({required this.serviceName});

  void _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  final List<Map<String, dynamic>> providers = [
    {
      'name': 'John Doe',
      'rating': 4.5,
      'icon': Icons.person,
      'phone': '1234567890',
    },
    {
      'name': 'Jane Smith',
      'rating': 4.8,
      'icon': Icons.person,
      'phone': '0987654321',
    },
    {
      'name': 'Mike Johnson',
      'rating': 4.2,
      'icon': Icons.person,
      'phone': '1122334455',
    },
    {
      'name': 'Emily Davis',
      'rating': 4.7,
      'icon': Icons.person,
      'phone': '2233445566',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(serviceName),
      ),
      body: ListView.builder(
        itemCount: providers.length,
        itemBuilder: (context, index) {
          final provider = providers[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              leading:
                  Icon(provider['icon'], size: 50, color: Colors.blueAccent),
              title: Text(provider['name']),
              subtitle: Text('Rating: ${provider['rating']}'),
              trailing: ElevatedButton(
                onPressed: () {
                  _makePhoneCall(provider['phone']);
                },
                child: Text('Call'),
              ),
              onTap: () async {
                // Navigate to the Booking Page
                final booking = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookingPage(serviceName: serviceName),
                  ),
                );

                if (booking != null) {
                  // Return booking information back to the home screen
                  Navigator.pop(context, booking);
                }
              },
            ),
          );
        },
      ),
    );
  }
}
