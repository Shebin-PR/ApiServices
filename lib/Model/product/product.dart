import 'package:json_annotation/json_annotation.dart';

import 'criterion.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {

  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "tag")
  String? tag;
  @JsonKey(name: "color")
  String? color;
  @JsonKey(name: "criteria")
  List<Criterion>? criteria;

  Product({this.id, this.name, this.tag, this.color, this.criteria});

  factory Product.fromJson(Map<String, dynamic> json) {
    return _$ProductFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
