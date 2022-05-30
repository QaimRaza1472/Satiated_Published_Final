class Previousintensions {
  final String intensiontitle;
  final String date;
  final String fromtime;
  final String totime;
  final String done;
  final String userid;

  Previousintensions(this.intensiontitle, this.date, this.fromtime, this.totime,
      this.done, this.userid);

  Map<String, dynamic> toMap() {
    return {
      'intensiontitle': intensiontitle,
      'date': date,
      'fromtime': fromtime,
      'totime': totime,
      'done': done,
      'userid': userid
    };
  }
}

class PreviousintensionsGET {
  int id;
  final String intensiontitle;
  final String date;
  final String fromtime;
  final String totime;
  final String done;
  final String userid;

  PreviousintensionsGET(this.id, this.intensiontitle, this.date, this.fromtime,
      this.totime, this.done, this.userid);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'intensiontitle': intensiontitle,
      'date': date,
      'fromtime': fromtime,
      'totime': totime,
      'done': done,
      'userid': userid
    };
  }
}
