class ResponseModel {
  String? message;
  int? status;
  dynamic result;

  ResponseModel({this.message, this.status,this.result});

  ResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    data['result'] = result;
    return data;
  }
}
