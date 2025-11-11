import 'package:flutter/material.dart';
import 'detail_produk.dart';

class ListProduk extends StatelessWidget {
  ListProduk({super.key});

  final List<Map<String, String>> laptopProducts = [
    {
      "nama": "Hp Victus 15",
      "image": "../assets/victus_15.png",
    },
    {
      "nama": "Acer Nitro 16",
      "image": "../assets/acer_nitro.jpg",
    },
    {
      "nama": "Axioo Pongo 725",
      "image": "../assets/pongo_725.jpg",
    },
    {
      "nama": "MSI GF63",
      "image": "../assets/msi_thin.jpg",
    },
    {
      "nama": "Asus TUF A14",
      "image": "../assets/tuf.jpg",
    },
  ];

  final List<Map<String, String>> handheldProducts = [
    {
      "nama": "Asus ROG Ally",
      "image": "../assets/rog_ally.jpg",
    },
    {
      "nama": "Steam Deck",
      "image": "../assets/steam_deck.jpg",
    },
    {
      "nama": "Nintendo Switch",
      "image": "../assets/nitendo_switch.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          'Daftar Produk',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurpleAccent),
        ),
        centerTitle: true,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProductList(context, 'Laptop Gaming Entry Level', laptopProducts),
            const SizedBox(height: 24),
            _buildProductList(context, 'Handheld Gaming', handheldProducts),
          ],
        ),
      ),
    );
  }

  Widget _buildProductList(BuildContext context, String title, List<Map<String, String>> products) {
    return Card(
      elevation: 4,
      shadowColor: Colors.black26,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 20),
            width: double.infinity,
            height: 50,
            color: Colors.deepPurpleAccent,
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(12),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailProduk(category: title, productId: index),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          product['image']!,
                          width: 80,
                          height: 80,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          product['nama']!,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      const Icon(Icons.arrow_forward_ios,
                          color: Colors.grey, size: 18),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
