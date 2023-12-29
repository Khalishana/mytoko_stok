import 'package:flutter/material.dart';
import 'package:mytoko_stok/screens/lihat_item.dart';
import 'package:mytoko_stok/screens/liststok_form.dart';

class ShopCard extends StatelessWidget {
  final ShopItem item;
  final Color color;

  const ShopCard(this.item, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color, //atur warna setiap card
      child: InkWell(
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
          //navigate ke route lain
          if (item.name == "Tambah Item"){
            // implemen push buat navigasi ke shopformpage
            Navigator.push(context,
             MaterialPageRoute(builder: (context) => const ShopFormPage()));
          } else if (item.name == "Lihat Item"){
            // implemen push buat navigasi ke shopformpage
            Navigator.push(context,
             MaterialPageRoute(builder: (context) => const LihatItem()));
          }
        },
        child: Container(
          // Container untuk menyimpan Icon dan Text
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ShopItem {
  final String name;
  final IconData icon;
  final Color color;

  ShopItem(this.name, this.icon, this.color);
}
