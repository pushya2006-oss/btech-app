import 'package:flutter/material.dart';
import 'options_page.dart';

class SubjectPage extends StatelessWidget {
  final String year;
  final String semester;

  const SubjectPage({required this.year, required this.semester});

  final Map<String, List<String>> semesterSubjects = const {
    "Semester 1": ["Maths 1", "Physics", "Chemistry", "C Programming"],
    "Semester 2": ["Maths 2", "Electrical", "Mechanics", "Python"],
    "Semester 3": ["Data Structures", "Digital Logic", "Maths 3"],
    "Semester 4": ["Operating Systems", "DBMS", "OOP"],
    // ... continue mapping for others
  };

  @override
  Widget build(BuildContext context) {
    final subjects = semesterSubjects[semester] ?? [];

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(semester, style: const TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
      ),
      body: subjects.isEmpty
          ? const Center(child: Text("No subjects listed yet"))
          : ListView.separated(
              padding: const EdgeInsets.all(20),
              itemCount: subjects.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey[200]!),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    leading: CircleAvatar(
                      backgroundColor: Colors.indigo[50],
                      child: Icon(Icons.book_outlined, color: Colors.indigo[700], size: 20),
                    ),
                    title: Text(subjects[index], style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 14, color: Colors.grey),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => OptionsPage(subject: subjects[index], year: year, semester: semester),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}