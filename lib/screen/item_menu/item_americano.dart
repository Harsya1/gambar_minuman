import 'package:flutter/material.dart';

class AmericanoItem extends StatefulWidget {
  const AmericanoItem({super.key});

  @override
  State<AmericanoItem> createState() => _AmericanoItemState();
}

class _AmericanoItemState extends State<AmericanoItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Americano Recipe'),
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
              'lib/assets/img/americano.png', // Pastikan Anda memiliki file gambar di folder assets
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
                  'Americano',
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
                  title: Text('- 1-2 shot espresso (30-60 ml)'),
                ),
                ListTile(
                  leading: Icon(Icons.check),
                  title: Text('- Air panas secukupnya.'),
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
                    'Buat 1 atau 2 shot expresso tergantung pada tingkat kekentalan yang diinginkan',
                  ),
                ),
                ListTile(
                  leading: Text(
                    '2.',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  title: Text(
                    'Tambahkan air panas ke dalam expersso hingga mencapai volume yang diinginkan (biasanya sekitar 150-200 ml).',
                  ),
                ),
                ListTile(
                  leading: Text(
                    '3.',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  title: Text('Aduk rata dan siap disajikan.'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
