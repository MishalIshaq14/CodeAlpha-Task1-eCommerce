//

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:footwear/Activity/Men/OrderConfirmation.dart';
import 'package:footwear/class/OrderSummary%20UIform.dart';
import 'package:google_fonts/google_fonts.dart';

class ShippingOption {
  final String name;
  final double cost;

  ShippingOption({required this.name, required this.cost});
}

class OrderSummary extends StatefulWidget {
  final double calculateTotal;
  const OrderSummary({super.key, required this.calculateTotal});

  @override
  State<OrderSummary> createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
  TextEditingController emailController = TextEditingController();
  TextEditingController countrycontroller = TextEditingController();
  TextEditingController firstnamecontroller = TextEditingController();
  TextEditingController lastnamecontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController postalcodecontroller = TextEditingController();

  List<ShippingOption> shippingOptions = [
    ShippingOption(name: 'Standard Shipping', cost: 99.0),
    ShippingOption(name: 'Express Shipping', cost: 199.0),
  ];

  ShippingOption? selectedShippingOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Foot Wear",
                        style: GoogleFonts.jotiOne(
                            textStyle: const TextStyle(
                          fontSize: 32,
                          color: Color(0xff991e66),
                        ))),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Contact",
                style: TextStyle(fontSize: 20, color: Colors.black87),
              ),
              UIForm(
                hintText: "Email",
                controller: emailController,
              ),
              const Text(
                "Email me with news and offers",
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Delivery",
                style: TextStyle(fontSize: 20, color: Colors.black87),
              ),
              UIForm(
                hintText: "Country",
                controller: countrycontroller,
              ),
              const SizedBox(
                height: 10,
              ),
              UIForm(hintText: "First name", controller: firstnamecontroller),
              const SizedBox(
                height: 10,
              ),
              UIForm(hintText: "Last name", controller: lastnamecontroller),
              const SizedBox(
                height: 10,
              ),
              UIForm(hintText: "Address", controller: addresscontroller),
              const SizedBox(
                height: 15,
              ),
              UIForm(hintText: "postal code", controller: postalcodecontroller),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Shipping method",
                style: TextStyle(fontSize: 20, color: Colors.black87),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white, // Background color for the dropdown
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.grey, // Border color
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: DropdownButton<ShippingOption>(
                          value: selectedShippingOption,
                          hint: const Text('Choose a shipping option'),
                          isExpanded:
                              true, // Ensures the dropdown takes full width
                          underline:
                              SizedBox(), // Removes the default underline
                          onChanged: (ShippingOption? newValue) {
                            setState(() {
                              selectedShippingOption = newValue;
                            });
                          },
                          items: shippingOptions
                              .map<DropdownMenuItem<ShippingOption>>(
                                  (ShippingOption option) {
                            return DropdownMenuItem<ShippingOption>(
                              value: option,
                              child: Text(
                                '${option.name} - Rs ${option.cost.toStringAsFixed(2)}',
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Payment",
                style: TextStyle(fontSize: 20, color: Colors.black87),
              ),
              const Text(
                "All transactions are secure and encrypted",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xffd4af37),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.grey,
                  ),
                ),
                child: const Center(
                    child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Cash on Delivery (COD)",
                        style: TextStyle(color: Colors.black87),
                      ),
                    ],
                  ),
                )),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Order Summary",
                style: TextStyle(fontSize: 20, color: Colors.black87),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Subtotal",
                    style: TextStyle(color: Colors.black87, fontSize: 16),
                  ),
                  Text(
                    "Rs ${widget.calculateTotal}",
                    style: const TextStyle(color: Colors.black87,fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Shipping",
                    style: TextStyle(color: Colors.black87,fontSize: 16),
                  ),
                  Text(
                    selectedShippingOption != null
                        ? 'Rs ${selectedShippingOption!.cost.toStringAsFixed(2)}'
                        : 'Select a shipping option',
                    style: const TextStyle(color: Colors.black87,fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Total",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black87),
                  ),
                  Text(
                    'Rs ${(widget.calculateTotal + (selectedShippingOption?.cost ?? 0)).toStringAsFixed(2)}',
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black87),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const OrderConfirmationScreen()));
                    },
                    child: Container(
                              height: 40,
                              width: 159,
                              decoration: BoxDecoration(
                                color: const Color(0xffd4af37),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: const Center(
                                child: Text(
                                  "Complete Order",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
