import 'package:flutter/material.dart';
import 'package:goodfood/config/const.dart';
import 'package:goodfood/providers/product_provider.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  static const routeName = "/product";
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    bool change = true;
    var arg = ModalRoute.of(context)?.settings.arguments as Map;
    var product =
        Provider.of<ProductProvider>(context).getItemWithId(arg['id']);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(product.image),
                ),
              ),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  const Positioned(
                      top: 50,
                      left: 20,
                      child: BackButton(
                        color: dColorIconButtonInActive,
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: 120,
                        height: 60,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(12),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                product.toggleIsFavorite();
                                setState(() {
                                  change = !change;
                                });
                              },
                              child: Icon(
                                Icons.favorite,
                                color: product.isFavorite
                                    ? Colors.red
                                    : dColorIconButtonInActive,
                                size: sizeIconButonTitle,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              product.favorite,
                              style: styleTitleIcon,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 120,
                        height: 60,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.timelapse_sharp,
                              color: dColorIconButtonInActive,
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
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/image/background/background_product.png'), // đường dẫn đến hình ảnh
                    fit: BoxFit
                        .cover, // tùy chọn để căn chỉnh và thay đổi kích thước hình ảnh
                  ),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        product.title,
                        style: const TextStyle(fontSize: 15),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          Container(
                            width: 167,
                            height: 35,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20),
                              ),
                              color: dColorIconButtonInActive,
                            ),
                            child: const Center(
                              child: Text(
                                'Nguyên Liệu',
                                style: styleTitleItem,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: dColorIconButtonInActive,
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: Text(
                              product.ingredients,
                              style: const TextStyle(fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          Container(
                            width: 167,
                            height: 35,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20),
                              ),
                              color: dColorIconButtonInActive,
                            ),
                            child: const Center(
                              child: Text(
                                'Cách Làm',
                                style: styleTitleItem,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: dColorIconButtonInActive,
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: Text(
                              product.instructions,
                              style: const TextStyle(fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
