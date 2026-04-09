import 'package:flutter/material.dart';
import 'subject_page.dart';

class SemesterPage extends StatelessWidget {
  final String year;

  const SemesterPage({required this.year});

  List<String> getSemesters() {
    switch (year) {
      case "1st Year":
        return ["Semester 1", "Semester 2"];
      case "2nd Year":
        return ["Semester 3", "Semester 4"];
      case "3rd Year":
        return ["Semester 5", "Semester 6"];
      case "4th Year":
        return ["Semester 7", "Semester 8"];
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final semesters = getSemesters();

    return Scaffold(
      appBar: AppBar(title: Text(year)),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: semesters.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                child: Text("S${index + (year == "1st Year" ? 1 : year == "2nd Year" ? 3 : year == "3rd Year" ? 5 : 7)}"),
              ),
              title: Text(
                semesters[index],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SubjectPage(
                      year: year,
                      semester: semesters[index],
                    ),
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