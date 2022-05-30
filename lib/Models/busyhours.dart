class BusyHour {
  final String busyreason;
  final String fromtime;
  final String totime;
  final String sunday;
  final String monday;
  final String tuesday;
  final String wednesday;
  final String thursday;
  final String friday;
  final String saturday;
  final String userid;

  BusyHour(
      this.busyreason,
      this.fromtime,
      this.totime,
      this.sunday,
      this.monday,
      this.tuesday,
      this.wednesday,
      this.thursday,
      this.friday,
      this.saturday,
      this.userid);

  Map<String, dynamic> toMap() {
    return {
      'busyreason': busyreason,
      'fromtime': fromtime,
      'totime': totime,
      'sunday': sunday,
      'monday': monday,
      'tuesday': tuesday,
      'wednesday': wednesday,
      'thursday': thursday,
      'friday': friday,
      'saturday': saturday,
      'userid': userid
    };
  }
}

class BusyHourGET {
  int id;
  final String busyreason;
  final String fromtime;
  final String totime;
  final String sunday;
  final String monday;
  final String tuesday;
  final String wednesday;
  final String thursday;
  final String friday;
  final String saturday;
  final String userid;

  BusyHourGET(
      this.id,
      this.busyreason,
      this.fromtime,
      this.totime,
      this.sunday,
      this.monday,
      this.tuesday,
      this.wednesday,
      this.thursday,
      this.friday,
      this.saturday,
      this.userid);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'busyreason': busyreason,
      'fromtime': fromtime,
      'totime': totime,
      'sunday': sunday,
      'monday': monday,
      'tuesday': tuesday,
      'wednesday': wednesday,
      'thursday': thursday,
      'friday': friday,
      'saturday': saturday,
      'userid': userid
    };
  }
}
