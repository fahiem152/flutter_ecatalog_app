import 'package:flutter/material.dart';
import 'package:dependencies/dependencies.dart';

import '../../blocs/register_cubit/register_cubit_cubit.dart';
import '../../data/models/requests/register_request_model.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController? nameController;
  TextEditingController? emailController;
  TextEditingController? passwordController;

  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    nameController!.dispose();
    emailController!.dispose();
    passwordController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Page'),
        elevation: 5,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text('Register'),
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'password',
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            BlocConsumer<RegisterCubitCubit, RegisterCubitState>(
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
                      SnackBar(
                        content: Text('Register Success with id: ${model.id}'),
                        backgroundColor: Colors.blue,
                      ),
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
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
                        final requestModel = RegisterRequestModel(
                            name: nameController!.text,
                            email: emailController!.text,
                            password: passwordController!.text);

                        context
                            .read<RegisterCubitCubit>()
                            .registerCubit(requestModel);
                      },
                      child: const Text(
                        'Register',
                      ),
                    );
                  },
                );
              },
            ),

            // BlocConsumer<RegisterBloc, RegisterState>(
            //   listener: (context, state) {
            //     if (state is RegisterError) {
            //       ScaffoldMessenger.of(context).showSnackBar(
            //         SnackBar(
            //           content: Text(state.message),
            //           backgroundColor: Colors.red,
            //         ),
            //       );
            //     }

            //     if (state is RegisterLoaded) {
            //       ScaffoldMessenger.of(context).showSnackBar(
            //         SnackBar(
            //           content:
            //               Text('Register Success with id: ${state.model.id}'),
            //           backgroundColor: Colors.blue,
            //         ),
            //       );
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => const LoginPage(),
            //         ),
            //       );
            //     }
            //   },
            //   builder: (context, state) {
            //     if (state is RegisterLoading) {
            //       return const Center(
            //         child: CircularProgressIndicator(),
            //       );
            //     }
            //     return ElevatedButton(
            //       onPressed: () {
            //         final requestModel = RegisterRequestModel(
            //             name: nameController!.text,
            //             email: emailController!.text,
            //             password: passwordController!.text);

            //         context.read<RegisterBloc>().add(
            //               DoRegisterEvent(
            //                 model: requestModel,
            //               ),
            //             );
            //       },
            //       child: const Text(
            //         'Register',
            //       ),
            //     );
            //   },
            // ),
            const SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Text.rich(
                TextSpan(
                  text: 'Sudah punya akun ?',
                  children: [
                    TextSpan(
                      text: ' Login',
                      style: TextStyle(
                        color: Colors.deepPurple,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
