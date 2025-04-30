import 'package:flutter/material.dart';
import 'item_menu/item_mocha.dart'; // Import halaman MochaItem
import 'item_menu/item_americano.dart';
import 'item_menu/item_cappuchino.dart';
import 'item_menu/item_coffe_latte.dart';
import 'item_menu/item_long_black.dart';
import 'item_menu/item_cafe_au_lait.dart';
import 'item_menu/item_expresso.dart';
import 'item_menu/item_v60.dart';

class DashboardMinum extends StatefulWidget {
  const DashboardMinum({super.key});

  @override
  State<DashboardMinum> createState() => _DashboardMinumState();
}

class _DashboardMinumState extends State<DashboardMinum> {
  final List<Map<String, String>> coffeeItems = const [
    {'title': 'Mocha', 'image': 'lib/assets/img/mocha.png'},
    {'title': 'Americano', 'image': 'lib/assets/img/americano.png'},
    {'title': 'Cappuchino', 'image': 'lib/assets/img/cappuchino.png'},
    {'title': 'Coffe Latte', 'image': 'lib/assets/img/coffe_latte.png'},
    {'title': 'Long Black', 'image': 'lib/assets/img/long_black.png'},
    {'title': 'Cafe Au Lait', 'image': 'lib/assets/img/cafe_au_lait.png'},
    {'title': 'Expresso', 'image': 'lib/assets/img/expresso.png'},
    {'title': 'V60', 'image': 'lib/assets/img/v60.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF), // Warna putih
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  children: [
                    Image.asset(
                      'lib/assets/img/background.png',
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 16,
                      left: 16,
                      child: Text(
                        'Kedai Lekku',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                          shadows: [
                            Shadow(
                              blurRadius: 6,
                              color: Colors.black.withOpacity(0.7),
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: GridView.builder(
                  itemCount: coffeeItems.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 3 / 3.5,
                  ),
                  itemBuilder: (context, index) {
                    final item = coffeeItems[index];
                    return GestureDetector(
                      onTap: () {
                        if (item['title'] == 'Mocha') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MochaItem(),
                            ),
                          );
                        }
                        if (item['title'] == 'Americano') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AmericanoItem(),
                            ),
                          );
                        }
                        if (item['title'] == 'Cappuchino') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CappuchinoItem(),
                            ),
                          );
                        }
                        if (item['title'] == 'Coffe Latte') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CoffeLatteItem(),
                            ),
                          );
                        }
                        if (item['title'] == 'Long Black') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LongBlackItem(),
                            ),
                          );
                        }
                        if (item['title'] == 'Cafe Au Lait') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CafeAuLaitItem(),
                            ),
                          );
                        }
                        if (item['title'] == 'Expresso') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ExpressoItem(),
                            ),
                          );
                        }
                        if (item['title'] == 'V60') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const V60Item(),
                            ),
                          );
                        }
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          color: const Color(0xFFf2f2f2),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Image.asset(
                                  item['image']!,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12),
                                child: Text(
                                  item['title']!,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
