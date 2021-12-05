class ListofStudents {
  ListofStudents(
      {required this.name,
      required this.university,
      required this.course,
      required this.quote,
      required this.imageN});
  final String name;
  final String university;
  final String course;
  final String quote;
  final String imageN;
}

class FunctionStudents {
  List<ListofStudents> bank = [
    ListofStudents(
        name: "Tan, John Stephen",
        university: "UST",
        course: "ComSci",
        quote: "placeholder0",
        imageN: "Tan_About_Us.jpeg"),
    ListofStudents(
        name: "Von, Bryan Guron",
        university: "UST",
        course: "ComSci",
        quote: "placeholder1",
        imageN: "Guron_About_Us.jpeg"),
    ListofStudents(
        name: "Parayno, Jeanne Henrey",
        university: "UST",
        course: "ComSci",
        quote: "placeholder2",
        imageN: "Jan_About_Us.jpg"),
    ListofStudents(
        name: "Venegas, Michael Andrew",
        university: "UST",
        course: "ComSci",
        quote: "placeholder3",
        imageN: "Venegas_About_Us.jpeg"),
  ];
}
