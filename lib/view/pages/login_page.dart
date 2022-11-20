import 'package:flutter/material.dart';
import 'package:projeto_flutter/view/components/formfield_register.dart';
import 'package:projeto_flutter/view/components/formfield_register_password.dart';
import 'package:projeto_flutter/view/components/logo_app_bar.dart';

import '../themes/app_colors.dart';
import '../themes/app_images.dart';
import '../components/buttons.dart';
import 'home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const login = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          const LogoAppBar(),
          SizedBox(height: (MediaQuery.of(context).size.height) * 0.04),
          Form(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                  children: <Widget>[
                    const FormRegister(textRegister: "NOME"),
                    SizedBox(
                        height: (MediaQuery.of(context).size.height) * 0.04),
                    const FormRegisterPassword(textRegister: 'SENHA'),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed(HomePage.home);
                        },
                        style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16))),
                          backgroundColor:
                              const MaterialStatePropertyAll(AppColors.green),
                        ),
                        child: const Text(
                          ' ENTRAR',
                          style:
                              TextStyle(fontSize: 25, color: AppColors.linear),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: (MediaQuery.of(context).size.height * 0.02),
                    ),
                    GestureDetector(
                      onTap: null,
                      child: const Center(
                          child: Text(
                        'Esqueci minha senha',
                        style: TextStyle(fontSize: 15),
                      )),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                    const SocialButton(
                        image: AppImages.google,
                        text: "ENTRAR COM GOOGLE        "),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02),
                    const Padding(
                        padding: EdgeInsets.only(left: 20, right: 40)),

                    const SocialButton(
                        image: AppImages.microsoft,
                        text: 'ENTRAR COM MICROSOFT'),
                        
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.06,
                        child: OutlinedButton(
                          style: ButtonStyle(
                              side: MaterialStateProperty.all(
                                  const BorderSide(color: AppColors.orange)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(16)))),
                          onPressed: () {},
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "CADASTRAR NOVA CONTA",
                                  style: TextStyle(
                                      fontSize: 18, color: AppColors.orange),
                                  textAlign: TextAlign.center,
                                ),
                              ]),
                        )),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                  ]),
            ),
          ),
        ]),
      ),
    );
  }
}
