import 'package:ass_minimal_shop/models/product_model.dart';
import 'package:ass_minimal_shop/screens/products/components/build_gridview.dart';
import 'package:ass_minimal_shop/services/cache_logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ComputerProduct extends StatelessWidget {
  const ComputerProduct({super.key});
  @override
  Widget build(BuildContext context) {
    bool loading = context.watch<CacheLogic>().loading;
    String? error = context.watch<CacheLogic>().error;

    if (loading) {
      return const Center(child: Text("Loading..."));
    }

    ProductModel? model = context.watch<CacheLogic>().computerModel;
    if (model == null) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Center(child: Text("Something went wrong, $error")),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  context.read<CacheLogic>().setLoading();
                  context.read<CacheLogic>().read();
                },
                child: const Text("Reload"),
              ),
            ],
          ),
        ),
      );
    } else {
      return BuildGridview(data: model);
    }
  }
}
