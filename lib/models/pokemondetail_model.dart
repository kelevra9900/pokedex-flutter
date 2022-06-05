import 'dart:convert';

PokemonDetailModel pokemonDetailModelFromJson(String str) =>
    PokemonDetailModel.fromJson(json.decode(str));

String pokemonDetailModelToJson(PokemonDetailModel data) =>
    json.encode(data.toJson());

class PokemonDetailModel {
  List<Ability>? abilities;
  int? height;
  int? id;
  String? name;
  Species? species;
  Sprites? sprites;
  List<Stat>? stats;
  List<Type>? types;
  int? weight;

  PokemonDetailModel({
    this.abilities,
    this.height,
    this.id,
    this.name,
    this.species,
    this.sprites,
    this.stats,
    this.types,
    this.weight,
  });

  factory PokemonDetailModel.fromJson(Map<String, dynamic> json) =>
      PokemonDetailModel(
        abilities: List<Ability>.from(
            json["abilities"].map((x) => Ability.fromJson(x))),
        height: json["height"],
        id: json["id"],
        name: json["name"],
        species: Species.fromJson(json["species"]),
        sprites: Sprites.fromJson(json["sprites"]),
        stats: List<Stat>.from(json["stats"].map((x) => Stat.fromJson(x))),
        types: List<Type>.from(json["types"].map((x) => Type.fromJson(x))),
        weight: json["weight"],
      );

  Map<String, dynamic> toJson() => {
        "abilities": List<dynamic>.from(abilities!.map((x) => x.toJson())),
        "height": height,
        "id": id,
        "name": name,
        "species": species!.toJson(),
        "sprites": sprites!.toJson(),
        "stats": List<dynamic>.from(stats!.map((x) => x.toJson())),
        "types": List<dynamic>.from(types!.map((x) => x.toJson())),
        "weight": weight,
      };
}

class Ability {
  Species? ability;
  bool? isHidden;
  int? slot;

  Ability({
    this.ability,
    this.isHidden,
    this.slot,
  });

  factory Ability.fromJson(Map<String, dynamic> json) => Ability(
        ability: Species.fromJson(json["ability"]),
        isHidden: json["is_hidden"],
        slot: json["slot"],
      );

  Map<String, dynamic> toJson() => {
        "ability": ability!.toJson(),
        "is_hidden": isHidden,
        "slot": slot,
      };
}

class Species {
  String? name;
  String? url;

  Species({
    this.name,
    this.url,
  });

  factory Species.fromJson(Map<String, dynamic> json) => Species(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}

class Sprites {
  String? backDefault;
  dynamic backFemale;
  String? backShiny;
  dynamic backShinyFemale;
  String? frontDefault;
  dynamic frontFemale;
  String? frontShiny;
  dynamic frontShinyFemale;
  Other? other;

  Sprites({
    this.backDefault,
    this.backFemale,
    this.backShiny,
    this.backShinyFemale,
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
    this.other,
  });

  Sprites.fromJson(Map<String, dynamic> json) {
    backDefault = json['back_default'];
    backFemale = json['back_female'];
    backShiny = json['back_shiny'];
    backShinyFemale = json['back_shiny_female'];
    frontDefault = json['front_default'];
    frontFemale = json['front_female'];
    frontShiny = json['front_shiny'];
    frontShinyFemale = json['front_shiny_female'];
    other = json['other'] != null ? Other.fromJson(json['other']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['back_default'] = backDefault;
    data['back_female'] = backFemale;
    data['back_shiny'] = backShiny;
    data['back_shiny_female'] = backShinyFemale;
    data['front_default'] = frontDefault;
    data['front_female'] = frontFemale;
    data['front_shiny'] = frontShiny;
    data['front_shiny_female'] = frontShinyFemale;
    if (other != null) {
      data['other'] = other!.toJson();
    }
    return data;
  }
}

class Other {
  OfficialArtwork? officialArtwork;

  Other({this.officialArtwork});

  factory Other.fromJson(Map<String, dynamic> json) => Other(
        officialArtwork: OfficialArtwork.fromJson(json["official-artwork"]),
      );

  Map<String, dynamic> toJson() => {
        "official-artwork": officialArtwork!.toJson(),
      };
}

class OfficialArtwork {
  String? frontDefault;

  OfficialArtwork({this.frontDefault});

  factory OfficialArtwork.fromJson(Map<String, dynamic> json) =>
      OfficialArtwork(
        frontDefault: json["front_default"],
      );

  Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
      };
}

class Stat {
  int? baseStat;
  int? effort;
  Species? stat;

  Stat({
    this.baseStat,
    this.effort,
    this.stat,
  });

  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
        baseStat: json["base_stat"],
        effort: json["effort"],
        stat: Species.fromJson(json["stat"]),
      );

  Map<String, dynamic> toJson() => {
        "base_stat": baseStat,
        "effort": effort,
        "stat": stat!.toJson(),
      };
}

class Type {
  int? slot;
  Species? type;

  Type({
    this.slot,
    this.type,
  });

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        slot: json["slot"],
        type: Species.fromJson(json["type"]),
      );

  Map<String, dynamic> toJson() => {
        "slot": slot,
        "type": type!.toJson(),
      };
}
