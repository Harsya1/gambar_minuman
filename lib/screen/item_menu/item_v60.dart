import 'package:flutter/material.dart';

class V60Item extends StatefulWidget {
  const V60Item({super.key});

  @override
  State<V60Item> createState() => _V60ItemState();
}

class _V60ItemState extends State<V60Item> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('V60 Recipe'),
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
              'lib/assets/img/v60.png', // Pastikan Anda memiliki file gambar di folder assets
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
                  'V60',
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
                  title: Text(
                    '- 15–20 gram bubuk kopi kasar (tergantung takaran air)',
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.check),
                  title: Text('- 250–300 ml air panas (sekitar 93–96°C)'),
                ),
                ListTile(
                  leading: Icon(Icons.check),
                  title: Text('- Kertas saring V60'),
                ),
                ListTile(
                  leading: Icon(Icons.check),
                  title: Text('- Teko atau mug untuk menampung hasil seduhan'),
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
                    'Pasang kertas saring ke dalam corong V60 dan basahi dengan air panas untuk menghilangkan residu kertas.',
                  ),
                ),
                ListTile(
                  leading: Text(
                    '2.',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  title: Text(
                    'Tambahkan bubuk kopi secara merata ke dalam kertas saring.',
                  ),
                ),
                ListTile(
                  leading: Text(
                    '3.',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  title: Text(
                    'Tuangkan air panas secara perlahan-lahan dalam gerakan melingkar, mulai dari tengah ke luar.',
                  ),
                ),
                ListTile(
                  leading: Text(
                    '4.',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  title: Text(
                    'Biarkan kopi terseduh sepenuhnya dan siap disajikan.',
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
