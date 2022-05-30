class Intensions {
  final String intensiontitle;
  final String discription;
  final String fromtime;
  final String totime;
  final String sunday;
  final String monday;
  final String tuesday;
  final String wednesday;
  final String thursday;
  final String friday;
  final String saturday;
  final String prenotification;
  final String userid;
  final String wheelhead;
  final String istodaynoficationbeforetime;



  Intensions(
      this.intensiontitle,
      this.discription,
      this.fromtime,
      this.totime,
      this.sunday,
      this.monday,
      this.tuesday,
      this.wednesday,
      this.thursday,
      this.friday,
      this.saturday,
      this.prenotification,
      this.userid,
      this.wheelhead,
      this.istodaynoficationbeforetime,
      );

  Map<String, dynamic> toMap() {
    return {
      'intensiontitle': intensiontitle,
      'discription': discription,
      'fromtime': fromtime,
      'totime': totime,
      'sunday': sunday,
      'monday': monday,
      'tuesday': tuesday,
      'wednesday': wednesday,
      'thursday': thursday,
      'friday': friday,
      'saturday': saturday,
      'prenotification': prenotification,
      'userid': userid,
      'wheelhead':wheelhead,
      'istodaynoficationbeforetime':istodaynoficationbeforetime,
    };
  }
}

class IntensionsGET {
  int id;
  final String intensiontitle;
  final String discription;
  final String fromtime;
  final String totime;
  final String sunday;
  final String monday;
  final String tuesday;
  final String wednesday;
  final String thursday;
  final String friday;
  final String saturday;
  final String prenotification;
  final String userid;
  final String wheelhead;
final String istodaynoficationbeforetime;

  IntensionsGET(
      this.id,
      this.intensiontitle,
      this.discription,
      this.fromtime,
      this.totime,
      this.sunday,
      this.monday,
      this.tuesday,
      this.wednesday,
      this.thursday,
      this.friday,
      this.saturday,
      this.prenotification,
      this.userid,
      this.wheelhead,
      this.istodaynoficationbeforetime);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'intensiontitle': intensiontitle,
      'discription': discription,
      'fromtime': fromtime,
      'totime': totime,
      'sunday': sunday,
      'monday': monday,
      'tuesday': tuesday,
      'wednesday': wednesday,
      'thursday': thursday,
      'friday': friday,
      'saturday': saturday,
      'prenotification': prenotification,
      'userid': userid,
      'wheelhead':wheelhead,
      'istodaynoficationbeforetime':istodaynoficationbeforetime,

    };
  }
}
