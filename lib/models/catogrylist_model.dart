// To parse this JSON data, do
//
//     final catogryListModel = catogryListModelFromJson(jsonString);

import 'dart:convert';

List<String> catogryListModelFromJson(String str) => List<String>.from(json.decode(str).map((x) => x));

String catogryListModelToJson(List<String> data) => json.encode(List<dynamic>.from(data.map((x) => x)));

