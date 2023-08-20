import 'dart:io';

import 'package:components/components.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import '../../bloc/add_product_cubit/add_productc_cubit.dart';
import '../../bloc/products_cubit/productsc_cubit.dart';
import '../../data/data.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  TextEditingController? titleController;
  TextEditingController? priceController;
  TextEditingController? descriptionController;
  XFile? picture;

  List<XFile>? multiplePicture;

  void takePicture(XFile file) {
    picture = file;
    setState(() {});
  }

  void takeMultiplePicture(List<XFile> files) {
    multiplePicture = files;
    setState(() {});
  }

  @override
  void initState() {
    titleController = TextEditingController();
    priceController = TextEditingController();
    descriptionController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    titleController!.dispose();
    priceController!.dispose();
    descriptionController!.dispose();
  }

  Future<void> getImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo = await picker.pickImage(
      source: source,
      imageQuality: 50,
    );
    if (photo != null) {
      setState(() {
        picture = photo;
      });
    }
  }

  Future<void> getMultipleImage() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile> photo = await picker.pickMultiImage();

    multiplePicture = photo;
    setState(() {});
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
                picture != null
                    ? SizedBox(
                        height: 200,
                        width: 200,
                        child: Image.file(
                          File(
                            picture!.path,
                          ),
                        ),
                      )
                    : Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          border: Border.all(),
                        ),
                      ),
                // multiplePicture != null
                //     ? Wrap(
                //         children: [
                //           ...multiplePicture!
                //               .map((e) => SizedBox(
                //                   height: 120,
                //                   width: 120,
                //                   child: Padding(
                //                     padding: const EdgeInsets.symmetric(
                //                         horizontal: 8),
                //                     child: Image.file(File(e.path)),
                //                   )))
                //               .toList()
                //         ],
                //       )
                //     : const SizedBox(),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        await availableCameras().then(
                          (value) => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) {
                                return CameraPage(
                                  takePicture: takePicture,
                                  cameras: value,
                                );
                              },
                            ),
                          ),
                        );
                      },
                      child: const Text(
                        'Camera',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        getImage(ImageSource.gallery);
                        // getMultipleImage();
                      },
                      child: const Text(
                        'Galery',
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
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
                BlocConsumer<AddProductcCubit, AddProductcState>(
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
                            content: Text(
                              'Add Product Success',
                            ),
                          ),
                        );

                        titleController!.clear();
                        priceController!.clear();
                        descriptionController!.clear();
                        Navigator.pop(context);
                        context.read<ProductscCubit>().getProducts();
                      },
                    );
                  },
                  builder: (context, state) {
                    return state.maybeWhen(loading: () {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }, orElse: () {
                      return ElevatedButton(
                          onPressed: () {
                            final addProductModel = ProductRequestModel(
                              title: titleController!.text,
                              price: int.parse(
                                priceController!.text,
                              ),
                              description: descriptionController!.text,
                              // images: picture!,
                            );

                            context.read<AddProductcCubit>().addProduct(
                                  addProductModel,
                                  picture!,
                                );
                          },
                          child: const Text('Add Product'));
                    });
                  },
                )
                // BlocConsumer<AddProductBloc, AddProductState>(
                //   listener: (context, state) {
                //     if (state is AddProductError) {
                //       ScaffoldMessenger.of(context).showSnackBar(
                //         SnackBar(
                //           content: Text(state.message),
                //           backgroundColor: Colors.red,
                //         ),
                //       );
                //     }
                //     if (state is AddProductLoaded) {
                //       ScaffoldMessenger.of(context).showSnackBar(
                //         const SnackBar(
                //           content: Text(
                //             'Add Product Success}',
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
                //     if (state is AddProductLoading) {
                //       return const Center(
                //         child: CircularProgressIndicator(),
                //       );
                //     }
                //     return ElevatedButton(
                //         onPressed: () {
                //           final addProductModel = ProductRequestModel(
                //             title: titleController!.text,
                //             price: int.parse(
                //               priceController!.text,
                //             ),
                //             description: descriptionController!.text,
                //           );

                //           context.read<AddProductBloc>().add(DoAddProductEvent(
                //                 model: addProductModel,
                //               ));
                //         },
                //         child: const Text('Add Product'));
                //   },
                // )
              ],
            ),
          ),
        ));
  }
}
