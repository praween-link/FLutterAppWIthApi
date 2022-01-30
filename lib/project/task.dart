class Task {
  final String title;
  final String date;
  final String starttime;
  final String endtime;
  final String description;
  final String category;
  final String status;
  final int proccess;

  Task(
      {required this.title,
      required this.date,
      required this.starttime,
      required this.endtime,
      required this.description,
      required this.category,
      required this.status,
      required this.proccess});

  // "title": "Title-4",
  //           "date": "Saturday, 29 January 2022",
  //           "start_time": "16:9",
  //           "end_time": "5:50",
  //           "description": "Description-4",
  //           "category": "SPORT",
  //           "status": "done",
  //           "proccess": 100
}
