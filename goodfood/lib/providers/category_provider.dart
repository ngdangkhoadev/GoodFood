import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:goodfood/models/category.dart';

class CategoryProvider extends ChangeNotifier {
  List<Category> _items = [];

  List<Category> get items => [..._items];

  Future<List<Category>> readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/category.json');
    final dataDecode = await json.decode(response);
    List<Category> data = List<Category>.from(
        dataDecode.map((i) => Category.fromJson(jsonEncode(i))));
    _items = data;
    return data;
  }
}
