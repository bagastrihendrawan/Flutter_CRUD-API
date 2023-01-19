import 'package:flutter/material.dart';

List<Product> productData = [
  Product(
      productPrice: 43500,
      productName: "Laptop Gaming",
      productImage: "images/Laptop.jpg"),
  Product(
      productPrice: 1200000,
      productName: "Ram 32GB",
      productImage: "images/ram.jpg"),
  Product(
      productPrice: 26000000,
      productName: "Iphone 14ProMax",
      productImage: "images/ipon.jpg"),
  Product(
      productPrice: 43500,
      productName: "Laptop Gaming",
      productImage: "images/basreng.jpg"),
  Product(
      productPrice: 1200000,
      productName: "Ram 32GB",
      productImage: "images/onepis.jpg"),
  Product(
      productPrice: 26000000,
      productName: "Iphone 14ProMax",
      productImage: "images/pisred.jpg"),
];

class CommerceApp extends StatefulWidget {
  const CommerceApp({super.key});

  @override
  State<CommerceApp> createState() => _CommerceAppState();
}

class _CommerceAppState extends State<CommerceApp> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: isDark ? Brightness.dark : Brightness.dark,
      ),
      home: shopPage());
  }
}

class shopPage extends StatefulWidget {
  const shopPage({super.key});

  @override
  State<shopPage> createState() => _shopPageState();
}

class _shopPageState extends State<shopPage> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
        appBar: AppBar(
          title: Text("DarkWeb"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const FavoritePage()));
                },
                icon: Icon(Icons.add_shopping_cart)),
          ],
        ),
        body: ListView.builder(
          itemCount: productData.length,
          itemBuilder: (context, index) {
            return ProductCard(product: productData[index]);
          },
        ));
  }
}

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: Text("My Favorite Product"),
      ),
      body: ListView.builder(
        itemCount: productData.length,
        itemBuilder: (context, index) {
          if (productData[index].isFav) {
            return ProductCard(product: productData[index]);
          } else
            return Container();
        },
      ),
    );
  }
}


class ProductCard extends StatefulWidget {
  Product product;
  ProductCard({required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Container(
        // decoration:
        //     BoxDecoration(border: Border.all(color: Colors.white)),
        // padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 80,
                  width: 80,
                  child: Image.asset(widget.product.productImage),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.product.productName),
                    Text("Rp. ${widget.product.productPrice}")
                  ],
                ),
              ],
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    widget.product.favorite();
                  });
                },
                icon: widget.product.isFav
                    ? const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                    : Icon(Icons.favorite_border_rounded))
          ],
        ),
      ),
    );
  }
}

class Product {
  String productName;
  int productPrice;
  String productImage;
  bool isFav = false;
  Product(
      {required this.productPrice,
      required this.productName,
      this.productImage = "images/pisred.jpg"});

  void favorite() {
    isFav = !isFav;
  }
}
