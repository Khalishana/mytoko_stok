import 'package:flutter/material.dart';
//import 'package:mytoko_stok/screens/lihat_item.dart';
import 'package:mytoko_stok/screens/list_item.dart';
import 'package:mytoko_stok/screens/liststok_form.dart';
import 'package:mytoko_stok/screens/toko.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.indigo,
            ),
            child: Column(
              children: [
                Text(
                  'StokNya Aku Mobile',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text("Catat semua stok barangmu di sini!",
                // Tambahkan gaya teks dengan center alignment, font ukuran 15, warna putih, dan weight biasa
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          // routing sudah selesai
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Halaman Utama'),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Tambah Item'),
            // Bagian redirection ke ShopFormPage
            onTap: () {
              //routing ke shopformpage
              Navigator.pushReplacement(
                context, 
                MaterialPageRoute(
                  builder: (context) => ShopFormPage()
                  ));
            },
          ),
          // ListTile(
          //   leading: const Icon(Icons.checklist),
          //   title: const Text('Lihat Item yang Disimpan'),
          //   // Bagian redirection ke LihatItem
          //   onTap: () {
          //     //routing ke LihatItem
          //     Navigator.pushReplacement(
          //       context, 
          //       MaterialPageRoute(
          //         builder: (context) => LihatItem(),
          //         ));
          //   },
          // ),
          ListTile(
            leading: const Icon(Icons.shopping_basket),
            title: const Text('Daftar Produk'),
            onTap: () {
                // Route menu ke halaman produk
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProductPage()),
                );
            },
        ),
        ],
      ),
    );
  }
}