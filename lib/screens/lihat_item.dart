import 'package:flutter/material.dart';
import 'package:mytoko_stok/widgets/left_drawer.dart';
import 'package:mytoko_stok/widgets/models.dart';
import 'package:mytoko_stok/main.dart';
//import 'package:mytoko_stok/widgets/stok_card.dart';

class LihatItem extends StatelessWidget{
  const LihatItem({Key? key}) : super(key: key);
  Card buildBarangCard(Item item) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Nama Produk: ${item.namaItem}"),
            Text("Jumlah: ${item.amountItem}"),
            Text("Deskripsi: ${item.description}"),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Lihat Stok Item',
          ),
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: ListView.builder(
        itemCount: listItem.length,
        itemBuilder: (BuildContext context, int index) {
          return buildBarangCard(listItem[index]);
        },
      ),
    );
  }
}