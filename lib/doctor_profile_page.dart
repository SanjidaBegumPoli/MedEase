import 'package:flutter/material.dart';

// This list holds the booked appointments globally
List<Map<String, String>> bookedAppointments = [];

class DoctorProfilePage extends StatelessWidget {
  final Map<String, String> doctor;

  DoctorProfilePage({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(doctor['name']!),
        backgroundColor: Colors.blue.shade500,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: CircleAvatar(
                  radius: 55,
                  backgroundColor: Colors.transparent,
                  child: SizedBox(
                    width: 90,
                    height: 90,
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/02.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  Text(
                    doctor['name']!,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Ubuntu',
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  Text(
                    doctor['specialization']!,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                      fontFamily: 'Ubuntu',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              elevation: 5,
              margin: EdgeInsets.symmetric(horizontal: 12),
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    buildInfoTile('Degree', doctor['degree']!),
                    buildInfoTile('Availability', doctor['availability']!),
                    buildInfoTile('Location', doctor['location']!),
                    buildInfoTile('Success Rate', doctor['successRate']!),
                    buildInfoTile('Phone', doctor['contact']!),
                    buildInfoTile('Email', doctor['email']!),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                bookedAppointments.add({
                  'name': doctor['name']!,
                  'specialization': doctor['specialization']!,
                  'location': doctor['location']!,
                  'availability': doctor['availability']!,
                  'contact': doctor['contact']!,
                });

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Appointment booked successfully!',
                      style: TextStyle(
                        fontFamily: 'Ubuntu',
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'Book Appointment',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Ubuntu',
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInfoTile(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label: ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Ubuntu',
              fontSize: 16,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontFamily: 'Ubuntu',
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
