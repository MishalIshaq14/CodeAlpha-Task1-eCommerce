







import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:footwear/Activity/Order%20Summary%20.dart';

// ignore: must_be_immutable
class Cart extends StatefulWidget {
  List<Map<String, String>> cartItems;

  Cart({super.key, required this.cartItems});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<int> counters = []; // List to hold the quantity for each item

  @override
  void initState() {
    super.initState();
    counters = List.generate(widget.cartItems.length,
        (index) => 1); // Initialize with 1 for each item
  }

  TextEditingController cityController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  double calculateTotal() {
    double total = 0;
    for (int i = 0; i < widget.cartItems.length; i++) {
      double price = double.tryParse(widget.cartItems[i]["price"] ?? "0") ?? 0;
      total += price * counters[i];
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff991e66),
        title: const Text(
          "Shopping Cart",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_bag_outlined,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 20),
        ],
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: ListView.builder(
              itemCount: widget.cartItems.length,
              itemBuilder: (context, index) {
                final item = widget.cartItems[index];
                final imagePath = item["image"] ?? "";
                final name = item["name"] ?? "";
                final price = double.tryParse(item["price"] ?? "0") ?? 0;
                final itemTotal = price * counters[index];
      
                return Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 12,
                            child: Container(
                              height: 105,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: Color(0xff991e66),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset(imagePath),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8, bottom: 4),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          name,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const Text(
                                          "Total items:",
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          // crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  counters[index]++;
                                                });
                                              },
                                              icon: const Icon(
                                                Icons.add,
                                                color: Colors.green,
                                                size: 14,
                                              ),
                                            ),
                                            Container(
                                              height: 20,
                                              width: 20,
                                              color: const Color(0xffd4af37),
                                              child: Center(
                                                child: Text(
                                                  "${counters[index]}",
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  if (counters[index] > 1) {
                                                    counters[index]--;
                                                  }
                                                });
                                              },
                                              icon: const Icon(
                                                Icons.remove,
                                                color: Colors.red,
                                                size: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        "Rs: ",
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.red),
                                      ),
                                      Text(
                                        "${itemTotal.toStringAsFixed(2)}",
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    widget.cartItems.removeAt(index);
                                  });
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                  size: 24,
                                )),
                          )
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff991e66),
                    blurRadius: 2,
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Total Amount:",
                          style: TextStyle(color: Colors.red, fontSize: 18),
                        ),
                        Row(
                          children: [
                            const Text(
                              "Rs: ",
                              style: TextStyle(color: Colors.red),
                            ),
                            Text("${calculateTotal().toStringAsFixed(2)}"),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Taxes, discounts and shipping calculated at checkout",
                          style: TextStyle(
                              fontSize: 13,),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Expanded(
                          child: Text(
                            "City Name:",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 35,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xff991e66).withOpacity(
                                      0.7), // Shadow color with opacity
                                  blurRadius:
                                      4, // The blur effect of the shadow
                                  offset: const Offset(
                                      0, 2), // Position of the shadow
                                ),
                              ],
                            ),
                            child: TextFormField(
                              controller: cityController,
                              style: const TextStyle(
                                fontSize: 16.0,
                                color: Colors.black87,
                              ),
                              decoration: const InputDecoration(
                                hintText: "Enter your city",
                                hintStyle: TextStyle(
                                  color: Colors.white54,
                                ),
                                enabledBorder:
                                    InputBorder.none, // No border when enabled
                                focusedBorder:
                                    InputBorder.none, // No border when focused
                                contentPadding: EdgeInsets.only(
                                    bottom: 14, right: 10, left: 10),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Expanded(
                          child: Text(
                            "Mobile no.",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 35,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xff991e66).withOpacity(
                                      0.7), // Shadow color with opacity
                                  blurRadius:
                                      4, // The blur effect of the shadow
                                  offset: const Offset(
                                      0, 2), // Position of the shadow
                                ),
                              ],
                            ),
                            child: TextFormField(
                              controller: mobileController,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              style: const TextStyle(
                                fontSize: 16.0,
                                color: Colors.black87,
                              ),
                              decoration: const InputDecoration(
                                hintText: "Enter your Number",
                                hintStyle: TextStyle(
                                  color: Colors.white54,
                                ),
                                enabledBorder:
                                    InputBorder.none, // No border when enabled
                                focusedBorder:
                                    InputBorder.none, // No border when focused
                                contentPadding: EdgeInsets.only(
                                    bottom: 14, right: 10, left: 10),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  OrderSummary(calculateTotal: calculateTotal(),) ));

                      },
                      child: Container(
                        height: 40,
                        width: 150,
                        decoration: BoxDecoration(
                          color: const Color(0xffd4af37),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Center(
                          child: Text(
                            "Check Out",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
