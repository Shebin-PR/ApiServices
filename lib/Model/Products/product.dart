class ProductModel {
  ProductModel({
    this.id,
    this.name,
    this.tag,
    this.color,
    this.criteria,
  });

  int? id;
  String? name;
  String? tag;
  String? color;
  List<Criterion>? criteria;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"] as int,
        name: json["name"] as String,
        tag: json["tag"] as String,
        color: json["color"] as String,
        criteria: List<Criterion>.from(
          (json["criteria"] as List).map(
            (x) => Criterion.fromJson(Map<String, dynamic>.from(x as Map)),
          ),
        ),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "tag": tag,
        "color": color,
        "criteria": List<dynamic>.from(criteria!.map((x) => x.toJson())),
      };
}

class Criterion {
  Criterion({
    this.type,
    this.text,
  });

  String? type;
  String? text;

  factory Criterion.fromJson(Map<String, dynamic> json) => Criterion(
        type: json["type"].toString(),
        text: json["text"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "text": text,
      };
}
