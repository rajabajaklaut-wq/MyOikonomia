import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  final List<Map<String, String>> news = [
    {
      'title': 'Ekonomi Global Mengalami Pertumbuhan Positif',
      'image': 'assets/news1.png',
      'description': 'Ekonomi global menunjukkan pertumbuhan positif pada kuartal pertama tahun ini, didorong oleh peningkatan aktivitas industri dan konsumsi.',
    },
    {
      'title': 'Investasi di Pasar Saham Meningkat',
      'image': 'assets/news2.png',
      'description': 'Investasi di pasar saham meningkat signifikan dengan banyak investor yang mencari peluang di tengah ketidakpastian ekonomi.',
    },
    {
      'title': 'Pemerintah Meluncurkan Program Stimulus Baru',
      'image': 'assets/news3.png',
      'description': 'Pemerintah meluncurkan program stimulus baru untuk mendukung sektor usaha kecil dan menengah yang terdampak pandemi.',
    },
    {
      'title': 'Harga Minyak Dunia Turun',
      'image': 'assets/news4.png',
      'description': 'Harga minyak dunia mengalami penurunan setelah adanya peningkatan produksi dari negara-negara OPEC.',
    },
    {
      'title': 'Bank Sentral Menahan Suku Bunga',
      'image': 'assets/news5.png',
      'description': 'Bank sentral memutuskan untuk menahan suku bunga acuan di tengah ketidakpastian ekonomi global.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Berita Ekonomi'),
        backgroundColor: Color(0xFFFFA726), 
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: news.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8),
              color: Colors.white, 
              elevation: 4, 
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(news[index]['image']!, fit: BoxFit.cover),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      news[index]['title']!,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      news[index]['description']!,
                      style: TextStyle(color: Colors.black87),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
