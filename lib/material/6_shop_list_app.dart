import 'package:flutter/material.dart';

class _Product {
  _Product({required this.name, required this.qty});
  String name;
  int qty;
  bool inCart = false;

  int firstqty = 0;

  void decrement() {
    firstqty += 1;
    if (this.qty != 0) {
      this.qty -= 1;
    } else {
      this.qty = firstqty - 1;
      this.firstqty = 0;
    }
    this.inCart = (qty == 0) ? true : false;
  }
}

// List<_Product> productData = [
//   _Product(name: "Telur", qty: 3),
//   _Product(name: "Gula", qty: 2),
//   _Product(name: "Tepung", qty: 2)
// ];

class ShopListApp extends StatefulWidget {
  const ShopListApp({super.key});

  @override
  State<ShopListApp> createState() => _ShopListAppState();
}

class _ShopListAppState extends State<ShopListApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shop List App',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 217, 72, 195),
          title: Text("Shopping List"),
          // ini bocil radius
          shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
              
        ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.shopping_bag),
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(children: const [
            DrawerHeader(
              // child: Text("Drawer Header"),
              decoration: BoxDecoration(color: Color.fromARGB(255, 233, 75, 222)),
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Color.fromARGB(255, 233, 75, 222)),
                accountName: Text(
                  "Bagas Bote",
                  style: TextStyle(fontSize: 18),
                ),
                accountEmail: Text("bagaseka@gmail.com"),
                currentAccountPictureSize: Size.square(50),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(
                    "UA",
                    style: TextStyle(fontSize: 30.0, color: Colors.deepPurple),
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text("Setting"),

              leading: Icon(Icons.settings),
              // leading: const Icon(Icons.settings),
            ),
            ListTile(
              title: Text("About"),

              leading: Icon(Icons.dangerous),
              // leading: const Icon(Icons.settings),
            ),
            ListTile(
              title: Text("Log Out"),
              leading: Icon(Icons.logout),
              // leading: const Icon(Icons.logout),
            )
          ]),
        ),
        body: _ProductList(),
      ),
    );
  }
}

class _ProductList extends StatefulWidget {
  const _ProductList({super.key});

  @override
  State<_ProductList> createState() => _MyWidgetState();
}

class Item {
  String itemName;
  int itemQty;
  Item({required String this.itemName, required int this.itemQty});
}

class _MyWidgetState extends State<_ProductList> {
  final addcon = TextEditingController();
  final addqty = TextEditingController();
  List<Item> itemData = [
    Item(itemName: "Aqua", itemQty: 5),
    Item(itemName: "Latto Latto", itemQty: 5),
    Item(itemName: "Mizone", itemQty: 5),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: itemData.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
                " ${itemData[index].itemName} x ${itemData[index].itemQty} ${itemData[index].itemQty != 0 ? '' : ''}"),
            leading: CircleAvatar(
              backgroundColor:
                  (itemData[index].itemQty != 0) ? Colors.grey : Colors.grey,
              child: Text(itemData[index].itemName[0]),
            ),
            onTap: (itemData[index].itemQty != 0)
                ? () {
                    setState(() {
                      itemData[index].itemQty = itemData[index].itemQty - 1;
                    });
                  }
                : null,
            trailing: IconButton(
                onPressed: () {
                  setState(() {
                    itemData.removeAt(index);
                  });
                },
                icon: Icon(Icons.delete)),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                scrollable: true,
                content: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Form(
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Nama Item', icon: Icon(Icons.add)),
                          controller: addcon,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                              labelText: 'Quantity',
                              icon: Icon(Icons.add_box_outlined)),
                          controller: addqty,
                        )
                      ],
                    ),
                  ),
                ),
                actions: [
                  ElevatedButton(
                    child: Text("Tambah"),
                    onPressed: () {
                      setState(() {
                        itemData.add(Item(
                            itemName: addcon.text,
                            itemQty: int.parse(addqty.text)));
                        addcon.clear();
                        addqty.clear();
                      });
                    },
                  )
                ],
              );
            },
          );
        },
        backgroundColor: Color.fromARGB(255, 183, 58, 137),
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 183, 58, 137),
        selectedItemColor: Colors.white,
        elevation: 0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_alt_outlined),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}