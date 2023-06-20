import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecatalog/bloc/category_cubit/category_cubit.dart';
import 'package:flutter_ecatalog/presentaton/add_category_page.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  void initState() {
    super.initState();
    context.read<CategoryCubit>().getAllCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(
            16,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Category Page',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const AddCategoryPage();
                      },
                    ),
                  );
                },
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: const Color(0xff03dac6),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Icon(Icons.add),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: BlocBuilder<CategoryCubit, CategoryState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
                loaded: (model) {
                  return ListView.builder(
                      itemCount: model.length,
                      itemBuilder: (
                        context,
                        index,
                      ) {
                        return Container(
                          padding: const EdgeInsets.all(
                            24,
                          ),
                          width: double.infinity,
                          height: 225,
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                      image: NetworkImage(model[index].image),
                                      fit: BoxFit.cover,
                                      onError: (exception, stackTrace) {
                                        debugPrint('Image Not Available');
                                      }),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(
                                      0.5,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(
                                        12,
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    model[index].name,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      });
                },
              );
            },
          ),
        )
      ],
    );
  }
}
