import 'package:flutter/material.dart';
import 'package:goodfood/config/const.dart';
import 'package:goodfood/models/product.dart';
import 'package:provider/provider.dart';

class CategoryBody extends StatelessWidget {
  const CategoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    var product = Provider.of<Product>(context, listen: false);
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      height: 220,
      width: double.infinity,
      child: GridTile(
          footer: GridTileBar(
            backgroundColor: dColorFooterImage,
            title: Text(
              product.title,
              style: styleTitleItem,
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer<Product>(
                  builder: (((context, value, child) {
                    return Row(
                      children: [
                        InkWell(
                          onTap: () {
                            value.toggleIsFavorite();
                          },
                          child: Icon(
                            Icons.favorite,
                            size: sizeIconButonTitle,
                            color: value.isFavorite ? Colors.red : Colors.white,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          value.favorite,
                          style: styleTitleIcon,
                        ),
                      ],
                    );
                  })),
                ),
                const SizedBox(width: 10),
                const Icon(
                  Icons.timelapse_sharp,
                  size: sizeIconButonTitle,
                ),
                const SizedBox(width: 10),
                Text(
                  product.view,
                  style: styleTitleIcon,
                ),
              ],
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              product.image,
              fit: BoxFit.cover,
            ),
          )),
    );
  }
}
