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
            decoration: const BoxDecoration(
              color: Colors.grey,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.person_outline,
              size: 100,
            ),
          ),
        ),
        const SizedBox(width: 30),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeInRight(
              child: const Text(
                'Jose Andres Chia Lerzundy',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 30),
            _logoRow(
              'assets/logos/linkedin.png',
              'andreschia',
              'https://www.linkedin.com/in/andreschia/',
            ),
            _logoRow(
              'assets/logos/github.png',
              'chiasaurio',
              'https://github.com/Chiasaurio',
            ),
          ],
        )
      ],
    );
  }

  Widget _logoRow(String asset, String label, String url) {
    return FadeInRight(
      delay: const Duration(milliseconds: 300),
      child: Row(
        children: [
          SizedBox(
            width: 30,
            height: 30,
            child: Image.asset(asset),
          ),
          const SizedBox(width: 5),
          InkWell(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 54, 77, 179),
              ),
            ),
            onTap: () => launchUrl(Uri.parse(url)),
          ),
        ],
      ),
    );
  }
}
