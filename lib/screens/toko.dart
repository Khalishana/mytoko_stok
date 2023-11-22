import 'package:flutter/material.dart';
//import 'package:mytoko_stok/screens/lihat_item.dart';
import 'package:mytoko_stok/screens/list_item.dart';
import 'package:mytoko_stok/screens/login.dart';
// Impor drawer widget
import 'package:mytoko_stok/widgets/left_drawer.dart';
import 'package:mytoko_stok/screens/liststok_form.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart'; //import ShopFormPage
//import 'package:mytoko_stok/widgets/stok_card.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final List<ShopItem> items = [
    ShopItem("Lihat Item", Icons.checklist, Colors.yellow),
    ShopItem("Tambah Item", Icons.add_shopping_cart, Colors.orange),
    ShopItem("Logout", Icons.logout, Colors.blue),
];

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
    Widget build(BuildContext context) {
        return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Stoknya Aku Mobile',
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      // Masukkan drawer sebagai parameter nilai drawer dari widget Scaffold
      drawer: const LeftDrawer(),
      body: SingleChildScrollView(
        // Widget wrapper yang dapat discroll
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Set padding dari halaman
          child: Column(
            // Widget untuk menampilkan children secara vertikal
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                child: Text(
                  'Stok PunyaKu', // Text yang menandakan toko
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Grid layout
              GridView.count(
                // Container pada card kita.
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((ShopItem item) {
                  // Iterasi untuk setiap item
                  return ShopCard(item, item.color);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
    }
}

class ShopCard extends StatelessWidget {
  final ShopItem item;
  final Color color;

  const ShopCard(this.item, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    
    return Material(
      color: color, //atur warna setiap card
      child: InkWell(
        onTap: ()  async{
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
          }else if (item.name == "Lihat Item"){
            Navigator.push(context,
             MaterialPageRoute(builder: (context) => const ProductPage()));
          } else if (item.name == "Logout") {
              final response = await request.logout(
                  // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                  "http://127.0.0.1:8000/auth/logout/");
              String message = response["message"];
              if (response['status']) {
                String uname = response["username"];
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("$message Sampai jumpa, $uname."),
                ));
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("$message"),
                ));
              }
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
