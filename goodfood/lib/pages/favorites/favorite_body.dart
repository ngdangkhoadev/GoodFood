import 'package:flutter/material.dart';
import 'package:goodfood/config/const.dart';
import 'package:goodfood/providers/product_provider.dart';
import 'package:provider/provider.dart';

class FavoriteBody extends StatelessWidget {
  const FavoriteBody({super.key});

  @override
  Widget build(BuildContext context) {
    var items = Provider.of<ProductProvider>(context).getItemsIsFavorite();
    return ListView.builder(
      itemCount: items.length,
      padding: const EdgeInsets.all(16),
      itemBuilder: (BuildContext context, int index) {
        return ChangeNotifierProvider.value(
          value: items[index],
          child: Dismissible(
            confirmDismiss: (direction) async {
              return showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Xác nhận xóa sản phẩm'),
                  content: const Text('Bạn chắc chắn muốn xóa'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, true),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            },
            onDismissed: ((direction) {
              items[index].handleRemoveIsFavorite();
            }),
            key: ValueKey<int>(index),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                width: double.infinity,
                height: 150,
                child: GridTile(
                  footer: GridTileBar(
                    backgroundColor: Colors.white70,
                    title: Text(
                      items[index].title,
                      style: styleTitleItem,
                    ),
                    trailing: const Icon(
                      Icons.swipe,
                      size: sizeIconButonTitle,
                      color: Color.fromARGB(179, 183, 181, 181),
                    ),
                  ),
                  child: Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          items[index].image,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
