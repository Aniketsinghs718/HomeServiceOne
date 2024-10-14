// lib/service_detail_page.dart
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'booking_page.dart';
import 'models/service_provider.dart';

class ServiceDetailPage extends StatelessWidget {
  final String serviceName;

  // Sample service providers data
  final List<ServiceProvider> providers = [
    ServiceProvider(
      name: 'Provider 1',
      imageUrl: 'https://via.placeholder.com/150',
      rating: 4.5,
      reviews: 20,
    ),
    ServiceProvider(
      name: 'Provider 2',
      imageUrl: 'https://via.placeholder.com/150',
      rating: 4.0,
      reviews: 15,
    ),
    ServiceProvider(
      name: 'Provider 3',
      imageUrl: 'https://via.placeholder.com/150',
      rating: 4.8,
      reviews: 30,
    ),
  ];

  ServiceDetailPage({required this.serviceName});

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launch(launchUri.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(serviceName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Service Providers for $serviceName',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: providers.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: Image.network(providers[index].imageUrl),
                      title: Text(providers[index].name),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Rating: ${providers[index].rating} ★'),
                          Text('Reviews: ${providers[index].reviews}'),
                        ],
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.phone),
                        onPressed: () {
                          _makePhoneCall(
                              '1234567890'); // Replace with the provider's phone number
                        },
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                BookingPage(serviceName: serviceName),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
