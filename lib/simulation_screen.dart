import 'package:flutter/material.dart';

class SimulationScreen extends StatefulWidget {
  @override
  _SimulationScreenState createState() => _SimulationScreenState();
}

class _SimulationScreenState extends State<SimulationScreen> {
  final _formKey = GlobalKey<FormState>();
  String _description = '';
  double _amount = 0.0;
  double _totalIncome = 0.0;
  double _totalExpense = 0.0;
  double _balance = 0.0;
  final List<Map<String, dynamic>> _transactions = [];

  void _addTransaction() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        if (_amount >= 0) {
          _totalIncome += _amount;
        } else {
          _totalExpense += _amount;
        }
        _balance = _totalIncome + _totalExpense;

        _transactions.add({
          'description': _description,
          'amount': _amount,
          'date': DateTime.now(),
        });
      });
      _formKey.currentState!.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simulasi Keuangan'),
        backgroundColor: Color(0xFFFFA726), 
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Deskripsi',
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFFFA726)), 
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Deskripsi tidak boleh kosong';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _description = value!;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Jumlah',
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFFFA726)), 
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Jumlah tidak boleh kosong';
                      }
                      if (double.tryParse(value) == null) {
                        return 'Masukkan jumlah yang valid';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _amount = double.parse(value!);
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _addTransaction,
                    child: Text('Tambah Transaksi'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFFA726), 
                      foregroundColor: Colors.white, 
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text('Pendapatan Total', style: TextStyle(fontSize: 18)),
                    Text('Rp $_totalIncome', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
                Column(
                  children: [
                    Text('Pengeluaran Total', style: TextStyle(fontSize: 18)),
                    Text('Rp $_totalExpense', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
                Column(
                  children: [
                    Text('Saldo', style: TextStyle(fontSize: 18)),
                    Text('Rp $_balance', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _transactions.length,
                itemBuilder: (context, index) {
                  final transaction = _transactions[index];
                  return ListTile(
                    title: Text(transaction['description']),
                    subtitle: Text(transaction['amount'].toString()),
                    trailing: Text(
                      '${transaction['date'].day}-${transaction['date'].month}-${transaction['date'].year}',
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
