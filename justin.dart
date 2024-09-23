import 'dart:io';

class Student {
  String name;
  String rollNumber;
  bool isPresent;

  Student(this.name, this.rollNumber, this.isPresent);
}

void main() {
  // Create a list to store students
  List<Student> students = [];

  // Main menu
  while (true) {
    print("Student Attendance System");
    print("1. Take Roll Call");
    print("2. Mark Attendance");
    print("3. View Attendance Records");
    print("4. Exit");

    // Get user input
    String input = stdin.readLineSync() ?? "";

    // Process user input
    switch (input) {
      case "1":
        takeRollCall(students);
        break;
      case "2":
        markAttendance(students);
        break;
      case "3":
        viewAttendanceRecords(students);
        break;
      case "4":
        print("Goodbye!");
        return;
      default:
        print("Invalid input. Please try again.");
    }
  }
}

void takeRollCall(List<Student> students) {
  print("Take Roll Call");
  print("Enter student names and roll numbers (separated by commas):");
  String input = stdin.readLineSync() ?? "";

  // Create students
  List<String> studentData = input.split(",");
  for (String data in studentData) {
    List<String> parts = data.trim().split(" ");
    String name = parts[0];
    String rollNumber = parts[1];
    students.add(Student(name, rollNumber, false));
  }

  print("Roll call taken successfully!");
}

void markAttendance(List<Student> students) {
  print("Mark Attendance");
  print("Enter roll number to mark attendance:");
  String rollNumber = stdin.readLineSync() ?? "";

  // Find student
  Student student;
  for (Student s in students) {
    if (s.rollNumber == rollNumber) {
      student = s;
      break;
    }
  }

  if (student == null) {
    print("Student not found. Please try again.");
    return;
  }

  // Mark attendance
  student.isPresent = true;
  print("Attendance marked successfully!");
}

void viewAttendanceRecords(List<Student> students) {
  print("View Attendance Records");
  for (Student student in students) {
    print("${student.name} (${student.rollNumber}): ${student.isPresent ? "Present" : "Absent"}");
  }
}