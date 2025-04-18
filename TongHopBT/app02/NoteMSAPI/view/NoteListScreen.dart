import 'package:app_02/NoteMSAPI/api/NoteApiService.dart';
import "../model/Note.dart";
import "../view/NoteItem.dart";
import "package:flutter/material.dart";
import '../view/AddNoteScreen.dart';
import '../view/EditNoteScreen.dart';

class NoteListScreen extends StatefulWidget {
  @override
  _NoteListScreenState createState() => _NoteListScreenState();
}

class _NoteListScreenState extends State<NoteListScreen> {
  late Future<List<Note>> _notesFuture;
  bool _isGridView = false;
  String _searchQuery = '';
  String _filterPriority = 'All';

  @override
  void initState() {
    super.initState();
    _refreshNotes();
  }

  Future<void> _refreshNotes() async {
    setState(() {
      _notesFuture = NoteAPIService.instance.getAllNote();
    });
  }

  Future<List<Note>> _getFilteredNotes() async {
    List<Note> notes = await _notesFuture;
    if (_filterPriority != 'All') {
      int priority = int.parse(_filterPriority);
      notes = notes.where((note) => note.priority == priority).toList();
    }
    if (_searchQuery.isNotEmpty) {
      notes = await NoteAPIService.instance.searchNotesByTittle(_searchQuery);
    }
    return notes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Danh sách ghi chú'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _refreshNotes,
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              setState(() {
                _filterPriority = value;
              });
            },
            itemBuilder: (context) => [
              PopupMenuItem(value: 'All', child: Text('Tất cả')),
              PopupMenuItem(value: '1', child: Text('Ưu tiên cao')),
              PopupMenuItem(value: '2', child: Text('Ưu tiên trung bình')),
              PopupMenuItem(value: '3', child: Text('Ưu tiên thấp')),
            ],
          ),
          IconButton(
            icon: Icon(_isGridView ? Icons.list : Icons.grid_view),
            onPressed: () {
              setState(() {
                _isGridView = !_isGridView;
              });
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Note>>(
        future: _getFilteredNotes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator()
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Đã xảy ra lỗi: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Không có ghi chú nào'),
            );
          }  else {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(

                    decoration: InputDecoration(
                      icon: Icon(Icons.search),
                      labelText: 'Tìm kiếm ghi chú',
                      border: OutlineInputBorder(),

                    ),
                    onSubmitted: (value) {
                      setState(() {
                        _searchQuery = value;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: _isGridView
                      ? GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1,
                    ),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final note = snapshot.data![index];
                      return NoteItem(
                        note: note,
                        onDelete: () async {
                          await NoteAPIService.instance.deleteNote(note.id!);
                          _refreshNotes();
                        },
                        onEdit: () async {
                          // Mở màn hình chỉnh sửa
                        },
                      );
                    },
                  )
                      : ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final note = snapshot.data![index];
                      return NoteItem(
                        note: note,
                        onDelete: () async {
                          await NoteAPIService.instance.deleteNote(note.id!);
                          _refreshNotes();
                        },
                        onEdit: () async {
                          // Navigate to edit screen
                          final updated = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditNoteScreen (note: note),
                            ),
                          );
                          if (updated == true) {
                            _refreshNotes();
                          }
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          final created = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddNoteScreen(),
            ),
          );
          if (created == true) {
            _refreshNotes();
          }
        },
      ),
    );
  }
}
