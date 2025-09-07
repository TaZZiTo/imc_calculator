import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/text_styles.dart';

class ImcResultsScreen extends StatelessWidget {
  final double height;
  final int weight;

  const ImcResultsScreen({
    super.key,
    required this.weight,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    /* return Column(
      children: [
      Spacer(),
        Text(height.toString(), style: TextStyles.bodyText),
        Text(weight.toString(), style: TextStyles.bodyText),
      Spacer(),
      ],
    ); */ //La animación no es fluida, necesitamos un Scaffold
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: toolbarResult(),
      body: bodyResult(),
    );
  }

  Padding bodyResult() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,//De este modo, llevariamos el texto al principio si no lo queremos centrado
        children: [
          //Text(height.toString(), style: TextStyles.bodyText),
          //Text(weight.toString(), style: TextStyles.bodyText),
          Text(
            'Tu Resultado',
            style: TextStyle(
              fontSize: 38,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 32, right: 16, left: 16, bottom: 32),
              child: Container(
                width: double.infinity,
                //height: double.infinity, //No lo entiende la columna, hay que wrapear el contenedor en un Expanded
                decoration: BoxDecoration(
                  color: AppColors.backgroundComponents,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text('Prueba', style: TextStyles.bodyText,),
              ),
            ),
          )
        ],
      ),
    );
  }

  AppBar toolbarResult() {
    return AppBar(
      title: Text('Resultado', style: TextStyles.bodyText),
      backgroundColor: AppColors.primary,
    );
  }
}
