// TODO: SPRINT 3: IMPLEMENTAR LOGIN COM GOOGLE
// TODO: SPRINT 3: IMPLEMENTAR LOGIN COM MICROSOFT

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:porkinio/app/common/utils/custom_form_field_validator.dart';
import 'package:porkinio/app/features/login/login_controller.dart';
import 'package:porkinio/app/features/login/login_state.dart';
import 'package:porkinio/app/common/widgets/custom_flat_button.dart';
import 'package:porkinio/app/common/widgets/custom_form_field.dart';
import 'package:porkinio/app/common/widgets/error_dialog.dart';
import 'package:porkinio/app/common/widgets/header_logo.dart';
import 'package:porkinio/app/common/widgets/password_form_field.dart';
import 'package:porkinio/app/features/account_recovery/account_recovery_page.dart';
import 'package:porkinio/app/features/home/home_page.dart';
import 'package:porkinio/app/features/sing_up/sign_up_page.dart';
import 'package:porkinio/app/common/constants/app_colors.dart';
import 'package:porkinio/app/common/constants/app_images.dart';
import 'package:porkinio/locator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const routeLoginPage = '/login-page';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _controller = locator.get<LoginController>();

  @override
  void initState() {
    super.initState();
    //TODO REVER O LOGICA DO dispose(), QUANDO USAMOS ESTA DANDO ERRO NA TELA
    //   _emailController.dispose();
    //  _passwordController.dispose();
    _controller.addListener(() {
      if (_controller.state is LoginLoadingState) {
        showDialog(
          context: context,
          builder: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
      if (_controller.state is LoginSuccessState) {
        Navigator.of(context).pushReplacementNamed(HomePage.routeHomePage);
      }
      if (_controller.state is LoginErrorState) {
     final error = (_controller.state as LoginErrorState).message;

  
          errorDialog(context, error! , error == "Usuário não cadastrado" ? SignUpPage.routeSignUpPage:LoginPage.routeLoginPage,error == "Usuário não cadastrado" ? "Cadastrar": "Tente novamente");
        }

        //TODO ESCOLHER QUAL USAR errorDialog OU customShowModalBottomSheet

        //Navigator.of(context);
        //customShowModalBottomSheet(context, error.message, SignUpPage.routeSignUpPage);
      });
    }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const HeaderLogo(),
            SizedBox(height: (MediaQuery.of(context).size.height) * 0.04),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: <Widget>[
                    CustomFormField(
                        formFieldText: "E-MAIL",
                        formFieldController: _emailController,
                        formFieldValidator:
                            CustomFormFieldValidator.validateEmail),
                    SizedBox(
                        height: (MediaQuery.of(context).size.height) * 0.04),
                    PasswordFormField(
                      passwordFormFieldText: 'SENHA',
                      passwordFormFieldController: _passwordController,
                      passwordFormFieldValidator:
                          CustomFormFieldValidator.validatePassword,
                      passwordValidator: (String? value) {},
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                    CustomFlatButton(
                      customButtonText: 'ENTRAR',
                      customColor: AppColors.primaryDark,
                      customWidth: 0.8,
                      customHeight: 0.06,
                      customFontSize: 25,
                      customColorText: AppColors.white,
                      customButtonOnPressed: () {
                        final valid = _formKey.currentState != null &&
                            _formKey.currentState!.validate();
                        if (valid) {
                          _controller.doLogin(
                            email: _emailController.text,
                            password: _passwordController.text,
                          );
                        }
                      },
                    ),
                    SizedBox(
                      height: (MediaQuery.of(context).size.height * 0.02),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                            AccountRecoveryPage.routeAccountRecoveryPage);
                      },
                      child: const Center(
                          child: Text(
                        'Esqueci minha senha',
                        style: TextStyle(fontSize: 15),
                      )),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    CustomFlatButton(
                      customButtonText: 'ENTRAR COM GOOGLE',
                      customButtonOnPressed: () {},
                      customColor: AppColors.textMediumGray,
                      customWidth: 0.9,
                      customHeight: 0.06,
                      customFontSize: 20,
                      customImage: AppImages.google,
                      customColorText: AppColors.white,
                      customColorImage: AppColors.orange,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    CustomFlatButton(
                      customButtonText: 'ENTRAR COM MICROSOFT',
                      customButtonOnPressed: () {},
                      customColor: AppColors.textMediumGray,
                      customWidth: 0.9,
                      customHeight: 0.06,
                      customFontSize: 20,
                      customColorText: AppColors.white,
                      customColorImage: AppColors.orange,
                      customImage: AppImages.microsoft,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    CustomFlatButton(
                      customButtonText: 'CADASTRAR NOVA CONTA',
                      customColor: AppColors.textMediumGray,
                      customWidth: 0.9,
                      customHeight: 0.06,
                      customFontSize: 20,
                      customColorText: AppColors.white,
                      customButtonOnPressed: () {
                        Navigator.of(context)
                            .pushNamed(SignUpPage.routeSignUpPage);
                      },
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
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

//PAULO CHECAR OS NOMES PRINCIPALMENTE DA FEATURE LOGIN
