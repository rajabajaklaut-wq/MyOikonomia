import 'package:flutter/material.dart';

class ForumScreen extends StatelessWidget {
  final List<Map<String, dynamic>> _posts = [
    {
      'username': 'User1',
      'title': 'Bagaimana cara mengelola keuangan dengan baik?',
      'content': 'Saya ingin tahu tips dan trik untuk mengelola keuangan saya dengan lebih baik. Ada saran?',
      'comments': [
        'Cobalah untuk membuat anggaran bulanan dan patuhi itu.',
        'Selalu sisihkan sebagian pendapatan untuk tabungan.'
      ],
      'date': DateTime.now().subtract(Duration(days: 1)),
    },
    {
      'username': 'User2',
      'title': 'Pengalaman investasi di pasar saham',
      'content': 'Saya baru saja mulai berinvestasi di pasar saham dan ingin berbagi pengalaman saya.',
      'comments': [
        'Terima kasih telah berbagi! Saya juga tertarik untuk mulai berinvestasi.',
        'Apa saja saham yang Anda rekomendasikan untuk pemula?'
      ],
      'date': DateTime.now().subtract(Duration(days: 2)),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forum dan Komunitas'),
        backgroundColor: Color(0xFFFFA726),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: _posts.length,
          itemBuilder: (context, index) {
            final post = _posts[index];
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8),
              color: Colors.white,
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post['title'],
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'oleh ${post['username']}',
                      style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic, color: Colors.black54),
                    ),
                    SizedBox(height: 10),
                    Text(post['content'], style: TextStyle(color: Colors.black)),
                    SizedBox(height: 10),
                    Text(
                      'Komentar:',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    for (var comment in post['comments'])
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Text('- $comment', style: TextStyle(color: Colors.black87)),
                      ),
                    SizedBox(height: 10),
                    Text(
                      '${post['date'].day}-${post['date'].month}-${post['date'].year}',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xFFFFA726),
      ),
    );
  }
}
