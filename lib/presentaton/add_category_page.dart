import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecatalog/bloc/add_category_cuit/add_category_cubit.dart';
import 'package:flutter_ecatalog/bloc/category_cubit/category_cubit.dart';
import 'package:flutter_ecatalog/data/models/requests/category_freezed_request/category_freezed_request_model.dart';
import 'package:flutter_ecatalog/presentaton/camera_page.dart';
import 'package:image_picker/image_picker.dart';

class AddCategoryPage extends StatefulWidget {
  const AddCategoryPage({super.key});

  @override
  State<AddCategoryPage> createState() => _AddCategoryPageState();
}

class _AddCategoryPageState extends State<AddCategoryPage> {
  TextEditingController? titleController;

  XFile? picture;

  void takePicture(XFile file) {
    picture = file;
    setState(() {});
  }

  @override
  void initState() {
    titleController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    titleController!.dispose();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
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
                const SizedBox(
                  width: 8,
                ),
                ElevatedButton(
                  onPressed: () {
                    getImage(ImageSource.gallery);
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
            const SizedBox(
              height: 32,
            ),
            BlocConsumer<AddCategoryCubit, AddCategoryState>(
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
                          'Add Category Success',
                        ),
                      ),
                    );

                    titleController!.clear();

                    Navigator.pop(context);
                    context.read<CategoryCubit>().getAllCategory();
                  },
                );
              },
              builder: (context, state) {
                return state.maybeWhen(
                  loading: () {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                  orElse: () {
                    return ElevatedButton(
                        onPressed: () {
                          final addCategoryModel = CategoryFreezedRequestModel(
                            name: titleController!.text,
                          );

                          context
                              .read<AddCategoryCubit>()
                              .addCategory(addCategoryModel, picture!);
                        },
                        child: const Text('Add Category'));
                  },
                );
              },
            )
          ],
        ),
      )),
    );
  }
}
