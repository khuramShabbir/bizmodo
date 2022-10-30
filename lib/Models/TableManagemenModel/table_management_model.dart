import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

List<TableDetail> tableDetailFromJson(String str) =>
    List<TableDetail>.from(json.decode(str).map((x) => TableDetail.fromJson(x)));

String tableDetailToJson(List<TableDetail> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TableDetail {
  TableDetail({
    required this.tables,
  });

  Tables tables;

  factory TableDetail.fromJson(Map<String, dynamic> json) => TableDetail(
        tables: Tables.fromJson(json["Tables"]),
      );

  Map<String, dynamic> toJson() => {
        "Tables": tables.toJson(),
      };
}

class Tables {
  Tables({
    required this.tableId,
    required this.color,
    required this.time,
    required this.available,
  });
  String tableId;
  int color;
  DateTime? time;
  String available;

  factory Tables.fromJson(Map<String, dynamic> json) => Tables(
        tableId: json["table_id"],
        color: json["color"],
        time: json["time"] != null ? DateTime.tryParse(json["time"]) : null,
        available: json["available"],
      );

  Map<String, dynamic> toJson() => {
        "table_id": tableId,
        "color": color,
        "time": time?.toIso8601String(),
        "available": available,
      };
}
