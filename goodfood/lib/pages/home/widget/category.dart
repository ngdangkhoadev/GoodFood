import 'package:flutter/material.dart';
import 'package:goodfood/config/const.dart';
import 'package:goodfood/models/product.dart';
import 'package:goodfood/pages/home/widget/category_body.dart';
import 'package:goodfood/pages/home/widget/product.dart';
import 'package:goodfood/providers/product_provider.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatelessWidget {
  static const routeName = "/category";
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    var data = ModalRoute.of(context)?.settings.arguments as Map;
    var products = Provider.of<ProductProvider>(context)
        .getItemWithCategoryId(data['categoryId']);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: dColorMain,
        title: Center(child: Text(data['title'])),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(10),
        itemCount: products.length,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 20,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, ProductPage.routeName,
                  arguments: {"id": products[index].id});
            },
            child: ChangeNotifierProvider<Product>.value(
              value: products[index],
              child: const CategoryBody(),
            ),
          );
        },
      ),
    );
  }
}
