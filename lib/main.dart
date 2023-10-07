import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class ShoppingItem {
  final String name;
  final String color;
  final String size;
  final double unitPrice;
  int quantity;
  final String imageUrl;

  ShoppingItem({
    required this.name,
    required this.color,
    required this.size,
    required this.unitPrice,
    required this.imageUrl,
    this.quantity = 0,
  });
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePage createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  List<ShoppingItem> shoppingCart = [
    ShoppingItem(
      name: 'Pullover',
      color: 'Black',
      size: 'L',
      unitPrice: 51.0,
      imageUrl:
      'https://rukminim2.flixcart.com/image/850/1000/xif0q/t-shirt/l/g/q/xl-ort315-ospo-sports-original-imagghzuryaaazbf.jpeg?q=20',
    ),
    ShoppingItem(
      name: 'T-Shirt',
      color: 'Gray',
      size: 'L',
      unitPrice: 30.0,
      imageUrl:
      'https://rukminim2.flixcart.com/image/850/1000/xif0q/shirt/h/8/a/40-asaesh1422-arrow-sports-original-imagskvmjhshy4g3.jpeg?q=90',
    ),
    ShoppingItem(
      name: 'Sport Dress',
      color: 'Black',
      size: 'M',
      unitPrice: 43.0,
      imageUrl:
      'https://rukminim2.flixcart.com/image/850/1000/xif0q/t-shirt/u/6/h/xl-ort315-ospo-sports-original-imagghzuvdckdw6p.jpeg?q=20',
    ),
  ];

  void updateTotalAmount() {
    double total = 0.0;
    for (var item in shoppingCart) {
      total += item.unitPrice * item.quantity;
    }
    setState(() {
      totalAmount = total;
    });
  }

  double totalAmount = 0.0;

  void showCongratulatorySnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Congratulations! Your order has been placed.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white60,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'My Bag',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: ListView.builder(
              itemCount: shoppingCart.length,
              itemBuilder: (context, index) {
                return ShoppingCartItem(
                  item: shoppingCart[index],
                  onQuantityChanged: () {
                    setState(() {
                      updateTotalAmount();
                    });
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Total amount: '),
                    Text('${totalAmount.toStringAsFixed(2)}\$'),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    onPressed: () {
                      showCongratulatorySnackbar();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: const Text('CHECK OUT'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ShoppingCartItem extends StatefulWidget {
  final ShoppingItem item;
  final Function() onQuantityChanged;

  ShoppingCartItem({
    super.key,
    required this.item,
    required this.onQuantityChanged,
  });

  @override
  _ShoppingCartItemState createState() => _ShoppingCartItemState();
}

class _ShoppingCartItemState extends State<ShoppingCartItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.black,
                  width: double.infinity,
                  height: 150,
                  child: Image.network(
                    widget.item.imageUrl,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  width: double.infinity,
                  height: 150,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          title: Text(
                            widget.item.name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          trailing: const Icon(Icons.more_vert),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                              'Color: ${widget.item.color}   Size: ${widget.item.size}'),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    if (widget.item.quantity > 0) {
                                      setState(() {
                                        widget.item.quantity--;
                                        widget.onQuantityChanged();
                                      });
                                    }
                                  },
                                  icon: const Icon(Icons.remove),
                                ),
                              ),
                            ),
                            Text('${widget.item.quantity}'),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      widget.item.quantity++;
                                      widget.onQuantityChanged();
                                    });
                                  },
                                  icon: const Icon(Icons.add),
                                ),
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Text("${widget.item.unitPrice}\$"),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}