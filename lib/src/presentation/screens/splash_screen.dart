part of 'screens.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
        const Duration(seconds: 3),
        () => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const MainScreen(),
            ),
            (route) => false));

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Container(
          width: 190,
          height: 168,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/icons/icon_memomate.png'),
          )),
        ),
      ),
    );
  }
}
