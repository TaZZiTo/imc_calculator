import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/decoration_styles.dart';
import 'package:imc_calculator/core/text_styles.dart';

class NumberSelector extends StatefulWidget {
  final String title;
  final Function() onIncrement;
  final int value;
  const NumberSelector({
    super.key,
    required this.title,
    required this.value,
    required this.onIncrement,
  });

  @override
  State<NumberSelector> createState() => _NumberSelectorState();
}

class _NumberSelectorState extends State<NumberSelector> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: DecorationStyles
          .containerStyle, //Usamos la clase creada para definir los container
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Text(widget.title, style: TextStyles.bodyText),
            Text(
              widget.value.toString(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 38,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Boton menos
                FloatingActionButton(
                  onPressed: () {},
                  shape: CircleBorder(),
                  backgroundColor: AppColors.primary,
                  child: Icon(Icons.remove, color: Colors.white),
                ),
                SizedBox(width: 16),
                //Boton Mas
                FloatingActionButton(
                  onPressed: () {
                    widget.onIncrement();
                  },
                  shape: CircleBorder(),
                  backgroundColor: AppColors.primary,
                  child: Icon(Icons.add, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
