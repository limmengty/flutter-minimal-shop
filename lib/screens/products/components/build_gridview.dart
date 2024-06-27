import 'package:ass_minimal_shop/components/product_card.dart';
import 'package:ass_minimal_shop/models/product_model.dart';
import 'package:ass_minimal_shop/screens/details/details_screen.dart';
import 'package:ass_minimal_shop/services/cache_logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BuildGridview extends StatelessWidget {
  const BuildGridview({required this.data});
  final ProductModel data;

  @override
  Widget build(BuildContext context) {
    // if (data == null) {
    //   return const LayoutResponse();
    // }
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () async {
          context.read<CacheLogic>().setLoading();
          Future.delayed(Duration(seconds: 1));
          context.read<CacheLogic>().read();
        },
        child: Container(
          color: Colors.transparent.withOpacity(.01),
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const SizedBox(height: 20),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.64,
                      crossAxisSpacing: 10,
                    ),
                    itemCount: data.data.products.length,
                    itemBuilder: (context, index) => ProductCard(
                      product: data.data.products[index],
                      onPress: () {
                        Navigator.pushNamed(
                          context,
                          DetailsScreen.routeName,
                          arguments: ProductDetailsArguments(
                              product: data.data.products[index]),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
