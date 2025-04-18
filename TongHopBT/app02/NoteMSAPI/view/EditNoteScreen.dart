import 'package:app_02/NoteMSAPI/api/NoteApiService.dart';
import '../model/Note.dart';
import '../view/NoteForm.dart';
import 'package:flutter/material.dart';

class EditNoteScreen extends StatelessWidget {
  final Note note;

  const EditNoteScreen({Key? key, required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NoteForm(
      note: note,
      onSave: (Note updateNote) async {
        try {
          await NoteAPIService.instance.updateNote(updateNote);
          Navigator.pop(context, true); // Return true to indicate the user was updated

          // Show success message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Cập nhật ghi chú thành công'),
              backgroundColor: Colors.green,
            ),
          );
        } catch (e) {
          // Show error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Lỗi khi cập nhật ghi chú: $e'),
              backgroundColor: Colors.red,
            ),
          );
          Navigator.pop(context, false);
        }
      },
    );
  }
}