import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecatalog/bloc/login_cubit/login_cubit.dart';
import 'package:flutter_ecatalog/data/datasources/local_datasource.dart';

import 'package:flutter_ecatalog/presentaton/main_page.dart';
import 'package:flutter_ecatalog/presentaton/register_page.dart';

import '../data/models/requests/login_request_model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController? emailController;
  TextEditingController? passwordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();

    super.initState();
  }

  // void checkAuth() async {
  //   final auth = await LocalDatasource().getToken();
  //   if (auth.isNotEmpty) {
  //     Navigator.push(context, MaterialPageRoute(builder: (context) {
  //       return const HomePage();
  //     }));
  //   }
  // }

  @override
  void dispose() {
    super.dispose();

    emailController!.dispose();
    passwordController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
        elevation: 5,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text('Login'),
            ),
            const SizedBox(
              height: 16,
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
            BlocConsumer<LoginCubit, LoginCubitState>(
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
                    LocalDatasource().saveToken(model.access_token);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Login Success'),
                        backgroundColor: Colors.blue,
                      ),
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainPage(),
                      ),
                    );
                  },
                );
                // if (state is LoginError) {
                //   ScaffoldMessenger.of(context).showSnackBar(
                //     SnackBar(
                //       content: Text(state.message),
                //       backgroundColor: Colors.red,
                //     ),
                //   );
                // }

                // if (state is LoginLoaded) {
                //   LocalDatasource().saveToken(state.model.accessToken);
                //   ScaffoldMessenger.of(context).showSnackBar(
                //     const SnackBar(
                //       content: Text('Login Success'),
                //       backgroundColor: Colors.blue,
                //     ),
                //   );
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => const HomePage(),
                //     ),
                //   );
                // }
              },
              builder: (context, state) {
                return state.maybeWhen(loading: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }, orElse: () {
                  return ElevatedButton(
                    onPressed: () {
                      final requestModel = LoginRequestModel(
                          email: emailController!.text,
                          password: passwordController!.text);

                      context.read<LoginCubit>().loginCubit(requestModel);
                    },
                    child: const Text(
                      'Login',
                    ),
                  );
                });
                // if (state is LoginLoading) {
                //   return const Center(
                //     child: CircularProgressIndicator(),
                //   );
                // }
                // return ElevatedButton(
                //   onPressed: () {
                //     final requestModel = LoginRequestModel(
                //         email: emailController!.text,
                //         password: passwordController!.text);

                //     context.read<LoginBloc>().add(
                //           DoLoginEvent(
                //             model: requestModel,
                //           ),
                //         );
                //   },
                //   child: const Text(
                //     'Login',
                //   ),
                // );
              },
            ),
            // BlocConsumer<LoginBloc, LoginState>(
            //   listener: (context, state) {
            //     if (state is LoginError) {
            //       ScaffoldMessenger.of(context).showSnackBar(
            //         SnackBar(
            //           content: Text(state.message),
            //           backgroundColor: Colors.red,
            //         ),
            //       );
            //     }

            //     if (state is LoginLoaded) {
            //       LocalDatasource().saveToken(state.model.accessToken);
            //       ScaffoldMessenger.of(context).showSnackBar(
            //         const SnackBar(
            //           content: Text('Login Success'),
            //           backgroundColor: Colors.blue,
            //         ),
            //       );
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => const HomePage(),
            //         ),
            //       );
            //     }
            //   },
            //   builder: (context, state) {
            //     if (state is LoginLoading) {
            //       return const Center(
            //         child: CircularProgressIndicator(),
            //       );
            //     }
            //     return ElevatedButton(
            //       onPressed: () {
            //         final requestModel = LoginRequestModel(
            //             email: emailController!.text,
            //             password: passwordController!.text);

            //         context.read<LoginBloc>().add(
            //               DoLoginEvent(
            //                 model: requestModel,
            //               ),
            //             );
            //       },
            //       child: const Text(
            //         'Login',
            //       ),
            //     );
            //   },
            // ),
            const SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const RegisterPage();
                    },
                  ),
                );
              },
              child: const Text.rich(
                TextSpan(
                  text: 'Belum punya akun ?',
                  children: [
                    TextSpan(
                      text: ' Register',
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
