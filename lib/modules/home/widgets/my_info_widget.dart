part of '../_lib.dart';

class MyInfoWidget extends StatelessWidget {
  const MyInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FadeInLeft(
          child: Container(
            height: 250,
            width: 250,
            decoration: BoxDecoration(
              color: getColor.primary,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.person_outline,
              size: 100,
            ),
          ),
        ),
        const SizedBox(width: 100),
        FadeInRight(
            child: Column(
          children: [
            Text(
              'Jose Andres Chia Lerzundy',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ))
      ],
    );
  }
}
