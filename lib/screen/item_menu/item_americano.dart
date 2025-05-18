import 'package:flutter/material.dart';

class AmericanoItem extends StatefulWidget {
  const AmericanoItem({super.key});

  @override
  State<AmericanoItem> createState() => _AmericanoItemState();
}

class _AmericanoItemState extends State<AmericanoItem> {
  // Status checkbox untuk setiap bahan
  final List<bool> _isChecked = [false, false];
  final List<String> _catatanList = [];
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _catatanController = TextEditingController();

  // Variabel untuk dropdown ukuran gelas
  String _selectedSize = 'Small'; // Default
  final Map<String, String> _espressoAmount = {
    'Small': '1 shot espresso (30 ml)',
    'Medium': '1.5 shot espresso (45 ml)',
    'Large': '2 shot espresso (60 ml)',
  };
  final Map<String, String> _waterAmount = {
    'Small': 'Air panas 120 ml',
    'Medium': 'Air panas 150 ml',
    'Large': 'Air panas 200 ml',
  };

  // Fungsi untuk mengirim/simpan catatan
 void kirimCatatan() {
  if (_formKey.currentState!.validate()) {
    setState(() {
      _catatanList.add(_catatanController.text);
    });
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Catatan Tersimpan'),
        content: Text('Catatan kamu: ${_catatanController.text}'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Americano Recipe'),
        automaticallyImplyLeading: false, 
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
              'lib/assets/img/americano.png', 
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

            // Dropdown ukuran gelas
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: DropdownButtonFormField<String>(
                value: _selectedSize,
                decoration: InputDecoration(
                  labelText: 'Pilih Ukuran Gelas',
                  labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.blue[50],
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
                icon: const Icon(Icons.arrow_drop_down, color: Colors.blue),
                dropdownColor: Colors.white,
                style: const TextStyle(fontSize: 16, color: Colors.black),
                items: ['Small', 'Medium', 'Large']
                    .map((size) => DropdownMenuItem(
                          value: size,
                          child: Text(size),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedSize = value!;
                  });
                },
              ),
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
                    Expanded(
                      child: Text('- ${_espressoAmount[_selectedSize]}'),
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
                    Expanded(
                      child: Text('- ${_waterAmount[_selectedSize]}'),
                    ),
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
            const SizedBox(height: 16.0),

            // form catatan pribadi
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Catatan Pribadi:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _catatanController,
                    decoration: const InputDecoration(
                      hintText: 'Tulis catatan atau tips kamu di sini...',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 2,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Catatan tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Catatan Tersimpan'),
                            content: Text('Catatan kamu: ${_catatanController.text}'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                    child: const Text('Simpan Catatan'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}