import 'package:flutter/material.dart';
import 'package:tacaro/shared/theme/app_text.dart';
import 'package:tacaro/shared/theme/app_theme.dart';

class InputText extends StatelessWidget {
  //criação de variável para utilizar parâmetros nomeados
  final String label;
  final String hint;
  const InputText({
    required this.label,
    required this.hint,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //repare que foi usada a variável label criada acima
        Text(label).label,
        SizedBox(
          height: 12,
        ),
        TextFormField(
          style: AppTheme.textStyles.input,
          decoration: InputDecoration(
            hintStyle: AppTheme.textStyles.hint,
            //repare que foi usada a variável hint criada acima
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                10,
              ),
              borderSide: BorderSide(
                color: AppTheme.colors.border,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
