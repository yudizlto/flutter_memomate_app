part of 'widgets.dart';

class DeleteDialog extends StatelessWidget {
  final Function()? onDelete;
  final Function()? onCancel;

  const DeleteDialog({
    super.key,
    this.onDelete,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: kBackgroundColor,
      title: const Text("Alert !!!"),
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        color: kBlackColor,
        fontSize: 20,
      ),
      actionsOverflowButtonSpacing: 20,
      actions: [
        ElevatedButton(
          onPressed: onCancel,
          child: Text(
            "Cancel",
            style: TextStyle(
              color: kBlackColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: onDelete,
          child: Text(
            "Delete",
            style: TextStyle(
              color: kRedColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
      content: Text(
        "Are you sure want to delete this ?",
        style: TextStyle(
          color: kBlackColor,
        ),
      ),
    );
  }
}
