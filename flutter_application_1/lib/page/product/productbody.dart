import 'package:flutter/material.dart';
import '../../data/model/productmodel.dart';
import '../../conf/const.dart';
import'package:intl/intl.dart';

Widget itemCardView(Product productModel) {
  return Container(
    margin: const EdgeInsets.all(4),
    // padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      border: Border.all(
        color: Colors.lightBlue,
        width: 1.5,
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Image.asset(
            url_product_img + productModel.img!,
            height: 108,
            errorBuilder: (context, error, stackTrace) => const Icon(Icons.image),
          ),
        ),
        Text(
          productModel.name ?? "",
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        Text(
          NumberFormat.currency(locale: 'vi_VN').format(productModel.price),
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
      ],
    ),
  );
}
