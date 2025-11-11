import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailProduk extends StatelessWidget {
  final String category;
  final int productId;

  DetailProduk({Key? key, required this.category, required this.productId}) : super(key: key);

  final Map<String, List<Map<String, dynamic>>> allProducts = {
    'Laptop Gaming Entry Level': [
      {
        'id': '1',
        'nama': 'HP Victus 15',
        'model': 'fbxxxxx',
        'processor': 'AMD Ryzen 5 7535HS',
        'ram': '8 GB DDR5',
        'storage': '512 GB SSD',
        'image': '../assets/victus_15.png'
      },
      {
        'id': '2',
        'nama': 'Acer Nitro 16',
        'model': 'an16-xxx',
        'processor': 'Intel Core i5-13500H',
        'ram': '16 GB DDR5',
        'storage': '512 GB SSD',
        'image': '../assets/acer_nitro.jpg'
      },
      {
        'id': '3',
        'nama': 'Axioo Pongo 725',
        'model': 'pongo725',
        'processor': 'Intel Core i7-12650H',
        'ram': '16 GB DDR4',
        'storage': '512 GB SSD',
        'image': '../assets/pongo_725.jpg'
      },
      {
        'id': '4',
        'nama': 'MSI GF63',
        'model': 'gf63-thin',
        'processor': 'Intel Core i5-11400H',
        'ram': '8 GB DDR4',
        'storage': '512 GB SSD',
        'image': '../assets/msi_thin.jpg'
      },
      {
        'id': '5',
        'nama': 'Asus TUF A14',
        'model': 'fa401',
        'processor': 'AMD Ryzen 7 7735HS',
        'ram': '16 GB DDR5',
        'storage': '512 GB SSD',
        'image': '../assets/tuf.jpg'
      }
    ],
    'Handheld Gaming': [
      {
        'id': '1',
        'nama': 'Asus ROG Ally',
        'processor': 'AMD Ryzen Z1 Extreme',
        'ram': '16 GB LPDDR5',
        'storage': '512 GB SSD',
        'image': '../assets/rog_ally.jpg'
      },
      {
        'id': '2',
        'nama': 'Steam Deck',
        'processor': 'AMD APU',
        'ram': '16 GB LPDDR5',
        'storage': '256 GB SSD',
        'image': '../assets/steam_deck.jpg'
      },
      {
        'id': '3',
        'nama': 'Nintendo Switch',
        'processor': 'NVIDIA Custom Tegra',
        'ram': '4 GB LPDDR4',
        'storage': '64GB Internal Storage',
        'image': '../assets/nitendo_switch.jpg'
      }
    ]
  };

  @override
  Widget build(BuildContext context) {
    final productList = allProducts[category] ?? [];
    if (productId >= productList.length) {
      return Scaffold(
        appBar: AppBar(title: Text("Produk Tidak Ditemukan")),
        body: Center(child: Text("Detail produk tidak tersedia.")),
      );
    }
    final product = productList[productId];

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          'Spesifikasi Lengkap',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600, color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 3,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 400,
              ),
              child: Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          product['image'],
                          height: 220,
                          width: double.infinity,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        product['nama'],
                        style: GoogleFonts.poppins(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: Colors.deepPurpleAccent,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      if (product.containsKey('model'))
                        _buildSpecItem("Model", product['model']),
                      if (product.containsKey('processor'))
                        _buildSpecItem("Processor", product['processor']),
                      if (product.containsKey('ram'))
                        _buildSpecItem("RAM", product['ram']),
                      if (product.containsKey('storage'))
                        _buildSpecItem("Storage", product['storage']),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSpecItem(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$title:",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              color: Colors.grey[700],
            ),
          ),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: GoogleFonts.poppins(color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}
