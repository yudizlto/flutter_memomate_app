part of 'widgets.dart';

class CustomButton extends StatelessWidget {
  final String titleButton;
  final Function()? onPressed;
  final Color? color;

  const CustomButton({
    super.key,
    required this.titleButton,
    required this.onPressed,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Text(
        titleButton,
        style: TextStyle(
          color: color,
          fontSize: 18,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
