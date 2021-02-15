import 'package:flutter/material.dart';
import 'package:personal_grouth/Model/Product.dart';
import 'package:personal_grouth/Repositories/ProductsRepository.dart';

class ListProductsScreen extends StatefulWidget {
  final productsRepo = ProductsRepository();

  @override
  _ListProductsScreenState createState() => _ListProductsScreenState();
}

class _ListProductsScreenState extends State<ListProductsScreen> {
  var products = List<Product>();

  @override
  void initState() {
    super.initState();
    _initState();
  }

  Future<void> _initState() async {
    products = await widget.productsRepo.findBy();

    setState(() {
      this.products = products;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: productsListTile(),
    );
  }

  List<Widget> productsListTile() {
    var productsCards = products
        .map((p) => ListTile(
              title: Text(p.name),
              subtitle: Text(p.price.toString()),
              onTap: () {},
            ))
        .toList();

    return productsCards;
  }
}
