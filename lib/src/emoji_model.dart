// To parse this JSON data, do
//
//     final emoji = emojiFromJson(jsonString);

import 'dart:convert';

/// Convert json to emojis
Emoji emojiFromJson(String str) =>
    Emoji.fromJson(json.decode(str) as Map<String, dynamic>);

/// Convert emojis to json
String emojiToJson(Emoji data) => json.encode(data.toJson());

/// Class for fetched emojis
class Emoji {
  /// Constructor
  Emoji({
    required this.compressed,
    required this.categories,
    required this.emojis,
    required this.aliases,
  });

  /// Have no idea
  bool compressed;
  /// Array of emojis categories
  List<Category> categories;
  /// Map of emojis
  Map<String, EmojiValue> emojis;
  /// Map of aliases.
  Map<String, String> aliases;

  /// Build emojis as entity from json
  factory Emoji.fromJson(Map<String, dynamic> json) {
    return Emoji(
        compressed: json['compressed'] as bool,
        categories: List<Category>.from(json['categories']
                .map((x) => Category.fromJson(x as Map<String, dynamic>))
            as List<Category>),
        emojis: Map.from(json['emojis'] as Map<String, dynamic>)
            .map((k, v) => MapEntry<String, EmojiValue>(
                  k as String,
                  EmojiValue.fromJson(v as Map<String, dynamic>),
                )),
        aliases: Map.from(json['aliases'] as Map<String, dynamic>)
            .map((k, v) => MapEntry<String, String>(
                  k as String,
                  v as String,
                )),
      );
  }

  /// Convert entity to json
  Map<String, dynamic> toJson() => {
        'compressed': compressed,
        'categories': List<dynamic>.from(categories.map((x) => x.toJson())),
        'emojis': Map.from(emojis)
            .map((k, v) => MapEntry<String, dynamic>(k as String, v.toJson())),
        'aliases':
            Map.from(aliases).map((k, v) =>
                MapEntry<String, dynamic>(k as String, v)),
      };
}

/// Category of emoji
class Category {
  /// Constructor
  Category({
    required this.id,
    required this.name,
    required this.emojis,
  });

  /// Category id
  String id;
  /// Category name
  String name;
  /// Category emojis
  List<String> emojis;

  /// Category model from json
  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json['id'] as String,
        name: json['name'] as String,
        emojis: List<String>.from(json['emojis'].map((x) => x) as List),
      );

  /// Category model to json
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'emojis': List<dynamic>.from(emojis.map((x) => x)),
      };
}

/// Different representation values for emojis
class EmojiValue {
  /// Constructor
  EmojiValue({
    required this.a,
    required this.b,
    required this.d,
    required this.e,
    required this.f,
    required this.h,
    required this.j,
    required this.k,
    required this.o,
    required this.m,
    required this.l,
    required this.skinVariations,
    required this.c,
    required this.n,
    required this.obsoletedBy,
    required this.obsoletes,
  });

  /// a
  String a;
  /// b
  String b;
  /// d
  bool d;
  /// e
  bool e;
  /// f
  bool f;
  /// h
  bool h;
  /// j
  List<String> j;
  /// k
  List<int> k;
  /// o
  int o;
  /// m
  String m;
  /// l
  List<String> l;
  /// skinVariations
  Map<String, SkinVariation> skinVariations;
  /// c
  String c;
  /// n
  List<String> n;
  /// obsoletedBy
  String obsoletedBy;
  /// obsoletes
  String obsoletes;

  /// Constructor
  factory EmojiValue.fromJson(Map<String, dynamic> json) => EmojiValue(
        a: json['a'] as String,
        b: json['b'] as String,
        d: json['d'] as bool,
        e: json['e'] as bool,
        f: json['f'] as bool,
        h: json['h'] as bool,
        j: List<String>.from(json['j'].map((x) => x) as List),
        k: List<int>.from(json['k'].map((x) => x) as List),
        o: json['o'] as int,
        m: json['m'] as String,
        l: List<String>.from(json['l'].map((x) => x) as List),
        skinVariations:
        Map.from(json['skin_variations'] as Map<String, dynamic>).map((k, v) =>
                MapEntry<String, SkinVariation>(k as String,
                    SkinVariation.fromJson(v as Map<String, dynamic>))),
        c: json['c'] as String,
        n: List<String>.from(json['n'].map((x) => x) as List),
        obsoletedBy: json['obsoleted_by'] as String,
        obsoletes: json['obsoletes'] as String,
      );

  /// To json
  Map<String, dynamic> toJson() => {
        'a': a,
        'b': b,
        'd': d,
        'e': e,
        'f': f,
        'h': h,
        'j': List<dynamic>.from(j.map((x) => x)),
        'k': List<dynamic>.from(k.map((x) => x)),
        'o': o,
        'm': m,
        'l': List<dynamic>.from(l.map((x) => x)),
        'skin_variations': Map.from(skinVariations)
                .map((k, v) =>
            MapEntry<String, dynamic>(k as String, v.toJson())),
        'c': c,
        'n': List<dynamic>.from(n.map((x) => x)),
        'obsoleted_by': obsoletedBy,
        'obsoletes': obsoletes,
      };
}

/// Skin variation for emoji
class SkinVariation {
  /// Constructor
  SkinVariation({
    required this.unified,
    required this.nonQualified,
    required this.image,
    required this.sheetX,
    required this.sheetY,
    required this.addedIn,
    required this.hasImgApple,
    required this.hasImgGoogle,
    required this.hasImgTwitter,
    required this.hasImgFacebook,
    required this.obsoletedBy,
    required this.obsoletes,
  });

  /// unified
  String unified;
  /// nonQualified
  String nonQualified;
  /// image
  String image;
  /// sheetX
  int sheetX;
  /// sheetY
  int sheetY;
  /// addedIn
  String addedIn;
  /// hasImgApple
  bool hasImgApple;
  /// hasImgGoogle
  bool hasImgGoogle;
  /// hasImgTwitter
  bool hasImgTwitter;
  /// hasImgFacebook
  bool hasImgFacebook;
  /// obsoletedBy
  String obsoletedBy;
  /// obsoletes
  String obsoletes;

  /// From json
  factory SkinVariation.fromJson(Map<String, dynamic> json) => SkinVariation(
        unified: json['unified'] as String,
        nonQualified: json['non_qualified'] as String,
        image: json['image'] as String,
        sheetX: json['sheet_x'] as int,
        sheetY: json['sheet_y'] as int,
        addedIn: json['added_in'] as String,
        hasImgApple: json['has_img_apple'] as bool,
        hasImgGoogle: json['has_img_google'] as bool,
        hasImgTwitter: json['has_img_twitter'] as bool,
        hasImgFacebook: json['has_img_facebook'] as bool,
        obsoletedBy: json['obsoleted_by'] as String,
        obsoletes: json['obsoletes'] as String,
      );

  /// To json
  Map<String, dynamic> toJson() => {
        'unified': unified,
        'non_qualified': nonQualified,
        'image': image,
        'sheet_x': sheetX,
        'sheet_y': sheetY,
        'added_in': addedIn,
        'has_img_apple': hasImgApple,
        'has_img_google': hasImgGoogle,
        'has_img_twitter': hasImgTwitter,
        'has_img_facebook': hasImgFacebook,
        'obsoleted_by': obsoletedBy,
        'obsoletes': obsoletes,
      };
}
