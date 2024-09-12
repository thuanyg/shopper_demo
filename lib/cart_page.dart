import 'package:flutter/material.dart';
import 'package:shopper_demo/catalog.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});

  late List<Catalog> cart = [];

  @override
  Widget build(BuildContext context) {
    cart = ModalRoute.of(context)?.settings.arguments as List<Catalog>;
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: buildAppBar(context),
      body: buildCartBody(context),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      title: const Text(
        "Cart",
        style: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }

  buildCartBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          cart.isNotEmpty
              ? SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: ListView.builder(
                      itemCount: cart.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Container(
                            height: 50,
                            width: 50,
                            color: Color(cart[index].hex),
                          ),
                          title: Text(cart[index].name),
                        );
                      }),
                )
              : const SizedBox.shrink(),
          const Divider(
            height: 3,
            thickness: 3,
            color: Colors.grey,
          ),
          Expanded(
            child: Center(
              child: SizedBox(
                height: 50,
                width: 120,
                child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      "BUY",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
