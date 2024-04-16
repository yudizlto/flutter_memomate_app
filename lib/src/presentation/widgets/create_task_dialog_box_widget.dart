part of 'widgets.dart';

class CreateTaskDialogBox extends StatelessWidget {
  final TextEditingController controller;
  final Function()? onSave;
  final Function()? onCancel;

  const CreateTaskDialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(10),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 240,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: kWhiteColor,
            ),
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
            child: Column(
              children: [
                // Note: Input your tasks
                TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                    hintText: 'Tap "Enter" to create subtasks',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  maxLines: 4,
                ),

                // Note: Cancel & Done Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Note: Cancel Button
                    CustomButton(
                      titleButton: 'Cancel',
                      onPressed: onCancel,
                    ),

                    // Note: Done Button
                    CustomButton(
                      titleButton: 'Done',
                      color: kYellowColor,
                      onPressed: onSave,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
