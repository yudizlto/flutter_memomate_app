part of 'screens.dart';

class DetailNoteScreen extends StatefulWidget {
  final Notes note;

  const DetailNoteScreen({
    super.key,
    required this.note,
  });

  @override
  State<DetailNoteScreen> createState() => _DetailNoteScreenState();
}

class _DetailNoteScreenState extends State<DetailNoteScreen> {
  late final TextEditingController _titleController;
  late final TextEditingController _contentController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.note.title);
    _contentController = TextEditingController(text: widget.note.content);
  }

  int calculateTheCharacter() {
    final titleCharacterCount = _titleController.text.length;
    final contentCharacterCount = _contentController.text.length;
    return titleCharacterCount + contentCharacterCount;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              // Note: Save Button
              PopupMenuItem(
                value: 1,
                child: const Text(
                  'Save',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () async {
                  final updatedNote = widget.note
                    ..title = _titleController.text
                    ..content = _contentController.text
                    ..date = DateTime.now();
                  await updatedNote.save();
                  Navigator.pop(context);
                },
              ),

              // Note: Delete Button
              PopupMenuItem(
                value: 2,
                child: const Text(
                  'Delete',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {},
              ),
            ],
            offset: Offset.zero,
            color: kWhiteColor,
            elevation: 2,
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.only(
          left: 24,
          top: 10,
          right: 24,
        ),
        child: ListView(
          children: [
            // Note: Header (Title & Created At)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Note: Title of the notes
                TextField(
                  controller: _titleController,
                  cursorColor: kYellowColor,
                  style: blackTitle.copyWith(
                    fontSize: 24,
                    fontWeight: bold,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),

                // Note: Information of Created At & count of characters
                Row(
                  children: [
                    Text(
                      DateFormat('MMMM dd, yyyy hh:mm a')
                          .format(widget.note.date),
                      style: greyRoboto.copyWith(fontSize: 12),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '|   ${calculateTheCharacter()} ${calculateTheCharacter() == 1 ? 'character' : 'characters'}',
                      style: greyRoboto.copyWith(fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),

            // Note: Content of the notes
            TextField(
              controller: _contentController,
              cursorColor: kYellowColor,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              style: blackNotes.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
              decoration: const InputDecoration(
                alignLabelWithHint: true,
                border: InputBorder.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
