class todolist {
  int? userId;
  int? id;
  String? title;
  String? body;

  todolist({this.userId, this.id, this.title, this.body});

  todolist.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}

class SuccessMessage {
  final bool out;
  final String message;

  SuccessMessage(
    this.out,
    this.message,
  );

  static SuccessMessage fromJson(Map<String, dynamic> body) {
    return SuccessMessage(
      body['out'],
      body['msg'],
    );
  }
}
