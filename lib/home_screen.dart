import 'package:flutter/material.dart';
import 'widget/function_card.dart';
import 'calculator_screen.dart';
import 'news_screen.dart';
import 'budget_screen.dart';
import 'simulation_screen.dart';
import 'forum_screen.dart';
import 'data_analysis_screen.dart';
import 'profile_screen.dart';
import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> functions = [
    {
      'title': 'Kalkulator Keuangan',
      'image': 'assets/Calculator.png',
      'screen': CalculatorScreen(),
    },
    {
      'title': 'Berita Ekonomi',
      'image': 'assets/news.png',
      'screen': NewsScreen(),
    },
    {
      'title': 'Pengelolaan Anggaran',
      'image': 'assets/budget.png',
      'screen': BudgetScreen(),
    },
    {
      'title': 'Simulasi Keuangan',
      'image': 'assets/simulation.png',
      'screen': SimulationScreen(),
    },
    {
      'title': 'Forum dan Komunitas',
      'image': 'assets/forum.png',
      'screen': ForumScreen(),
    },
    {
      'title': 'Analisis Data',
      'image': 'assets/data_analysis.png',
      'screen': DataAnalysisScreen(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          backgroundColor: Color(0xFFFFA726),
          actions: [
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                  (Route<dynamic> route) => false,
                );
              },
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(text: 'ListView'),
              Tab(text: 'GridView'),
            ],
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.orange.shade50, Colors.orange.shade100],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: TabBarView(
            children: [
              ListView.builder(
                itemCount: functions.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => functions[index]['screen']),
                      );
                    },
                    child: FunctionCard(
                      title: functions[index]['title']!,
                      image: functions[index]['image']!,
                    ),
                  );
                },
              ),
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: functions.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => functions[index]['screen']),
                      );
                    },
                    child: FunctionCard(
                      title: functions[index]['title']!,
                      image: functions[index]['image']!,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
