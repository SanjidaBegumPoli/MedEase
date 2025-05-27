import 'package:flutter/material.dart';
import 'edit_profile.dart';
import 'doctor_list_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  String name = 'Sanjida Chowdhury';
  String email = 'sanjida@example.com';
  String phone = '+8801234567890';

  final TextEditingController _searchController = TextEditingController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Map<String, String>> categories = [
    {'title': 'Cardiologist', 'image': 'assets/images/01.png'},
    {'title': 'Dermatologist', 'image': 'assets/images/01.png'},
    {'title': 'Neurologist', 'image': 'assets/images/01.png'},
    {'title': 'Pediatrician', 'image': 'assets/images/01.png'},
    {'title': 'Orthopedic', 'image': 'assets/images/01.png'},
    {'title': 'Psychiatrist', 'image': 'assets/images/01.png'},
    {'title': 'Gynecologist', 'image': 'assets/images/01.png'},
    {'title': 'Urologist', 'image': 'assets/images/01.png'},
    {'title': 'Oncologist', 'image': 'assets/images/01.png'},
    {'title': 'ENT Specialist', 'image': 'assets/images/01.png'},
    {'title': 'Ophthalmologist', 'image': 'assets/images/01.png'},
    {'title': 'Dentist', 'image': 'assets/images/01.png'},
    {'title': 'Gastroenterologist', 'image': 'assets/images/01.png'},
    {'title': 'General Physician', 'image': 'assets/images/01.png'},
  ];

  List<Widget> get _pages => [
        buildHomePage(),
        buildAppointmentsPage(),
        buildProfilePage(),
      ];

  Widget buildHomePage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          color: Colors.lightBlueAccent,
          child: Text(
            'Welcome, $name',
            style: const TextStyle(
              fontSize: 18,
              fontFamily: 'Ubuntu',
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: categories.map((category) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DoctorListPage(
                          category: category['title']!,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade400,
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: Image.asset(
                            category['image']!,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Text(
                          category['title']!,
                          style: const TextStyle(
                            fontSize: 18,
                            fontFamily: 'Ubuntu',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildAppointmentsPage() {
    return const Center(
      child: Text(
        'Appointments Page',
        style: TextStyle(fontSize: 20, fontFamily: 'Ubuntu'),
      ),
    );
  }

  Widget buildProfilePage() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade100,
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/profile.png'),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            name,
            style: const TextStyle(
              fontSize: 22,
              fontFamily: 'Ubuntu',
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            email,
            style: const TextStyle(
              fontSize: 16,
              fontFamily: 'Ubuntu',
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            phone,
            style: const TextStyle(
              fontSize: 16,
              fontFamily: 'Ubuntu',
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 20),
          const Divider(thickness: 1),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text(
              'Edit Profile',
              style: TextStyle(fontFamily: 'Ubuntu'),
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () async {
              var updated = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditProfilePage(
                    name: name,
                    email: email,
                    phone: phone,
                  ),
                ),
              );

              if (updated != null && updated is Map<String, String>) {
                setState(() {
                  name = updated['name']!;
                  email = updated['email']!;
                  phone = updated['phone']!;
                });
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text(
              'Logout',
              style: TextStyle(fontFamily: 'Ubuntu'),
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/login',
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }

  void _showSearchDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Search Category',
            style: TextStyle(fontFamily: 'Ubuntu'),
          ),
          content: TextField(
            controller: _searchController,
            decoration: const InputDecoration(
              hintText: 'Type a category...',
              hintStyle: TextStyle(fontFamily: 'Ubuntu'),
            ),
            style: const TextStyle(fontFamily: 'Ubuntu'),
          ),
          actions: [
            TextButton(
              child: const Text('Cancel', style: TextStyle(fontFamily: 'Ubuntu')),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            ElevatedButton(
              child: const Text('Search', style: TextStyle(fontFamily: 'Ubuntu')),
              onPressed: () {
                final query = _searchController.text.trim();
                final match = categories.firstWhere(
                  (category) => category['title']!.toLowerCase() == query.toLowerCase(),
                  orElse: () => {},
                );

                Navigator.pop(context); // close dialog

                if (match.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DoctorListPage(
                        category: match['title']!,
                      ),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('No category found.', style: TextStyle(fontFamily: 'Ubuntu')),
                    ),
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MedEase',
          style: TextStyle(fontFamily: 'Ubuntu', color: Colors.white),
        ),
        backgroundColor: Colors.blue.shade500,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: _showSearchDialog,
          ),
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Settings'),
                  content: const Text('Settings options go here.'),
                  actions: [
                    TextButton(
                      child: const Text('Close'),
                      onPressed: () => Navigator.pop(context),
                    )
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [Expanded(child: _pages[_selectedIndex])],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedLabelStyle: const TextStyle(
          fontFamily: 'Ubuntu',
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: const TextStyle(
          fontFamily: 'Ubuntu',
        ),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Appointments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
