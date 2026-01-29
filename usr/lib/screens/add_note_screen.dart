import 'package:flutter/material.dart';
import '../models/note_model.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  final _sinhalaController = TextEditingController();
  bool _isTranslating = false;

  void _simulateTranslation() async {
    if (_contentController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter content to translate')),
      );
      return;
    }

    setState(() {
      _isTranslating = true;
    });

    // Simulate network delay for AI translation
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _isTranslating = false;
      // Since we don't have a real API key connected yet, we'll show a placeholder
      // or a simple mock translation for demo purposes.
      _sinhalaController.text = "[Translated to Sinhala]: ${_contentController.text}\n\n(Connect AI API for real translation)";
    });
  }

  void _saveNote() {
    if (_titleController.text.isEmpty || _sinhalaController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in Title and Sinhala Content')),
      );
      return;
    }

    final newNote = Note(
      id: DateTime.now().toString(),
      title: _titleController.text,
      originalContent: _contentController.text,
      sinhalaContent: _sinhalaController.text,
      createdAt: DateTime.now(),
    );

    setState(() {
      mockNotes.add(newNote);
    });

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Note'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Topic / Title',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.title),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _contentController,
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: 'Original Lecture Note (English)',
                border: OutlineInputBorder(),
                alignLabelWithHint: true,
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: _isTranslating ? null : _simulateTranslation,
              icon: _isTranslating
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.translate),
              label: Text(_isTranslating ? 'Translating...' : 'Translate to Sinhala (AI Demo)'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _sinhalaController,
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: 'Sinhala Note (Easy to Study)',
                border: OutlineInputBorder(),
                alignLabelWithHint: true,
                hintText: 'Edit the translation here to make it easier to study...',
              ),
              style: const TextStyle(fontFamily: 'NotoSansSinhala'),
            ),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: _saveNote,
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('Save Note', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
