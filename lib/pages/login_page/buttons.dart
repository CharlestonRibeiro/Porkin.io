import 'package:flutter/material.dart';
import 'package:projeto_flutter/themes/app_colors.dart';

class SocialButton extends StatelessWidget {
  final String image;
  final String text;

  const SocialButton({required this.image, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.075,
        child: OutlinedButton(
          style: ButtonStyle(
              side: MaterialStateProperty.all(
                  const BorderSide(color: AppColors.orange)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)))),
          onPressed: () {},
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset(
              image,
              height: 25,
              color: AppColors.orange,
              alignment: Alignment.center,
            ),
            const Padding(padding: EdgeInsets.only(left: 20, right: 40)),
            Text(
              text,
              style: const TextStyle(fontSize: 18, color: AppColors.orange),
              textAlign: TextAlign.center,
            )
          ]),
        ));
  }
}
