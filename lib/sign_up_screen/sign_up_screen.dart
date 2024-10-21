import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_api/sign_up_screen/sign_up_screen_controller.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final SignUpScreenController controller = Get.put(SignUpScreenController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Api Project',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text("Create Account",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 29,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'outfit')),
              const SizedBox(height: 8),
              const Text(
                "Sign Up",
                style: TextStyle(fontFamily: "outfit"),
              ),
              const SizedBox(
                height: 40,
              ),
              TextFormField(
                controller: controller.emailController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    color: Colors.grey,
                  ),
                  hintText: 'Email',
                  hintStyle: const TextStyle(
                    fontFamily: "inter",
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xff878E99)),
                      borderRadius: BorderRadius.circular(12)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xff878E99)),
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              TextFormField(
                controller: controller.passwordController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.password,
                    color: Colors.grey,
                  ),
                  hintText: 'Password',
                  hintStyle: const TextStyle(
                    fontFamily: "inter",
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xff878E99)),
                      borderRadius: BorderRadius.circular(12)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xff878E99)),
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              const SizedBox(
                height: 30,
              ),
              GetBuilder<SignUpScreenController>(builder: (context) {
                return GestureDetector(
                  onTap: () {
                    controller.signUp();
                  },
                  child: Container(
                    padding: const EdgeInsets.only(
                        left: 50, right: 50, top: 10, bottom: 10),
                    margin:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 30),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(50)),
                    child: controller.isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text(
                            'Sign up',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
