import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'account_screen.dart';
import 'occasion_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  Future<http.Response> fetchAlbum() {
    return http.get(Uri.parse('https://apistaging.cadeau.com.sa/api/v1/admin/lookups/occasion_types/:occasion_type_id'));
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: const [
          HomeScreen(),
          OccasionScreen(),
          TopDealScreen(),
          CartScreen(),
          AccountScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.orange.shade900,
        unselectedItemColor: Colors.black,
        selectedFontSize: 16.0,
        unselectedFontSize: 14.0,
        type: BottomNavigationBarType.fixed,
        iconSize: 35,
        selectedLabelStyle: GoogleFonts.jost(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
        unselectedLabelStyle: GoogleFonts.jost(
            color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet_giftcard_outlined),
            label: 'Occasion',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.percent_outlined),
            label: 'Top deal',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box_outlined),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: const Center(
        child: Text('Home Screen'),
      ),
    );
  }
}

class TopDealScreen extends StatelessWidget {
  const TopDealScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Deal'),
      ),
      body: const Center(
        child: Text('Top Deal Screen'),
      ),
    );
  }
}

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: const Center(
        child: Text('Cart Screen'),
      ),
    );
  }
}

