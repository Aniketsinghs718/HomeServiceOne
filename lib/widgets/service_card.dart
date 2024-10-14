import 'package:flutter/material.dart';
import '../models/service.dart';

class ServiceCard extends StatelessWidget {
  final Service service;
  final VoidCallback onTap;

  ServiceCard({required this.service, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(10),
      child: ListTile(
        leading: Icon(service.icon, size: 40),
        title: Text(service.name),
        trailing: Icon(Icons.arrow_forward),
        onTap: onTap,
      ),
    );
  }
}
