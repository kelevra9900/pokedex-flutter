import 'dart:convert';

Pokemons pokemonsFromJson(String str) =>
    Pokemons.fromJson(json.decode(str));
String pokemonsToJson(Pokemons data) => json.encode(data.toJson());

class Pokemons {
  int? count;
  String? next;
  List<Result>? results;

  Pokemons({
    this.count,
    this.next,
    this.results,
  });

  factory Pokemons.fromJson(Map<String, dynamic> json) => Pokemons(
        count: json["count"],
        next: json["next"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "results": List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class Result {
  String? name;
  String? url;

  Result({
    this.name,
    this.url,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}