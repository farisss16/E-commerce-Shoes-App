import 'package:flutter/material.dart';

class SizeSelected extends StatefulWidget {
  const SizeSelected({super.key});

  @override
  State<SizeSelected> createState() => _SizeSelectedState();
}

class _SizeSelectedState extends State<SizeSelected> {
  List<String> size = ['39', '40', '41', '42', '43'];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: size.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 1 / 1,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              alignment: Alignment.center,
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black),
                  color: selectedIndex == index
                      ? Color(0xffAFE98B)
                      : Colors.transparent),
              child: Text(
                size[index],
              ),
            ),
          ),
        );
      },
    );
  }
}
