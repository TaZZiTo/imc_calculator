import 'package:flutter/material.dart';

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
        Column(
          children: [
            Image.asset('assets/images/male.png', height: 120),
            Text(
              'Hombre'.toUpperCase(),
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
        //Mujer
        Column(
          children: [
            Image.asset('assets/images/female.png', height: 120),
            Text(
              'Mujer'.toUpperCase(),
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
      ],
    );
  }
}
