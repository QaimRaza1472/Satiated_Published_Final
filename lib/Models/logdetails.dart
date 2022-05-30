class LogsDetail {
  final int id;
  final String userid;

  LogsDetail(this.id, this.userid);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userid': userid,
    };
  }
}
