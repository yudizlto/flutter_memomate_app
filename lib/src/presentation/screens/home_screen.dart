part of 'screens.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: kYellowColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CreateNoteScreen(),
            ),
          );
        },
        child: Icon(
          Icons.add,
          color: kWhiteColor,
          size: 40,
        ),
      ),
      body: Column(
        children: [
          SafeArea(
            child: Container(
              margin: const EdgeInsets.only(bottom: 70),
            ),
          ),

          // Note: Retrieve data from 'noteBox' box
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: Hive.box<Notes>('noteBox').listenable(),
              builder: (context, Box<Notes> box, _) {
                return ListView.builder(
                  itemCount: box.length,
                  itemBuilder: (context, index) {
                    final note = box.getAt(index);

                    return NotesTile(
                      title: note!.title,
                      content: note.content,
                      date: note.date,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailNoteScreen(note: note),
                          ),
                        );
                      },
                      onLongPress: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return DeleteDialog(
                                onCancel: () => Navigator.pop(context),
                                onDelete: () async {
                                  await box.deleteAt(index);
                                  Navigator.pop(context);
                                },
                              );
                            });
                      },
                    );
                  },
                );
              },
            ),
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
