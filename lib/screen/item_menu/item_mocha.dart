import 'package:flutter/material.dart';

class MochaItem extends StatefulWidget {
  const MochaItem({super.key});

  @override
  State<MochaItem> createState() => _MochaItemState();
}

class _MochaItemState extends State<MochaItem> {
  final List<bool> _isChecked = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mocha Recipe'),
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
            // Gambar Mocha
            Image.asset(
              'lib/assets/img/mocha.png', // Pastikan Anda memiliki file gambar di folder assets
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
                  'Mocha',
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
                const Expanded(child: Text('- 1 shot espresso')),
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
                const Expanded(child: Text('- 2 sendok makan cokelat')),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: _isChecked[2],
                  onChanged: (value) {
                    setState(() {
                      _isChecked[2] = value!;
                    });
                  },
                  shape: const CircleBorder(),
                  activeColor: const Color(0xFFFFD700),
                ),
                const Expanded(child: Text('- 1/2 cup susu panas')),
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
              children: [
                ListTile(
                  leading: const Text(
                    '1.',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  title: const Text(
                    'Siapkan satu shot espresso menggunakan mesin espresso atau alat lain.',
                  ),
                ),
                ListTile(
                  leading: const Text(
                    '2.',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  title: const Text(
                    'Dalam gelas, campurkan sirup cokelat dengan espresso sambil diaduk rata.',
                  ),
                ),
                ListTile(
                  leading: const Text(
                    '3.',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  title: const Text(
                    'Panaskan susu hingga hangat (tidak mendidih), aduk perlahan agar teksturnya lembut.',
                  ),
                ),
                ListTile(
                  leading: const Text(
                    '4.',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  title: const Text(
                    'Tuangkan susu ke dalam campuran espresso dan cokelat.',
                  ),
                ),
                ListTile(
                  leading: const Text(
                    '5.',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  title: const Text('Tambahkan whipped cream di atasnya.'),
                ),
                ListTile(
                  leading: const Text(
                    '6.',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  title: const Text(
                    'Taburi serpihan cokelat atau bubuk kakao jika diinginkan.',
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
