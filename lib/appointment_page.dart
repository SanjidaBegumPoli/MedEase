
import 'package:flutter/material.dart';

class AppointmentPage extends StatelessWidget {
  final Map<String, String> doctor;

  const AppointmentPage({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointment with ${doctor['name']}'),
        backgroundColor: Colors.blue.shade500,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Doctor: ${doctor['name']}',
              style: TextStyle(fontSize: 20, fontFamily: 'Ubuntu'),
            ),
            SizedBox(height: 8),
            Text(
              'Specialization: ${doctor['specialization']}',
              style: TextStyle(fontSize: 18, fontFamily: 'Ubuntu'),
            ),
            SizedBox(height: 8),
            Text(
              'Location: ${doctor['location']}',
              style: TextStyle(fontSize: 18, fontFamily: 'Ubuntu'),
            ),
            SizedBox(height: 8),
            Text(
              'Availability: ${doctor['availability']}',
              style: TextStyle(fontSize: 18, fontFamily: 'Ubuntu'),
            ),
            SizedBox(height: 8),
            Text(
              'Contact: ${doctor['contact']}',
              style: TextStyle(fontSize: 18, fontFamily: 'Ubuntu'),
            ),
          ],
        ),
      ),
    );
  }
}
