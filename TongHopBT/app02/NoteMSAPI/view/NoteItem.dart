import "../view/NoteDetailScreen.dart";

import "dart:io";
import "../model/Note.dart";
import "package:flutter/material.dart";

class NoteItem extends StatelessWidget {
  final Note note;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const NoteItem({
    Key? key,
    required this.note,
    required this.onDelete,
    required this.onEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: _getColorByPriority(note.priority),
      child: ListTile(
        title: Text(note.title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(note.content, maxLines: 2, overflow: TextOverflow.ellipsis),
            SizedBox(height: 4),
            Text(
              'Tạo lúc: ${note.createdAt}',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            Text(
              'Cập nhật: ${note.modifiedAt}',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            SizedBox(height: 4),
            if (note.tags != null && note.tags!.isNotEmpty)
              Wrap(
                spacing: 4,
                children: note.tags!
                    .map((tag) => Chip(label: Text(tag)))
                    .toList(),
              ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.edit, color: Colors.blue),
              onPressed: onEdit,
            ),
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Xác nhận xoá'),
                    content: Text('Bạn có chắc chắn muốn xoá ghi chú này?'),
                    actions: [
                      TextButton(
                        child: Text('Huỷ'),
                        onPressed: () => Navigator.pop(context),
                      ),
                      TextButton(
                        child: Text('Xoá'),
                        onPressed: () {
                          onDelete();
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NoteDetailScreen(note: note),
            ),
          );
        },
      ),
    );
  }

  // Hàm để lấy màu sắc theo mức độ ưu tiên
  Color _getColorByPriority(int priority) {
    switch (priority) {
      case 1:
        return Colors.red.shade100;
      case 2:
        return Colors.yellow.shade100;
      case 3:
        return Colors.green.shade100;
      default:
        return Colors.white;
    }
  }
}