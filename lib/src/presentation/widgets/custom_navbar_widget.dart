part of 'widgets.dart';

class CustomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int index)? onTap;

  const CustomNavBar({
    super.key,
    this.selectedIndex = 0,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      // color: Colors.blue[200],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Note: Notes List Page Navigation Button
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap!(0);
              }
            },
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(selectedIndex == 0
                      ? 'assets/icons/icon_note_fill.png'
                      : 'assets/icons/icon_note.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // Note: ToDo List Page Navigation Button
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap!(1);
              }
            },
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(selectedIndex == 1
                      ? 'assets/icons/icon_checkbox_fill.png'
                      : 'assets/icons/icon_checkbox.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
