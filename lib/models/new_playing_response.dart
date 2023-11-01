import 'dart:convert';

import 'package:app_peliculas/models/models.dart';

class NewPlayingResponse {
    Dates dates;
    int page;
    List<Movie> results;
    int totalPages;
    int totalResults;

    NewPlayingResponse({
        required this.dates,
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
    });

    factory NewPlayingResponse.fromRawJson(String str) => NewPlayingResponse.fromJson(json.decode(str));

    factory NewPlayingResponse.fromJson(Map<String, dynamic> json) => NewPlayingResponse(
        dates: Dates.fromJson(json["dates"]),
        page: json["page"],
        results: List<Movie>.from(json["results"].map((x) => Movie.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );
}

class Dates {
    DateTime maximum;
    DateTime minimum;

    Dates({
        required this.maximum,
        required this.minimum,
    });

    factory Dates.fromRawJson(String str) => Dates.fromJson(json.decode(str));

    factory Dates.fromJson(Map<String, dynamic> json) => Dates(
        maximum: DateTime.parse(json["maximum"]),
        minimum: DateTime.parse(json["minimum"]),
    );
}