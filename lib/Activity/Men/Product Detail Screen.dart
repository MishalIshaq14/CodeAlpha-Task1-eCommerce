



import 'package:flutter/material.dart';
import 'package:footwear/Activity/Men/Cart%20Screen.dart';

class ProductDetailScreen extends StatefulWidget {
  final String name;
  final String price;
  final String image;
  final double rating;

  const ProductDetailScreen(
      {super.key,
      required this.image,
      required this.name,
      required this.price,
      required this.rating});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  bool isAddedToCart = false;
  int counter = 1;
  TextEditingController searchcontroller = TextEditingController();
  // Example shoe sizes
  final List<String> sizes = ['7', '8', '9', '10', '11', '12'];
  static List<Map<String, String>> cartItems = [];
  void addtocart() {
    final cartitem = {
      "image": widget.image,
      "price": widget.price,
      "name": widget.name,
    };
    setState(() {
      if (isAddedToCart) {
        cartItems.removeWhere((item) =>
            item["name"] == widget.name &&
            item["price"] == widget.price &&
            item["image"] == widget.image);
        isAddedToCart = false;
      } else {
        isAddedToCart = true;
        cartItems.add(cartitem);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(
          0xff991e66,
        ),
        title: const Text("Product Detail",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Cart(cartItems: cartItems)));
                },
                icon: const Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.white,
                ),
              ),
              if (isAddedToCart)
                Positioned(
                  right: 10,
                  top: 10,
                  child: Container(
                    height: 10,
                    width: 10,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(
            width: 20,
          )
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 70,
              color: const Color(
                0xff991e66,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Center(
                child: TextFormField(
                  controller: searchcontroller,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.search)),
                    hintText: "Search",
                    hintStyle: const TextStyle(color: Color(0xff426b69)),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(25), // Rounded corners
                      borderSide: BorderSide.none, // No border
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage(
                          widget.image,
                        ),
                        fit: BoxFit.fitHeight),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 4,
                        color: Color(
                          0xff991e66,
                        ),
                      ),
                    ]),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${widget.name} ",
                    style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                  Text("${widget.price} ",
                      style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 20,
                          fontWeight: FontWeight.w500)),
                  Row(
                    children: List.generate(
                        5,
                        (index) => Icon(
                              index < widget.rating
                                  ? Icons.star
                                  : Icons.star_border,
                              color: Colors.yellow[700],
                              size: 16,
                            )),
                  ),
                  const SizedBox(height: 5,),
                  const Text(
                    "Available Sizes",
                    style: TextStyle(
                      color: Color(
                        0xff991e66,
                      ),
                      fontSize: 18,
                      shadows: [
                        Shadow(
                          offset:
                              Offset(00, 4.0), // Offset in X and Y directions
                          blurRadius: 3.0, // How much to blur the shadow
                          color: Color(0xFFc98ca7), // Shadow color and opacity
                        ),
                      ],
                    ),
                  ),
                  Wrap(
                    spacing: 10.0, // Space between each size
                    children: sizes.map((size) {
                      return Chip(
                        label: Text(size),
                        backgroundColor: const Color(0xffd4af37),
                        padding: const EdgeInsets.symmetric(
                            vertical: 6, horizontal: 10),
                      );
                    }).toList(),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Product Description:',
                    style: TextStyle(fontSize: 18, color: Colors.black87),
                  ),
                  const Text(
                    'Comfortable, durable, and stylish shoes with premium materials and perfect fit.',
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  const Text(
                    "Quantity ",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              counter++;
                            });
                          },
                          icon: const Icon(
                            Icons.add,
                            color: Colors.green,
                          )),
                      Container(
                        height: 30,
                        width: 30,
                        color: const Color(0xffd4af37),
                        child: Center(
                          child: Text(
                            "$counter",
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              if (counter > 1) {
                                counter--;
                              }
                            });
                          },
                          icon: const Icon(
                            Icons.remove,
                            color: Colors.red,
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      
                      InkWell(
                        onTap: () {
                          addtocart();
                          // setState(() {
                          //   isAddedToCart = !isAddedToCart;
                          // });
                        },
                        child: Container(
                          height: 30,
                          width: 100,
                          decoration: BoxDecoration(
                              color: isAddedToCart
                                  ? Colors
                                      .white // Change to purple if added to cart
                                  : const Color.fromARGB(255, 168, 6, 6),

                              // color: const Color.fromARGB(255, 168, 6, 6),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 2,
                                  color: const Color.fromARGB(255, 168, 6, 6),
                                ),
                              ]),
                          child: Center(
                              child: Text(
                            "Add to Cart",
                            style: TextStyle(
                                color:
                                    isAddedToCart ? Colors.black : Colors.white,
                                // color: Colors.white,
                                fontSize: 14),
                          )),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
