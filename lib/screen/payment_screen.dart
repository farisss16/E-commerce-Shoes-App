// ignore_for_file: prefer_const_constructors

import 'package:finalproject/component/card_payment.dart';
import 'package:finalproject/screen/animation_payment_page.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        title: Text('Payment Method'),
      ),
      body: Column(
        children: [
          Container(
            height: size.height * 0.75,
            width: size.width,
            // color: Colors.amber,
            child: ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: dummyCard.length,
              itemBuilder: (context, index) => buildCategory(index),
            ),
          ),
          Container(
            height: size.height * 0.1145,
            width: size.width,
            // color: Colors.amber,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: ElevatedButton(
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
                    onPressed: select,
                    child: Text(
                      'Select',
                      style: TextStyle(color: Colors.black),
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

  void select() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => AnimationPage(),
        ),
        (route) => false);
  }

  GestureDetector buildCategory(int index) {
    final cardpay = dummyCard[index];
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Container(
          alignment: Alignment.bottomRight,
          height: 250,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(cardpay.images),
            ),
            color:
                selectedIndex == index ? Color(0xffAFE98B) : Colors.transparent,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.black),
          ),
          child: selectedIndex == index ? Icon(Icons.check_box) : Container(),
        ),
      ),
    );
  }
}
