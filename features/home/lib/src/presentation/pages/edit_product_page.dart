// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:dependencies/dependencies.dart';

import '../../bloc/edit_product_cubit/edit_productc_cubit.dart';
import '../../bloc/products_cubit/productsc_cubit.dart';
import '../../data/data.dart';
import '../../data/models/responses/product_freezed_response/product_freezed_response_model.dart';

class EditProductPage extends StatefulWidget {
  final ProductFreezedResponseModel product;
  // final ProductResponseModel product;
  const EditProductPage({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<EditProductPage> createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  TextEditingController? titleController;
  TextEditingController? priceController;
  TextEditingController? descriptionController;
  @override
  void initState() {
    titleController = TextEditingController(text: widget.product.title);
    priceController =
        TextEditingController(text: widget.product.price.toString());
    descriptionController =
        TextEditingController(text: widget.product.description);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    titleController!.dispose();
    priceController!.dispose();
    descriptionController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit Product Page'),
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
                  keyboardType: TextInputType.number,
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
                BlocConsumer<EditProductcCubit, EditProductcState>(
                  listener: (context, state) {
                    state.maybeWhen(
                        orElse: () {},
                        error: (message) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(message),
                              backgroundColor: Colors.red,
                            ),
                          );
                        },
                        loaded: (model) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.deepPurple,
                              content: Text(
                                'Edit Product Success',
                              ),
                            ),
                          );

                          titleController!.clear();
                          priceController!.clear();
                          descriptionController!.clear();
                          Navigator.pop(context);
                          context.read<ProductscCubit>().getProducts();
                        });
                  },
                  builder: (context, state) {
                    return state.maybeWhen(loading: () {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }, orElse: () {
                      return ElevatedButton(
                          onPressed: () {
                            final editProductModel = ProductRequestModel(
                              title: titleController!.text,
                              price: int.parse(
                                priceController!.text,
                              ),
                              description: descriptionController!.text,
                            );

                            context.read<EditProductcCubit>().editProduct(
                                  editProductModel,
                                  widget.product.id.toString(),
                                );
                          },
                          child: const Text('Edit Product'));
                    });

                    // BlocConsumer<EditProductBloc, EditProductState>(
                    //   listener: (context, state) {
                    //     if (state is EditProductError) {
                    //       ScaffoldMessenger.of(context).showSnackBar(
                    //         SnackBar(
                    //           content: Text(state.message),
                    //           backgroundColor: Colors.red,
                    //         ),
                    //       );
                    //     }
                    //     if (state is EditProductLoaded) {
                    //       ScaffoldMessenger.of(context).showSnackBar(
                    //         const SnackBar(
                    //           backgroundColor: Colors.deepPurple,
                    //           content: Text(
                    //             'Edit Product Success',
                    //           ),
                    //         ),
                    //       );

                    //       titleController!.clear();
                    //       priceController!.clear();
                    //       descriptionController!.clear();
                    //       Navigator.pop(context);
                    //       context.read<ProductsBloc>().add(GetProductsEvent());
                    //     }
                    //   },
                    //   builder: (context, state) {
                    //     if (state is EditProductLoading) {
                    //       return const Center(
                    //         child: CircularProgressIndicator(),
                    //       );
                    //     }
                    //     return ElevatedButton(
                    //         onPressed: () {
                    //           final editProductModel = ProductRequestModel(
                    //             title: titleController!.text,
                    //             price: int.parse(
                    //               priceController!.text,
                    //             ),
                    //             description: descriptionController!.text,
                    //           );

                    //           context.read<EditProductBloc>().add(
                    //               DoEditProductEvent(
                    //                   model: editProductModel,
                    //                   idProduct: widget.product.id.toString()));
                    //         },
                    //         child: const Text('Edit Product'));
                  },
                )
                // BlocConsumer<EditProductBloc, EditProductState>(
                //   listener: (context, state) {
                //     // if (state is EditProductError) {
                //     //   ScaffoldMessenger.of(context).showSnackBar(
                //     //     SnackBar(
                //     //       content: Text(state.message),
                //     //       backgroundColor: Colors.red,
                //     //     ),
                //     //   );
                //     // }
                //     // if (state is EditProductLoaded) {
                //     //   ScaffoldMessenger.of(context).showSnackBar(
                //     //     const SnackBar(
                //     //       content: Text(
                //     //         'Edit Product Success}',
                //     //       ),
                //     //     ),
                //     //   );

                //     //   titleController!.clear();
                //     //   priceController!.clear();
                //     //   descriptionController!.clear();
                //     //   Navigator.pop(context);
                //     //   // context.read<ProductsBloc>().Edit(GetProductsEvent());
                //     // }
                //   },
                //   builder: (context, state) {
                //     // if (state is EditProductLoading) {
                //     //   return const Center(
                //     //     child: CircularProgressIndicator(),
                //     //   );
                //     // }
                //     return ElevatedButton(
                //       onPressed: () {
                //         // final EditProductModel = ProductRequestModel(
                //         //   title: titleController!.text,
                //         //   price: int.parse(
                //         //     priceController!.text,
                //         //   ),
                //         //   description: descriptionController!.text,
                //         // );

                //         // context
                //         //     .read<EditProductBloc>()
                //         //     .Edit(DoEditProductEvent(
                //         //       model: EditProductModel,
                //         //     ));
                //       },
                //       child: const Text('Edit Product'),
                //     );
                //   },
                // )
              ],
            ),
          ),
        ));
  }
}
