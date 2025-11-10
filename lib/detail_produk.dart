import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailProduk extends StatelessWidget {
  final int productId;

  DetailProduk({Key? key, required this.productId}) : super(key: key);

  final List<Map<String, dynamic>> itemsDetail = [
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
  ];

  @override
  Widget build(BuildContext context) {
    final product = itemsDetail[productId];

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
                maxWidth: 400, // agar card tidak terlalu lebar
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
                      _buildSpecItem("Model", product['model']),
                      _buildSpecItem("Processor", product['processor']),
                      _buildSpecItem("RAM", product['ram']),
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
