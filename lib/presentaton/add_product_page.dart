import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecatalog/data/models/requests/product_request_model.dart';

import '../bloc/add_product/add_product_bloc.dart';
import '../bloc/products/products_bloc.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  TextEditingController? titleController;
  TextEditingController? priceController;
  TextEditingController? descriptionController;
  @override
  void initState() {
    titleController = TextEditingController();
    priceController = TextEditingController();
    descriptionController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    titleController!.dispose();
    priceController!.dispose();
    descriptionController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Product Page'),
          elevation: 5,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    labelText: 'Title',
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: priceController,
                  decoration: const InputDecoration(
                    labelText: 'Price',
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: descriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                  ),
                  maxLines: 5,
                ),
                const SizedBox(
                  height: 32,
                ),
                BlocConsumer<AddProductBloc, AddProductState>(
                  listener: (context, state) {
                    if (state is AddProductError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.message),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                    if (state is AddProductLoaded) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Add Product Success}',
                          ),
                        ),
                      );

                      titleController!.clear();
                      priceController!.clear();
                      descriptionController!.clear();
                      Navigator.pop(context);
                      context.read<ProductsBloc>().add(GetProductsEvent());
                    }
                  },
                  builder: (context, state) {
                    if (state is AddProductLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ElevatedButton(
                        onPressed: () {
                          final addProductModel = ProductRequestModel(
                            title: titleController!.text,
                            price: int.parse(
                              priceController!.text,
                            ),
                            description: descriptionController!.text,
                          );

                          context.read<AddProductBloc>().add(DoAddProductEvent(
                                model: addProductModel,
                              ));
                        },
                        child: const Text('Add Product'));
                  },
                )
              ],
            ),
          ),
        ));
  }
}
