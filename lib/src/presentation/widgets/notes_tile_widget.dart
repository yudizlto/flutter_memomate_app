part of 'widgets.dart';

class NotesTile extends StatelessWidget {
  final String title;
  final String content;
  final DateTime date;
  final Function()? onTap;
  final Function()? onLongPress;

  const NotesTile({
    super.key,
    required this.title,
    required this.content,
    required this.date,
    required this.onTap,
    required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Container(
        width: double.infinity,
        height: 95,
        margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Note: Title of the notes
            Text(
              title,
              style: blackTitle.copyWith(
                fontSize: 18,
                fontWeight: bold,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),

            // Note: content of the notes
            Text(
              content,
              style: blackNotes,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),

            // Note: Date & Time of creation the notes
            Text(
              DateFormat('MMMM dd, yyyy hh:mm a').format(date).toString(),
              style: greyRoboto.copyWith(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
