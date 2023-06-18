import 'package:flutter/material.dart';
import 'package:goodfood/config/const.dart';
import 'package:goodfood/pages/home/widget/category.dart';
import 'package:goodfood/providers/category_provider.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: CategoryProvider().readJson(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          var categoryItem = snapshot.hasData ? snapshot.data : [];
          return snapshot.hasData
              ? GridView.builder(
                  padding: const EdgeInsets.all(10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: categoryItem.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, CategoryPage.routeName,
                            arguments: {
                              "title": categoryItem[index].name.toString(),
                              "categoryId": categoryItem[index].id.toString(),
                            });
                      },
                      child: Column(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage(categoryItem[index].image),
                                  ),
                                ),
                              )),
                          Expanded(
                              flex: 1,
                              child: Center(
                                child: Text(
                                  categoryItem[index].name,
                                  style: styleTitleItem,
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                ),
                              ))
                        ],
                      ),
                    );
                  },
                )
              : const Center(
                  child: Text('Not data'),
                );
        });
  }
}
