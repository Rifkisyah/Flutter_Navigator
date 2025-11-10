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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          'Laptop Gaming Entry Level',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        elevation: 2,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        itemCount: laptopProducts.length,
        itemBuilder: (context, index) {
          final product = laptopProducts[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailProduk(productId: index),
                  ),
                );
              },
              child: Card(
                elevation: 4,
                shadowColor: Colors.black26,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
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
              ),
            ),
          );
        },
      ),
    );
  }
}
