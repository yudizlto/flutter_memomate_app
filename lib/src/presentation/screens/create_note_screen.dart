part of 'screens.dart';

class CreateNoteScreen extends StatefulWidget {
  const CreateNoteScreen({super.key});

  @override
  State<CreateNoteScreen> createState() => _CreateNotesPageState();
}

class _CreateNotesPageState extends State<CreateNoteScreen> {
  final _notesController = TextEditingController();
  final _titleController = TextEditingController();

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
                  final newNote = Notes(
                    title: _titleController.text,
                    content: _notesController.text,
                    date: DateTime.now(),
                  );
                  await Hive.box<Notes>('noteBox').add(newNote);
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
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Title',
                    hintStyle: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                    border: InputBorder.none,
                  ),
                ),

                // Note: Information of Created At & count of characters
                Text(
                  DateFormat('MMMM dd, yyyy hh:mm a').format(DateTime.now()),
                  style: greyRoboto.copyWith(fontSize: 12),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),

            // Note: Content of the notes
            TextField(
              controller: _notesController,
              cursorColor: kYellowColor,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                hintText: 'Start Typing',
                hintStyle: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
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
