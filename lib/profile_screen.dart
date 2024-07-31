import 'package:flutter/material.dart';
import 'package:myapp/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String username = 'un01';
    final String email = 'Penggunapertama@gmail.com';
    final String phoneNumber = '081234567890';

    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
        backgroundColor: Color(0xFFFFA726), 
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/Profile_Picture.png'), 
            ),
            SizedBox(height: 16),
            Text(
              username,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black, 
              ),
            ),
            SizedBox(height: 8),
            Text(
              email,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87, 
              ),
            ),
            SizedBox(height: 8),
            Text(
              phoneNumber,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87, 
              ),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                  (Route<dynamic> route) => false,
                );
              },
              child: Text('Logout'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFFFA726)), 
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white), 
              ),
            ),
          ],
        ),
      ),
    );
  }
}
