import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amajon',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey.shade100,
        primarySwatch: Colors.blue,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 2,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
        ),
      ),
      home: const ECommerceScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ECommerceScreen extends StatelessWidget {
  const ECommerceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Amajon Store'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Akun',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.shopping_cart),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Banner Promo dengan Gradient
              Container(
                margin: const EdgeInsets.all(16.0),
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blueAccent, Colors.lightBlueAccent],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: const Text(
                  'PROMO SPESIAL HARI INI',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),

              // Informasi Ongkir
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.discount, color: Colors.red),
                  SizedBox(width: 8),
                  Text("Gratis Ongkir Seluruh Indonesia"),
                  SizedBox(width: 8),
                  Icon(Icons.local_shipping, color: Colors.green),
                ],
              ),

              const SizedBox(height: 16.0),

              // Produk 1 dengan InkWell
              _buildProductCard(
                title: 'Sepatu Running',
                rating: '4.8',
                price: 'Rp 750.000',
                estimate: 'Estimasi 2-3 hari',
                backgroundColor: Colors.white,
              ),

              // Produk 2 dengan warna latar berbeda
              _buildProductCard(
                title: 'Tas Ransel',
                rating: '4.6',
                price: 'Rp 350.000',
                estimate: 'Estimasi 1-2 hari',
                backgroundColor: Colors.green.shade50,
              ),

              // Kategori
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Wrap(
                  spacing: 16.0,
                  runSpacing: 16.0,
                  alignment: WrapAlignment.spaceAround,
                  children: [
                    _buildCategory(Icons.shopping_bag, "Pakaian"),
                    _buildCategory(Icons.watch, "Aksesoris"),
                    _buildCategory(Icons.devices, "Elektronik"),
                    _buildCategory(Icons.fastfood, "Makanan"),
                  ],
                ),
              ),

              // Footer Promo dengan warna biru
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24.0),
                color: Colors.blue.shade800,
                child: const Text(
                  "Nikmati Cashback hingga 50% setiap hari!",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductCard({
    required String title,
    required String rating,
    required String price,
    required String estimate,
    required Color backgroundColor,
  }) {
    return InkWell(
      onTap: () {}, // interaksi tap
      borderRadius: BorderRadius.circular(12),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: backgroundColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 6,
              offset: const Offset(0, 4),
            ),
          ],
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style:
                  const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber),
                const SizedBox(width: 4),
                Text(rating),
              ],
            ),
            const SizedBox(height: 8.0),
            Text(price,
                style: const TextStyle(
                    color: Colors.blueAccent, fontSize: 16.0)),
            const SizedBox(height: 4.0),
            Row(
              children: [
                const Icon(Icons.local_shipping),
                const SizedBox(width: 4),
                Text(estimate),
              ],
            ),
            const SizedBox(height: 12.0),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Beli'),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCategory(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue.shade50,
          ),
          child: Icon(icon, color: Colors.blue, size: 30),
        ),
        const SizedBox(height: 6),
        Text(label),
      ],
    );
  }
}
