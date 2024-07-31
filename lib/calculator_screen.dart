import 'package:flutter/material.dart';
import 'dart:math';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _principalController = TextEditingController();
  TextEditingController _rateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  double _result = 0.0;
  String _selectedCalculator = 'Bunga Majemuk';

  void _calculate() {
    if (_formKey.currentState!.validate()) {
      double principal = double.parse(_principalController.text);
      double rate = double.parse(_rateController.text) / 100;
      int time = int.parse(_timeController.text);

      setState(() {
        if (_selectedCalculator == 'Bunga Majemuk') {
          _result = principal * pow((1 + rate), time);
        } else if (_selectedCalculator == 'Hipotek') {
          double monthlyRate = rate / 12;
          int months = time * 12;
          _result = (principal * monthlyRate) / (1 - pow((1 + monthlyRate), -months));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalkulator Keuangan'),
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
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                DropdownButton<String>(
                  value: _selectedCalculator,
                  items: [
                    DropdownMenuItem(value: 'Bunga Majemuk', child: Text('Bunga Majemuk')),
                    DropdownMenuItem(value: 'Hipotek', child: Text('Hipotek')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedCalculator = value!;
                    });
                  },
                ),
                TextFormField(
                  controller: _principalController,
                  decoration: InputDecoration(
                    labelText: 'Jumlah Awal (Rp)',
                    labelStyle: TextStyle(color: Colors.black),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                  style: TextStyle(color: Colors.black),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Harap masukkan jumlah awal';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _rateController,
                  decoration: InputDecoration(
                    labelText: 'Tingkat Bunga (%)',
                    labelStyle: TextStyle(color: Colors.black),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                  style: TextStyle(color: Colors.black),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Harap masukkan tingkat bunga';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _timeController,
                  decoration: InputDecoration(
                    labelText: 'Waktu (tahun)',
                    labelStyle: TextStyle(color: Colors.black),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                  style: TextStyle(color: Colors.black),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Harap masukkan waktu';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _calculate,
                  child: Text('Hitung'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFFA726),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Hasil: Rp ${_result.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
