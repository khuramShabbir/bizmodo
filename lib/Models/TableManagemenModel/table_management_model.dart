// To parse this JSON data, do
//
//     final tableModel = tableModelFromJson(jsonString);

import 'dart:convert';

import '/Models/enum_value_model.dart';

TableModel tableModelFromJson(String str) => TableModel.fromJson(json.decode(str));

String tableModelToJson(TableModel data) => json.encode(data.toJson());

class TableModel {
  TableModel({
    this.tableData = const [],
  });

  final List<TableDataModel> tableData;

  factory TableModel.fromJson(Map<String, dynamic> json) => TableModel(
        tableData: List<TableDataModel>.from(json["data"].map((x) => TableDataModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(tableData.map((x) => x.toJson())),
      };
}

class TableDataModel {
  TableDataModel({
    required this.id,
    required this.businessId,
    required this.locationId,
    required this.name,
    this.description,
    this.status,
    this.bgColor,
    this.createdBy,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.persons,
  });

  final int id;
  final int businessId;
  final int locationId;
  final String name;
  final String? description;
  final TableStatus? status;
  final int? bgColor;
  final int? createdBy;
  final DateTime? deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? persons;

  factory TableDataModel.fromJson(Map<String, dynamic> json) => TableDataModel(
        id: json["id"],
        businessId: json["business_id"],
        locationId: json["location_id"],
        name: json["name"] ?? 'Table ${json["id"]}',
        description: json["description"],
        status: statusValues.map[json["status"]],
        bgColor: 0xFFFFFFFF,
        createdBy: json["created_by"],
        deletedAt: json["deleted_at"] != null ? DateTime.tryParse(json["deleted_at"]) : null,
        createdAt: json["created_at"] != null ? DateTime.tryParse(json["created_at"]) : null,
        updatedAt: json["updated_at"] != null ? DateTime.tryParse(json["updated_at"]) : null,
        persons: json["persons"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "business_id": businessId,
        "location_id": locationId,
        "name": name,
        "description": description,
        "status": statusValues.reverse?[status],
        "created_by": createdBy,
        "deleted_at": updatedAt == null ? null : deletedAt?.toIso8601String(),
        "created_at": updatedAt == null ? null : createdAt?.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt?.toIso8601String(),
        "persons": persons == null ? null : persons,
      };
}

enum TableStatus { FREE, BUSY, RESERVED }

final EnumValues<TableStatus> statusValues = EnumValues<TableStatus>(
  {"Busy": TableStatus.BUSY, "Free": TableStatus.FREE, "Reserved": TableStatus.RESERVED},
);
