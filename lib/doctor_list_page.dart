import 'package:flutter/material.dart';
import 'doctor_profile_page.dart';

class DoctorListPage extends StatelessWidget {
  final String category;

  const DoctorListPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    
    final List<Map<String, String>> doctors = List.generate(10, (index) {
      return {
        'name': 'Dr. ${['John Smith', 'Emily Khan', 'Robert Ali', 'Sophia Roy', 'Michael Zaman', 'Ayesha Islam', 'David Chowdhury', 'Sarah Tanvir', 'Imran Haque', 'Fatema Noor'][index]}',
        'specialization': category,
        'degree': 'MBBS, FCPS, MD',
        'availability': 'Sun - Thu | 4:00 PM - 9:00 PM',
        'location': 'MediCare Hospital, Dhaka',
        'successRate': '${90 + index % 5}%',
        'contact': '+88012345678$index',
        'email': 'doctor${index + 1}@medease.com'
      };
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('$category Doctors'),
        backgroundColor: Colors.blue.shade500,
        
      ),
      body: ListView.builder(
        itemCount: doctors.length,
        itemBuilder: (context, index) {
          final doctor = doctors[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/images/02.png'),
            ),
            title: Text(
              doctor['name']!,
              style: TextStyle(fontFamily: 'Ubuntu', fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              doctor['specialization']!,
              style: TextStyle(fontFamily: 'Ubuntu'),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DoctorProfilePage(doctor: doctor),
                ),
              );
            },
          );
        },
      ),
    );
  }
}