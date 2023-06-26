import 'package:flutter/material.dart';

class PasscodeCircles extends StatefulWidget {
  const PasscodeCircles({super.key});

  @override
  State<PasscodeCircles> createState() => _PasscodeCirclesState();
}

class _PasscodeCirclesState extends State<PasscodeCircles> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: 6,
      itemBuilder: (context, index) {
        return const CircleAvatar(
          radius: 5,
          backgroundColor: Color(0xFFEAEEF1),
        );
      },
    );
  }
}

// class CustomPasscodeCircle extends StatelessWidget {
//   const CustomPasscodeCircle({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const CircleAvatar(
//       radius: 5,
//       backgroundColor: Color(0xFFEAEEF1),
//     );
//   }
// }
