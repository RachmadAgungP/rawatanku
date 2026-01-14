// To parse this JSON data, do
//
//     final hargaPangan = hargaPanganFromJson(jsonString);

import 'dart:convert';

HargaPangan hargaPanganFromJson(String str) =>
    HargaPangan.fromJson(json.decode(str));

String hargaPanganToJson(HargaPangan data) => json.encode(data.toJson());

class HargaPangan {
  HargaPangan({
    required this.commodity,
    required this.commodityId,
    required this.priceTypeId,
    required this.layout,
    required this.title,
    required this.areas,
    required this.tableData,
    required this.provinces,
    required this.provData,
    required this.isPercent,
  });

  String commodity;
  String commodityId;
  String priceTypeId;
  String layout;
  String title;
  Map<String, Area> areas;
  List<TableDatum> tableData;
  List<List<String>> provinces;
  Map<String, List<List<String>>> provData;
  bool isPercent;

  factory HargaPangan.fromJson(Map<String, dynamic> json) => HargaPangan(
        commodity: json["commodity"],
        commodityId: json["commodity_id"],
        priceTypeId: json["price_type_id"],
        layout: json["layout"],
        title: json["title"],
        areas: Map.from(json["areas"])
            .map((k, v) => MapEntry<String, Area>(k, Area.fromJson(v))),
        tableData: List<TableDatum>.from(
            json["tableData"].map((x) => TableDatum.fromJson(x))),
        provinces: List<List<String>>.from(
            json["provinces"].map((x) => List<String>.from(x.map((x) => x)))),
        provData: Map.from(json["provData"]).map((k, v) =>
            MapEntry<String, List<List<String>>>(
                k,
                List<List<String>>.from(
                    v.map((x) => List<String>.from(x.map((x) => x)))))),
        isPercent: json["is_percent"],
      );

  Map<String, dynamic> toJson() => {
        "commodity": commodity,
        "commodity_id": commodityId,
        "price_type_id": priceTypeId,
        "layout": layout,
        "title": title,
        "areas": Map.from(areas)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "tableData": List<dynamic>.from(tableData.map((x) => x.toJson())),
        "provinces": List<dynamic>.from(
            provinces.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "provData": Map.from(provData).map((k, v) => MapEntry<String, dynamic>(
            k,
            List<dynamic>.from(
                v.map((x) => List<dynamic>.from(x.map((x) => x)))))),
        "is_percent": isPercent,
      };
}

class Area {
  Area({
    required this.tooltip,
    required this.name,
    required this.date,
    required this.provId,
    required this.value,
  });

  Tooltip tooltip;
  String name;
  DateTime date;
  String provId;
  int value;

  factory Area.fromJson(Map<String, dynamic> json) => Area(
        tooltip: Tooltip.fromJson(json["tooltip"]),
        name: json["name"],
        date: DateTime.parse(json["date"]),
        provId: json["prov_id"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "tooltip": tooltip.toJson(),
        "name": name,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "prov_id": provId,
        "value": value,
      };
}

class Tooltip {
  Tooltip({
    required this.content,
  });

  String content;

  factory Tooltip.fromJson(Map<String, dynamic> json) => Tooltip(
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "content": content,
      };
}

class TableDatum {
  TableDatum({
    required this.value,
    required this.name,
    required this.display,
    required this.id,
  });

  String value;
  String name;
  String display;
  String id;

  factory TableDatum.fromJson(Map<String, dynamic> json) => TableDatum(
        value: json["value"],
        name: json["name"],
        display: json["display"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "name": name,
        "display": display,
        "id": id,
      };
}
