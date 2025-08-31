import 'package:flutter/material.dart';
import 'package:imc_calculator/core/text_styles.dart';
import 'package:imc_calculator/core/app_colors.dart';

class GenderSelector extends StatefulWidget {
  const GenderSelector({super.key});

  @override
  State<GenderSelector> createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //Hombre
        Expanded(
          child: GestureDetector(
            onTap: (){
              setState(() {
                selectedGender = 'Hombre';
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 16,top: 16,bottom: 16,right: 8),
              child: Container(
                decoration: BoxDecoration(
                 color:  selectedGender == 'Hombre'
                ? AppColors.backgroundComponentsSelected
                : AppColors.backgroundComponents,
                 borderRadius: BorderRadius.circular(16),
                ) ,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Image.asset('assets/images/male.png', height: 120),
                      Text(
                        'Hombre'.toUpperCase(),
                        style:TextStyles.bodyText
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        //Mujer
        Expanded(
          child: GestureDetector(
            onTap:(){
              setState(() {
              selectedGender = 'Mujer';  
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 8,right: 16,top: 16, bottom: 16),
              child: Container(
                  decoration: BoxDecoration(
                    color: selectedGender == 'Mujer'
                    ? AppColors.backgroundComponentsSelected
                    : AppColors.backgroundComponents,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                    children: [
                      Image.asset('assets/images/female.png', height: 120),
                      Text(
                        'Mujer'.toUpperCase(),
                        style: TextStyles.bodyText,
                      ),
                    ],
                              ),
                  ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
