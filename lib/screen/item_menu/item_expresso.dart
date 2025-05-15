import 'package:flutter/material.dart';

class ExpressoItem extends StatefulWidget {
  const ExpressoItem({super.key});

  @override
  State<ExpressoItem> createState() => _ExpressoItemState();
}

class _ExpressoItemState extends State<ExpressoItem> {
  final List<bool> _isChecked = [false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Espresso Recipe'),
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
              'lib/assets/img/expresso.png', // Pastikan Anda memiliki file gambar di folder assets
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
                  'Expresso',
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
                      shape: const CircleBorder(),
                      activeColor: const Color(0xFF87CEFA),
                    ),
                    const Expanded(child: Text('- 1 shot espresso (30 ml)')),
                  ],
                ),
                const ListTile(
                  leading: Icon(Icons.check),
                  title: Text(
                    '- 7-10 gram bubuk kopi halus (sesuai takaran portafilter)',
                  ),
                ),
                const ListTile(
                  leading: Icon(Icons.check),
                  title: Text('- Air bersih secukupnya'),
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
                    'Masukkan bubuk kopi ke dalam portafilter dan ratakan permukaannya.',
                  ),
                ),
                ListTile(
                  leading: Text(
                    '2.',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  title: Text(
                    'Tempatkan portafilter ke dalam mesin espresso dan tekan tombol untuk memulai proses ekstraksi.',
                  ),
                ),
                ListTile(
                  leading: Text(
                    '3.',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  title: Text(
                    'Hasilkan sekitar 30 ml expreso (single shoot) atau 60 ml (double shoot).',
                  ),
                ),
                ListTile(
                  leading: Text(
                    '4.',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  title: Text(
                    'Nikmati expresso murni atau gunakan sebagai dasar minuman lain',
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
