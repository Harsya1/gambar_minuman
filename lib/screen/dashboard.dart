import 'package:flutter/material.dart';
import 'item_menu/item_mocha.dart';
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

  final Map<String, Widget> coffeePages = {
    'Mocha': const MochaItem(),
    'Americano': const AmericanoItem(),
    'Cappuchino': const CappuchinoItem(),
    'Coffe Latte': const CoffeLatteItem(),
    'Long Black': const LongBlackItem(),
    'Cafe Au Lait': const CafeAuLaitItem(),
    'Expresso': const ExpressoItem(),
    'V60': const V60Item(),
  };

  final TextEditingController searchController = TextEditingController();
  List<Map<String, String>> filteredItems = [];

  @override
  void initState() {
    super.initState();
    filterItems(''); // Awalnya tampilkan semua item
  }

  void filterItems(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredItems = coffeeItems;
      } else {
        filteredItems =
            coffeeItems
                .where(
                  (item) => item['title']!.toLowerCase().contains(
                    query.toLowerCase(),
                  ),
                )
                .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: Colors.white,
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: [
            Container(
              color: Colors.black,
              width: double.infinity,
              height: 150,
              alignment: Alignment.center,
              child: const Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.black),
              title: const Text('Home', style: TextStyle(color: Colors.black)),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/');
              },
            ),
            ListTile(
              leading: const Icon(Icons.info, color: Colors.black),
              title: const Text('About', style: TextStyle(color: Colors.black)),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/about');
              },
            ),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFFE4B5), // Warna cerah 1 (Moccasin)
              Color(0xFFFFA07A), // Warna cerah 2 (Light Salmon)
              Color(0xFF87CEFA), // Warna cerah 3 (Light Sky Blue)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // TextField untuk pencarian
                TextField(
                  controller: searchController,
                  onChanged: filterItems,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Cari Resep minuman...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                    filled: true,
                  ),
                ),
                const SizedBox(height: 16),
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
                    itemCount: filteredItems.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 12,
                          childAspectRatio: 3 / 3.5,
                        ),
                    itemBuilder: (context, index) {
                      final item = filteredItems[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => coffeePages[item['title']]!,
                            ),
                          );
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
      ),
    );
  }
}
