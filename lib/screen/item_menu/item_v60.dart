import 'package:flutter/material.dart';

class V60Item extends StatefulWidget {
  const V60Item({super.key});

  @override
  State<V60Item> createState() => _V60ItemState();
}

class _V60ItemState extends State<V60Item> {
  final List<bool> _isChecked = [false, false, false];

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
                const Expanded(child: Text('- 15 gram kopi bubuk kasar')),
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
                const Expanded(child: Text('- 250 ml air panas (93-96°C)')),
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
                const Expanded(child: Text('- Kertas saring V60')),
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
