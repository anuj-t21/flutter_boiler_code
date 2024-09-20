import 'package:auto_route/auto_route.dart';
import 'package:flutter_boiler_code/core/constants/constants.dart';
import 'package:flutter_boiler_code/core/router/data/app_router.dart';
import 'package:flutter_boiler_code/core/services/app_services.dart';
import 'package:flutter_boiler_code/core/utils/screen_util/screen_util.dart';
import 'package:flutter_boiler_code/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_boiler_code/features/auth/presentation/widgets/auth_field.dart';
import 'package:flutter_boiler_code/features/auth/presentation/widgets/auth_gradient_button.dart';
import 'package:flutter_boiler_code/shared/presentation/widgets/app_loader.dart';
import 'package:flutter_boiler_code/shared/presentation/widgets/app_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: AppPaddings.paddingScaffold,
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthFailure) {
              showAppSnackBar(context, state.message);
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return const AppLoader();
            }
            return Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sign Up',
                    style: AppTextStyles.clashDisplay.s40.w6,
                  ),
                  SizedBox(height: 28.h),
                  AuthField(
                    hintText: 'Name',
                    controller: nameController,
                  ),
                  SizedBox(height: 16.h),
                  AuthField(
                    hintText: 'Email',
                    controller: emailController,
                  ),
                  SizedBox(height: 16.h),
                  AuthField(
                    hintText: 'Password',
                    controller: passwordController,
                    isObscureText: true,
                  ),
                  SizedBox(height: 16.h),
                  AuthGradientButton(
                    buttonText: 'Sign Up',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        context.read<AuthBloc>().add(
                              AuthSignUp(
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                                name: nameController.text.trim(),
                              ),
                            );
                      }
                    },
                  ),
                  SizedBox(height: 16.h),
                  GestureDetector(
                    onTap: () {
                      AppServices.router.push(const LoginRoute());
                    },
                    child: RichText(
                      text: TextSpan(
                        text: 'Already have an account? ',
                        style: Theme.of(context).textTheme.titleMedium,
                        children: [
                          TextSpan(
                            text: 'Sign In',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  color: AppColors.gradient2,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
