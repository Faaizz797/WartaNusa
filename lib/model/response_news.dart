import 'package:news_app/model/news.dart';

class ResponseNews {
  String? message;
  int? total;
  List<Data>? data;

  ResponseNews({this.message, this.total, this.data});

  ResponseNews.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    total = json['total'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['total'] = this.total;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}



