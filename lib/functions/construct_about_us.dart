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
        quote:
            "\"A sword wields no strength unless the hand that holds it has courage.\"",
        imageN: "Tan_About_Us.jpg"),
    ListofStudents(
        name: "Von, Bryan Guron",
        university: "UST",
        course: "ComSci",
        quote: "\"To Infinity and Beyond.\"",
        imageN: "Guron_About_Us.png"),
    ListofStudents(
        name: "Parayno, Jeanne Henrey",
        university: "UST",
        course: "ComSci",
        quote: "\"Work Hard Play Hard.\"",
        imageN: "Jan_About_Us.jpg"),
    ListofStudents(
        name: "Venegas, Michael Andrew",
        university: "UST",
        course: "ComSci",
        quote: "\"Time is Gold.\"",
        imageN: "Venegas_About_Us.png"),
  ];
}
