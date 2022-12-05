import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = ['All', 'Nike', 'Vans', 'Adidas', 'Puma'];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => buildCategory(index),
      ),
    );
  }

  GestureDetector buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 6),
        child: Container(
          alignment: Alignment.center,
          height: 30,
          width: 80,
          decoration: BoxDecoration(
            color:
                selectedIndex == index ? Color(0xffAFE98B) : Colors.transparent,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.black),
          ),
          child: Text(
            categories[index],
          ),
        ),
      ),
    );
  }
}
