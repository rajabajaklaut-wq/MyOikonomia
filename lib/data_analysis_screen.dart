import 'package:flutter/material.dart';

class DataAnalysisScreen extends StatelessWidget {
  final List<Map<String, dynamic>> _data = [
    {'month': 'Januari', 'income': 1000000, 'expense': 900000},
    {'month': 'Februari', 'income': 1000000, 'expense': 950000},
    {'month': 'Maret', 'income': 1000000, 'expense': 830000},
    {'month': 'April', 'income': 1000000, 'expense': 900000},
    {'month': 'Mei', 'income': 1000000, 'expense': 970000},
    {'month': 'Juni', 'income': 1000000, 'expense': 980000},
    {'month': 'Juli', 'income': 1000000, 'expense': 880000},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Analisis Data'),
        backgroundColor: Color(0xFFFFA726),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Analisis Pengeluaran Bulanan',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: _data.length,
                  itemBuilder: (context, index) {
                    final item = _data[index];
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      color: Colors.white,
                      elevation: 4,
                      child: ListTile(
                        title: Text(
                          item['month'],
                          style: TextStyle(color: Colors.black),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Pendapatan: Rp ${item['income']}',
                              style: TextStyle(color: Colors.black),
                            ),
                            Text(
                              'Pengeluaran: Rp ${item['expense']}',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
