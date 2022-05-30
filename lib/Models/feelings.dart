class Feelings {
  final String details;
  final String submiton;
  final String userid;

  Feelings(this.details, this.submiton, this.userid);

  Map<String, dynamic> toMap() {
    return {'details': details, 'submiton': submiton, 'userid': userid};
  }
}
