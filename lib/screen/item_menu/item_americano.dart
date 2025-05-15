import 'package:flutter/material.dart';

class AmericanoItem extends StatefulWidget {
  const AmericanoItem({super.key});

  @override
  State<AmericanoItem> createState() => _AmericanoItemState();
}

class _AmericanoItemState extends State<AmericanoItem> {
  // Status checkbox untuk setiap bahan
  final List<bool> _isChecked = [false, false];

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
            // Gambar Americano
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
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: _isChecked[0],
                      onChanged: (value) {
                        setState(() {
                          _isChecked[0] = value!;
                        });
                      },
                      shape:
                          const CircleBorder(), // Membuat checkbox berbentuk bulat
                      activeColor: const Color(
                        0xFF87CEFA,
                      ), // Warna gradient terang
                    ),
                    const Expanded(
                      child: Text('- 1-2 shot espresso (30-60 ml)'),
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
                      shape:
                          const CircleBorder(), // Membuat checkbox berbentuk bulat
                      activeColor: const Color(
                        0xFFFFA07A,
                      ), // Warna gradient terang
                    ),
                    const Expanded(child: Text('- Air panas secukupnya.')),
                  ],
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
                    'Buat 1 atau 2 shot espresso tergantung pada tingkat kekentalan yang diinginkan.',
                  ),
                ),
                ListTile(
                  leading: Text(
                    '2.',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  title: Text(
                    'Tambahkan air panas ke dalam espresso hingga mencapai volume yang diinginkan (biasanya sekitar 150-200 ml).',
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
