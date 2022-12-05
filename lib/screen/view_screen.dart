// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:finalproject/component/size_selected.dart';
import 'package:finalproject/model/class_data.dart';
import 'package:finalproject/screen/payment_screen.dart';
import 'package:flutter/material.dart';

enum Menu { JNE, SiCepat, JNT, AnterAja }

class GridDetails extends StatefulWidget {
  final Products produk;
  const GridDetails({super.key, required this.produk});

  @override
  State<GridDetails> createState() => _GridDetailsState();
}

class _GridDetailsState extends State<GridDetails> {
  late TextEditingController controller;
  int shipping = 10000;
  int tax = 3000;
  String name = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  String _selectedMenu = '';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                // color: Colors.amber,
                height: size.height * 0.35,
                width: size.width,
                decoration: BoxDecoration(
                  // color: Colors.amber,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      widget.produk.image.toString(),
                    ),
                  ),
                ),
              ),
              Container(
                height: size.height * 0.513,
                width: size.width,
                decoration: BoxDecoration(
                  color: Color(0xffAFE98B),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.produk.name.toString(),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Size :',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Container(
                        height: size.height * 0.05,
                        width: size.width,
                        child: SizeSelected(),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Container(
                        height: size.height * 0.05,
                        width: size.width,
                        // color: Colors.amber,
                        child: Row(
                          children: [
                            Text(
                              'Shipping:',
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(
                              width: 32,
                            ),
                            Text(
                              'Courier $_selectedMenu',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            PopupMenuButton<Menu>(
                              icon: Icon(Icons.arrow_drop_down),
                              // Callback that sets the selected popup menu item.
                              onSelected: (Menu item) {
                                setState(() {
                                  _selectedMenu = item.name;
                                });
                              },
                              itemBuilder: (BuildContext context) =>
                                  <PopupMenuEntry<Menu>>[
                                const PopupMenuItem<Menu>(
                                  value: Menu.JNE,
                                  child: Text('JNE'),
                                ),
                                const PopupMenuItem<Menu>(
                                  value: Menu.SiCepat,
                                  child: Text('Si Cepat'),
                                ),
                                const PopupMenuItem<Menu>(
                                  value: Menu.JNT,
                                  child: Text('JNT'),
                                ),
                                const PopupMenuItem<Menu>(
                                  value: Menu.AnterAja,
                                  child: Text('AnterAja'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                      ),
                      child: Row(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Address:',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 32,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: StadiumBorder(),
                              backgroundColor: Colors.white,
                            ),
                            onPressed: () async {
                              final name = await openDialog();
                              if (name == null || name.isEmpty) return;
                              setState(() {
                                this.name = name;
                              });
                            },
                            child: Text(
                              'Enter Address',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      elevation: 5,
                      child: Container(
                        height: 100,
                        width: 328,
                        child: Text(name),
                      ),
                    ),
                    Container(
                      height: size.height * 0.12,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 8, top: 30, right: 25),
                                child: Text(
                                  'Price:',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 35),
                                child: Text(
                                  'Rp ${widget.produk.harga.toString()}',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              side: BorderSide(color: Colors.black),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                ),
                              ),
                              backgroundColor: Colors.white,
                              minimumSize: Size(183, 65),
                            ),
                            onPressed: openBill,
                            child: Text(
                              'Checkout',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<String?> openDialog() => showDialog<String?>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Your Address'),
          content: TextField(
            autofocus: true,
            decoration: InputDecoration(hintText: 'Enter your Address'),
            controller: controller,
          ),
          actions: [
            TextButton(
              onPressed: submit,
              child: Text('SUBMIT'),
            ),
          ],
        ),
      );
  Future<String?> openBill() => showDialog<String?>(
        context: context,
        builder: (context) {
          Size size = MediaQuery.of(context).size;
          return AlertDialog(
            title: Text('Your Bill'),
            content: Container(
              height: size.height * 0.5,
              width: size.width,
              // color: Colors.amber,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.produk.name.toString(),
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Shoes'),
                        Text('Rp ${widget.produk.harga.toString()}'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'Shipping',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 27),
                        child: Text('Rp ${shipping.toString()}'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    height: 1,
                    width: 300,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Subtotal'),
                        Text(
                          'Rp ${(widget.produk.harga! + shipping).toString()}',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 37),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Tax'),
                        Text('Rp ${tax.toString()}'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    height: 1,
                    width: 300,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total Payment'),
                        Text(
                            'Rp ${(widget.produk.harga! + shipping + tax).toString()}')
                      ],
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: checkout,
                child: Text('SUBMIT'),
              ),
            ],
          );
        },
      );

  void submit() {
    Navigator.of(context).pop(controller.text);
    controller.clear();
  }

  void checkout() {
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PaymentPage(),
      ),
    );
  }
}
