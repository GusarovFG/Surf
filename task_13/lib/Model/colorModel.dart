import 'dart:convert';

CbColors cbColorsFromJson(String str) => CbColors.fromJson(json.decode(str));

String cbColorsToJson(CbColors data) => json.encode(data.toJson());

class CbColors {
    final List<CBColor> colors;

    CbColors({
        required this.colors,
    });

    factory CbColors.fromJson(Map<String, dynamic> json) => CbColors(
        colors: List<CBColor>.from(json["colors"].map((x) => CBColor.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "colors": List<dynamic>.from(colors.map((x) => x.toJson())),
    };
}

class CBColor {
    final String name;
    final String? value;

    CBColor({
        required this.name,
        this.value,
    });

    factory CBColor.fromJson(Map<String, dynamic> json) => CBColor(
        name: json["name"],
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
    };
}
