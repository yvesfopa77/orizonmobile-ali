// To parse this JSON data, do
//
//     final placesApiModel = placesApiModelFromJson(jsonString);

import 'dart:convert';

PlacesApiModel placesApiModelFromJson(String str) => PlacesApiModel.fromJson(json.decode(str));

String placesApiModelToJson(PlacesApiModel data) => json.encode(data.toJson());

class PlacesApiModel {
  List<Suggestion>? suggestions;

  PlacesApiModel({
    this.suggestions,
  });

  factory PlacesApiModel.fromJson(Map<String, dynamic> json) => PlacesApiModel(
        suggestions: json["suggestions"] == null
            ? []
            : List<Suggestion>.from(json["suggestions"]!.map((x) => Suggestion.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "suggestions":
            suggestions == null ? [] : List<dynamic>.from(suggestions!.map((x) => x.toJson())),
      };
}

class Suggestion {
  PlacePrediction? placePrediction;

  Suggestion({
    this.placePrediction,
  });

  factory Suggestion.fromJson(Map<String, dynamic> json) => Suggestion(
        placePrediction: json["placePrediction"] == null
            ? null
            : PlacePrediction.fromJson(json["placePrediction"]),
      );

  Map<String, dynamic> toJson() => {
        "placePrediction": placePrediction?.toJson(),
      };
}

class PlacePrediction {
  String? place;
  String? placeId;
  Text? text;
  StructuredFormat? structuredFormat;
  List<String>? types;

  PlacePrediction({
    this.place,
    this.placeId,
    this.text,
    this.structuredFormat,
    this.types,
  });

  factory PlacePrediction.fromJson(Map<String, dynamic> json) => PlacePrediction(
        place: json["place"],
        placeId: json["placeId"],
        text: json["text"] == null ? null : Text.fromJson(json["text"]),
        structuredFormat: json["structuredFormat"] == null
            ? null
            : StructuredFormat.fromJson(json["structuredFormat"]),
        types: json["types"] == null ? [] : List<String>.from(json["types"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "place": place,
        "placeId": placeId,
        "text": text?.toJson(),
        "structuredFormat": structuredFormat?.toJson(),
        "types": types == null ? [] : List<dynamic>.from(types!.map((x) => x)),
      };
}

class StructuredFormat {
  Text? mainText;
  SecondaryText? secondaryText;

  StructuredFormat({
    this.mainText,
    this.secondaryText,
  });

  factory StructuredFormat.fromJson(Map<String, dynamic> json) => StructuredFormat(
        mainText: json["mainText"] == null ? null : Text.fromJson(json["mainText"]),
        secondaryText:
            json["secondaryText"] == null ? null : SecondaryText.fromJson(json["secondaryText"]),
      );

  Map<String, dynamic> toJson() => {
        "mainText": mainText?.toJson(),
        "secondaryText": secondaryText?.toJson(),
      };
}

class Text {
  String? text;
  List<Match>? matches;

  Text({
    this.text,
    this.matches,
  });

  factory Text.fromJson(Map<String, dynamic> json) => Text(
        text: json["text"],
        matches: json["matches"] == null
            ? []
            : List<Match>.from(json["matches"]!.map((x) => Match.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "matches": matches == null ? [] : List<dynamic>.from(matches!.map((x) => x.toJson())),
      };
}

class Match {
  int? endOffset;

  Match({
    this.endOffset,
  });

  factory Match.fromJson(Map<String, dynamic> json) => Match(
        endOffset: json["endOffset"],
      );

  Map<String, dynamic> toJson() => {
        "endOffset": endOffset,
      };
}

class SecondaryText {
  String? text;

  SecondaryText({
    this.text,
  });

  factory SecondaryText.fromJson(Map<String, dynamic> json) => SecondaryText(
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
      };
}
