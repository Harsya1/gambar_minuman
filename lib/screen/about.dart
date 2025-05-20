import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController controllerNama = TextEditingController();
  final TextEditingController controllerPass = TextEditingController();
  final TextEditingController controllerMoto = TextEditingController();

  String? _jk = 'Laki-laki';
  String? agama = 'Islam';
  final List<String> listAgama = ['Islam', 'Kristen', 'Hindu', 'Budha'];
  double nilaiSlider = 50;
  bool nilaiCheckBox = false;
  bool nilaiSwitch = false;

  void kirimData() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder:
            (ctx) => AlertDialog(
              title: const Text("Data Dikirim"),
              content: Text(
                "Nama: ${controllerNama.text}\n"
                "Password: ${controllerPass.text}\n"
                "Moto: ${controllerMoto.text}\n"
                "Gender: $_jk\n"
                "Agama: $agama\n"
                "Nilai Slider: ${nilaiSlider.toInt()}\n"
                "Mahasiswa: $nilaiCheckBox\n"
                "Suka Flutter: $nilaiSwitch",
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(ctx),
                  child: const Text("OK"),
                ),
              ],
            ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color bg = Colors.grey[100]!;
    final Color surface = Colors.grey[200]!;
    final Color primaryText = Colors.grey[900]!;
    final Color accent = Colors.grey[800]!;

    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        title: const Text('About Page'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.5,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Container(
          decoration: BoxDecoration(
            color: surface,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.15),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Form Pendaftaran",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: primaryText,
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: controllerNama,
                  decoration: InputDecoration(
                    labelText: 'Nama',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  validator:
                      (value) =>
                          value!.isEmpty ? 'Nama tidak boleh kosong' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: controllerPass,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  obscureText: true,
                  validator:
                      (value) =>
                          value!.isEmpty ? 'Password tidak boleh kosong' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: controllerMoto,
                  decoration: InputDecoration(
                    labelText: 'Moto Hidup',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text("Jenis Kelamin", style: TextStyle(color: accent)),
                RadioListTile<String>(
                  value: 'Laki-laki',
                  groupValue: _jk,
                  title: const Text("Laki-laki"),
                  onChanged: (value) => setState(() => _jk = value),
                ),
                RadioListTile<String>(
                  value: 'Perempuan',
                  groupValue: _jk,
                  title: const Text("Perempuan"),
                  onChanged: (value) => setState(() => _jk = value),
                ),
                const SizedBox(height: 10),
                Text("Agama", style: TextStyle(color: accent)),
                DropdownButtonFormField<String>(
                  value: agama,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  items:
                      listAgama
                          .map(
                            (String val) =>
                                DropdownMenuItem(value: val, child: Text(val)),
                          )
                          .toList(),
                  onChanged: (value) => setState(() => agama = value),
                ),
                const SizedBox(height: 16),
                Text(
                  "Nilai Slider: ${nilaiSlider.toInt()}",
                  style: TextStyle(color: accent),
                ),
                Slider(
                  value: nilaiSlider,
                  min: 0,
                  max: 100,
                  divisions: 100,
                  label: nilaiSlider.round().toString(),
                  onChanged: (value) => setState(() => nilaiSlider = value),
                ),
                CheckboxListTile(
                  title: const Text("Saya Mahasiswa"),
                  value: nilaiCheckBox,
                  onChanged: (value) => setState(() => nilaiCheckBox = value!),
                ),
                SwitchListTile(
                  title: const Text("Saya Suka Flutter"),
                  value: nilaiSwitch,
                  onChanged: (value) => setState(() => nilaiSwitch = value),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: accent,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: kirimData,
                    child: const Text(
                      "Kirim Data",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
