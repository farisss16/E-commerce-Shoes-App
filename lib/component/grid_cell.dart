import 'package:finalproject/model/class_data.dart';
import 'package:flutter/material.dart';

class PhotoCell extends StatelessWidget {
  final Products produk;
  const PhotoCell({super.key, required this.produk});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Colors.white,
      elevation: 10,
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Hero(
                      tag: 'image ${produk.name}',
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              produk.image.toString(),
                            ),
                          ),
                        ),
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  produk.name.toString(),
                  maxLines: 1,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
