import 'package:app_file/data/model/categorymodel.dart';
import 'package:flutter/material.dart';
import 'package:app_file/data/model/productmodel.dart';
import '../../data/provider/productprovider.dart';
import 'productbody.dart';
import '../../conf/const.dart';

class ProductWidget extends StatefulWidget {
  final Category objCat;
  const ProductWidget({Key? key, required this.objCat}) : super(key: key);

  @override
  _ProductWidgetState createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  List<Product> lstProduct = [];

  Future<String> loadProdList(int catId) async {
    lstProduct = await ReadData().loadDataByCat(catId) as List<Product>;
    return "";
  }

  @override
  void initState() {
    super.initState();
    loadProdList(widget.objCat.id!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product list ${widget.objCat.name.toString().toUpperCase()}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: FutureBuilder(
          future: loadProdList(widget.objCat.id!),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            return GridView.builder(
              itemCount: lstProduct.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.0,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
              ),
              itemBuilder: (context, index) {
                return itemGridView(lstProduct[index]);
              },
            );
          },
        ),
      ),
    );
  }
}
