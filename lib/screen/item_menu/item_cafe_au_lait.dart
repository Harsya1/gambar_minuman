import 'package:flutter/material.dart';

class CafeAuLaitItem extends StatefulWidget {
  const CafeAuLaitItem({super.key});

  @override
  State<CafeAuLaitItem> createState() => _CafeAuLaitItemState();
}

class _CafeAuLaitItemState extends State<CafeAuLaitItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cafe Au Lait Recipe'),
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
              'lib/assets/img/cafe_au_lait.png', // Pastikan Anda memiliki file gambar di folder assets
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
                  'Cafe Au Lait',
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                ListTile(
                  leading: Icon(Icons.check),
                  title: Text('- Kopi hitam (150-200 ml)'),
                ),
                ListTile(
                  leading: Icon(Icons.check),
                  title: Text(
                    '- Susu segar (150-200 ml), dapat disesuaikan dengan selera',
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.check),
                  title: Text('- Gula sesuai selera (opsional)'),
                ),
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
                    'Sediakan kopi hitam yang sudah diseduh. Anda bisa menggunakan metode penyeduhan sesuai selera, seperti French press, pour-over, atau mesin espresso.',
                  ),
                ),
                ListTile(
                  leading: Text(
                    '2.',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  title: Text(
                    'Panaskan susu hingga hangat tanpa mendidih. Anda bisa menggunakan steam wand pada mesin espresso atau panci kecil di atas kompor.',
                  ),
                ),
                ListTile(
                  leading: Text(
                    '3.',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  title: Text(
                    'Campurkan kopi dan susu dalam perbandingan proporsi yang sama (1:1).',
                  ),
                ),
                ListTile(
                  leading: Text(
                    '4.',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  title: Text('Tambahkan gula jika diinginkan, aduk rata.'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
