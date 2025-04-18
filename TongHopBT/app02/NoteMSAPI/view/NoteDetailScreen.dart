import "dart:io";
import "../model/Note.dart";
import "package:flutter/material.dart";
import "package:intl/intl.dart";

class NoteDetailScreen extends StatelessWidget {
  final Note note;

  const NoteDetailScreen({Key? key, required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chi tiết ghi chú'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildDetailRow('Tiêu đề', note.title),
                    Divider(),
                    _buildDetailRow('Nội dung', note.content),
                    Divider(),
                    _buildDetailRow('Thời gian tạo', DateFormat('dd/MM/yyyy').format(note.createdAt)),
                    Divider(),
                    _buildDetailRow('Thời gian cập nhật', DateFormat('dd/MM/yyyy').format(note.modifiedAt)),
                    Divider(),
                    if (note.tags != null && note.tags!.isNotEmpty)
                      Wrap(
                        spacing: 4,
                        children: note.tags!.map((tag) => Chip(label: Text(tag),)).toList(),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade600,
              fontSize: 12,
            ),
          ),
          SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

