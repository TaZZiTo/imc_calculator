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
      body: bodyResult(context),
    );
  }

  Padding bodyResult(BuildContext context) {
    double fixedHeight = height / 100;
    double imcResult = weight / (fixedHeight * fixedHeight);
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
              padding: const EdgeInsets.only(
                top: 32,
                right: 16,
                left: 16,
                bottom: 32,
              ),
              child: Container(
                width: double.infinity,
                //height: double.infinity, //No lo entiende la columna, hay que wrapear el contenedor en un Expanded
                decoration: BoxDecoration(
                  color: AppColors.backgroundComponents,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      getTextByImc(imcResult),
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: getColorByImc(imcResult),
                      ),
                    ),
                    Text(
                      imcResult.toStringAsFixed(2),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 76,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      imcDescription(imcResult),
                      style: TextStyle(fontSize: 28, color: Colors.white), textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
            child: SizedBox(
              height: 60,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  backgroundColor: WidgetStateProperty.all(AppColors.primary),
                ),
                child: Text('FINALIZAR', style: TextStyles.bodyText),
              ),
            ),
          ),
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
  
  Color getColorByImc(double imcResult) {
    return switch(imcResult){
      <18.5 => Colors.blue, //IMC Bajo
      <24.9 => Colors.green, // IMC Normal
      <29.99 => Colors.orange, // Sobrepeso
      _ => Colors.red, // Obesidad el _ es como un else
    };
  }
  
  String getTextByImc(double imcResult) {
    return switch(imcResult){
    <18.5 => 'Imc Bajo',
    <24.9 => 'Imc Normal',
    <29.99 => 'Sobrepeso',
    _ => 'OBESIDAD',
    };
  }
  
  String imcDescription(double imcResult) {
    return switch(imcResult){
      <18.5 => 'Deberias intentar subir un poco de peso',
      <24.9 => 'Estás en tu peso ideal',
      <29.99 => 'Deberias empezar a cuidarte',
      _ => 'El momento es ahora, la salud es lo primero',
    };
  }
}
