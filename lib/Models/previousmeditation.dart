class PreviousMeditation {
  final String male;
  final String date;

  final String done;
  final String userid;

  PreviousMeditation(this.male, this.date, this.done, this.userid);

  Map<String, dynamic> toMap() {
    return {'male': male, 'date': date, 'done': done, 'userid': userid};
  }
}

class PreviousMeditationGET {
  int id;
  final String male;
  final String date;
  final String done;
  final String userid;

  PreviousMeditationGET(this.id, this.male, this.date, this.done, this.userid);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'male': male,
      'date': date,
      'done': done,
      'userid': userid
    };
  }
}
