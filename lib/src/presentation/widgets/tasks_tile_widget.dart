part of 'widgets.dart';

class TasksTile extends StatelessWidget {
  final String taskText;
  final bool isTaskComplete;
  final Function(bool?)? onChanged;
  final Function()? onLongPress;

  const TasksTile({
    super.key,
    required this.taskText,
    required this.isTaskComplete,
    required this.onChanged,
    required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onLongPress,
      child: Container(
        height: 80,
        margin: const EdgeInsets.fromLTRB(15, 10, 15, 0),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Checkbox(
              activeColor: kYellowColor,
              value: isTaskComplete,
              onChanged: onChanged,
            ),
            Text(
              taskText,
              style: TextStyle(
                color: isTaskComplete ? Colors.grey : kBlackColor,
                fontSize: 16,
                fontWeight: FontWeight.w800,
                decoration: isTaskComplete
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
