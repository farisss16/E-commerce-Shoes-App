// import 'package:finalproject/model/nike_class.dart';
import 'package:finalproject/component/grid_cell.dart';
import 'package:finalproject/screen/view_screen.dart';
import 'package:flutter/material.dart';

import '../model/class_data.dart';
import '../network/API.dart';

class PumaShoes extends StatefulWidget {
  const PumaShoes({super.key});

  @override
  State<PumaShoes> createState() => _PumaShoesState();
}

class _PumaShoesState extends State<PumaShoes> {
  gridView(AsyncSnapshot<List<Products>> snapshot) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: GridView.count(
        scrollDirection: Axis.horizontal,
        crossAxisCount: 1,
        childAspectRatio: 1,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: snapshot.data!.map(
          (produk) {
            return GestureDetector(
              child: GridTile(
                child: PhotoCell(
                  produk: produk,
                ),
              ),
              onTap: () {
                gotoDetailpage(context, produk);
              },
            );
          },
        ).toList(),
      ),
    );
  }

  void gotoDetailpage(BuildContext context, Products produk) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GridDetails(produk: produk),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Products>>(
      future: Repository4.getData(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error ${snapshot.error}');
        } else if (snapshot.hasData) {
          return gridView(snapshot);
        }
        return CircularProgressIndicator();
      },
    );
  }
}
