import 'dart:async';
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
    'Mocha': MochaItem(),
    'Americano': AmericanoItem(),
    'Cappuchino': CappuchinoItem(),
    'Coffe Latte': CoffeLatteItem(),
    'Long Black': LongBlackItem(),
    'Cafe Au Lait': CafeAuLaitItem(),
    'Expresso': ExpressoItem(),
    'V60': V60Item(),
  };

  final TextEditingController searchController = TextEditingController();
  List<Map<String, String>> filteredItems = [];
  int _currentPage = 0;
  late PageController _pageController;
  Timer? _sliderTimer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    filterItems('');
    _sliderTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_pageController.hasClients) {
        int nextPage = _currentPage + 1;
        if (nextPage >= coffeeItems.length) nextPage = 0;
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
      }
    });
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
      _currentPage = 0;
      if (_pageController.hasClients) {
        _pageController.jumpToPage(0);
      }
    });
  }

  @override
  void dispose() {
    _sliderTimer?.cancel();
    _pageController.dispose();
    super.dispose();
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
            colors: [Color(0xFFFFE4B5), Color(0xFFFFA07A), Color(0xFF87CEFA)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      // TextField untuk pencarian
                      TextField(
                        controller: searchController,
                        onChanged: filterItems,
                        keyboardType: TextInputType.emailAddress,
                        autofocus: true,
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
                      // PageView untuk menampilkan gambar dan nama minuman
                      SizedBox(
                        height: 180,
                        child: PageView.builder(
                          controller: _pageController,
                          itemCount: coffeeItems.length,
                          onPageChanged: (index) {
                            setState(() {
                              _currentPage = index;
                            });
                          },
                          itemBuilder: (context, index) {
                            final item = coffeeItems[index];
                            return Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              elevation: 4,
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.horizontal(
                                      left: Radius.circular(16),
                                    ),
                                    child: Image.asset(
                                      item['image']!,
                                      width: 100,
                                      height: 180,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Text(
                                      item['title']!,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      // Indikator PageView
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          coffeeItems.length,
                          (index) => Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 4,
                              vertical: 8,
                            ),
                            width: _currentPage == index ? 16 : 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color:
                                  _currentPage == index
                                      ? Colors.blueAccent
                                      : Colors.grey,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
                // GridView dalam satu scroll
                SliverGrid(
                  delegate: SliverChildBuilderDelegate((context, index) {
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
                  }, childCount: filteredItems.length),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 3 / 3.5,
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
