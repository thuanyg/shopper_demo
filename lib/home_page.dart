import 'package:flutter/material.dart';
import 'package:shopper_demo/cart_page.dart';
import 'package:shopper_demo/catalog.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Catalog> cart = [];

  handleAddToCart(Catalog catalog) {
    setState(() {
      cart.add(catalog);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: ListView.builder(
          itemCount: catalogs.length,
          itemBuilder: (context, index) {
            return buildListItem(index);
          },
        ),
      ),
    );
  }

  Row buildListItem(int index) {
    return Row(
            children: [
              Expanded(
                child: ListTile(
                  leading: Container(
                    height: 50,
                    width: 50,
                    color: Color(catalogs[index].hex),
                  ),
                  title: Text(catalogs[index].name),
                ),
              ),
              TextButton(
                onPressed: () {
                  handleAddToCart(catalogs[index]);
                },
                child: const Text("Add"),
              ),
            ],
          );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.yellow,
      centerTitle: true,
      title: const Text(
        "Catalog",
        style: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.w900,
        ),
      ),
      actions: [
        Stack(
          children: [
            IconButton(
              onPressed: () {
                // Navigate and pass data to CartPage
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => CartPage(),
                    settings: RouteSettings(arguments: cart),
                  ),
                );
              },
              icon: const Icon(Icons.shopping_cart),
            ),
            cart.isNotEmpty
                ? Positioned(
                    right: 8,
                    top: 4,
                    child: Badge.count(
                      count: cart.length,
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        )
      ],
    );
  }
}
