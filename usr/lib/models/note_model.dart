class Note {
  final String id;
  final String title;
  final String originalContent;
  final String sinhalaContent;
  final DateTime createdAt;

  Note({
    required this.id,
    required this.title,
    required this.originalContent,
    required this.sinhalaContent,
    required this.createdAt,
  });
}

// Mock data for demonstration
List<Note> mockNotes = [
  Note(
    id: '1',
    title: 'Computer Science Basics',
    originalContent: 'The CPU is the brain of the computer. RAM is short term memory.',
    sinhalaContent: 'CPU යනු පරිගණකයේ මොළයයි. RAM යනු කෙටි කාලීන මතකයයි.',
    createdAt: DateTime.now().subtract(const Duration(days: 1)),
  ),
  Note(
    id: '2',
    title: 'Flutter Widgets',
    originalContent: 'Everything in Flutter is a Widget. Stateless widgets are immutable.',
    sinhalaContent: 'Flutter හි සියල්ල Widget එකකි. Stateless widgets වෙනස් කළ නොහැක (immutable).',
    createdAt: DateTime.now().subtract(const Duration(days: 2)),
  ),
];
