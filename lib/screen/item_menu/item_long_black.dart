import 'package:flutter/material.dart';

class LongBlackItem extends StatefulWidget {
  const LongBlackItem({super.key});

  @override
  State<LongBlackItem> createState() => _LongBlackItemState();
}

class _LongBlackItemState extends State<LongBlackItem> {
  final List<bool> _isChecked = [false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Long Black Recipe'),
        automaticallyImplyLeading: false, // Hilangkan tombol back default
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context); // Kembali ke halaman sebelumnya
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(
                    0.7,
                  ), // Warna putih dengan opacity 70%
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(8.0),
                child: const Icon(
                  Icons.arrow_back, // Ikon back
                  color: Colors.black, // Warna ikon
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar V60
            Image.asset(
              'lib/assets/img/long_black.png', // Pastikan Anda memiliki file gambar di folder assets
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16.0),

            // Judul Resep
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Long Black',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Recipe',
                  style: TextStyle(fontSize: 18.0, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 16.0),

            // Daftar Bahan
            const Text(
              'Bahan-bahan:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                Checkbox(
                  value: _isChecked[0],
                  onChanged: (value) {
                    setState(() {
                      _isChecked[0] = value!;
                    });
                  },
                  shape: const CircleBorder(),
                  activeColor: const Color(0xFF87CEFA),
                ),
                const Expanded(
                  child: Text('- 2 Shot espresso (sekitar 60 ml)'),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: _isChecked[1],
                  onChanged: (value) {
                    setState(() {
                      _isChecked[1] = value!;
                    });
                  },
                  shape: const CircleBorder(),
                  activeColor: const Color(0xFFFFA07A),
                ),
                const Expanded(child: Text('- Air panas (sekitar 120 ml)')),
              ],
            ),
            const SizedBox(height: 16.0),

            // Cara Pembuatan
            const Text(
              'Cara Pembuatan:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                ListTile(
                  leading: Text(
                    '1.',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  title: Text(
                    'Isi Cangkir dengan air panas hingga setengah peenuh.',
                  ),
                ),
                ListTile(
                  leading: Text(
                    '2.',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  title: Text(
                    'Tambahkan 2 shot espresso ke dalam cangkir yang sudah diisi air panas tersebut.',
                  ),
                ),
                ListTile(
                  leading: Text(
                    '3.',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  title: Text(
                    'Gunakan rasio 1:2 antara expresso dan air untuk menciptakan rasa yang kuat namun tidak terlalu pekat',
                  ),
                ),
                ListTile(
                  leading: Text(
                    '4.',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  title: Text(
                    'Aduk dan nikmati Long Black anda selagi hangat.',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
