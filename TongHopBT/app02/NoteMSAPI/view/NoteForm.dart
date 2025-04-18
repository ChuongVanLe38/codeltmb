import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import '../model/Note.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class NoteForm extends StatefulWidget {
  final Note? note; // Null if creating new user, not null if editing
  final Function(Note note) onSave;

  const NoteForm({
    Key? key,
    this.note,
    required this.onSave,
  }) : super(key: key);

  @override
  _NoteFormState createState() => _NoteFormState();
}

class _NoteFormState extends State<NoteForm> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  DateTime _createdAt = DateTime.now();
  DateTime _modifiedAt = DateTime.now();
  List<String> _tags = [];
  String? _selectedColor;
  int _selectedPriority = 1; // Default priority
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    // If editing, populate form with note data
    if (widget.note != null) {
      _titleController.text = widget.note!.title;
      _contentController.text = widget.note!.content;
      _createdAt = widget.note!.createdAt;
      _modifiedAt = DateTime.now();
      _selectedPriority = widget.note!.priority;
      _selectedColor = widget.note!.color;
      _tags = widget.note!.tags ?? [];
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      final note = Note(
        id: widget.note?.id,
        title: _titleController.text,
        content: _contentController.text,
        priority: _selectedPriority,
        createdAt: _createdAt,
        modifiedAt: DateTime.now(),
        tags: _tags,
        color: _selectedColor,
      );

      widget.onSave(note);
    }
  }

  void _addTag(String tag) {
    setState(() {
      _tags.add(tag);
    });
  }

  void _removeTag(String tag) {
    setState(() {
      _tags.remove(tag);
    });
  }

  Future<void> _pickColor() async {
    Color? pickedColor = await showDialog<Color>(
      context: context,
      builder: (context) {
        Color tempColor = Colors.white;
        return AlertDialog(
          title: Text('Chọn màu'),
          content: SingleChildScrollView(
            child: BlockPicker(
              pickerColor: tempColor,
              onColorChanged: (color) {
                tempColor = color;
              },
            ),
          ),
          actions: [
            TextButton(
              child: Text('Xác nhận'),
              onPressed: () {
                Navigator.of(context).pop(tempColor);
              },
            ),
          ],
        );
      },
    );

    if (pickedColor != null) {
      setState(() {
        _selectedColor = pickedColor.value.toRadixString(16); // Convert to hex string
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    final isEditing = widget.note != null;


    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Cập nhật ghi chú' : 'Thêm chú mới'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// Tiêu đề
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Tiêu đề',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập tiêu đề';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Nội dung
              TextFormField(
                controller: _contentController,
                decoration: InputDecoration(
                  labelText: 'Nội dung',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập nội dung';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),


              // Mức độ ưu tiên
              Text('Mức độ ưu tiên:'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Radio(
                        value: 1,
                        groupValue: _selectedPriority,
                        onChanged: (value) {
                          setState(() {
                            _selectedPriority = value as int;
                          });
                        },
                      ),
                      Text('1'),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        value: 2,
                        groupValue: _selectedPriority,
                        onChanged: (value) {
                          setState(() {
                            _selectedPriority = value as int;
                          });
                        },
                      ),
                      Text('2'),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        value: 3,
                        groupValue: _selectedPriority,
                        onChanged: (value) {
                          setState(() {
                            _selectedPriority = value as int;
                          });
                        },
                      ),
                      Text('3'),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16),

              // Chọn màu sắc
              GestureDetector(
                onTap: _pickColor,
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    color: _selectedColor != null
                        ? Color(int.parse('0x' + _selectedColor!))
                        : Colors.white,
                  ),
                  child: Center(
                    child: Text(
                      'Chọn màu',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Nhập các nhãn
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nhãn',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      // Mở hộp thoại để nhập nhãn
                      showDialog<String>(
                        context: context,
                        builder: (context) {
                          final TextEditingController tagController =
                          TextEditingController();
                          return AlertDialog(
                            title: Text('Thêm nhãn'),
                            content: TextField(
                              controller: tagController,
                              decoration: InputDecoration(
                                labelText: 'Nhập nhãn',
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  if (tagController.text.isNotEmpty) {
                                    _addTag(tagController.text);
                                    Navigator.of(context).pop();
                                  }
                                },
                                child: Text('Thêm'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Hiển thị nhãn đã thêm
              Wrap(
                children: _tags.map((tag) {
                  return Chip(
                    label: Text(tag),
                    onDeleted: () => _removeTag(tag),
                  );
                }).toList(),
              ),
              SizedBox(height: 24),

              // Nút lưu
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: Text(
                    isEditing ? 'CẬP NHẬT' : 'THÊM MỚI',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}