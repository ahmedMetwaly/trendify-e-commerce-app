class ProductMaterial {
  late String material;
  late String composition;
  late String washCare;
  ProductMaterial(
      {required this.material,
      required this.composition,
      required this.washCare});
  ProductMaterial.fromJson(Map<String, dynamic> json) {
    material = json["material"];
    composition = json["composition"];
    washCare = json["washCare"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["material"] = material;
    data["composition"] = composition;
    data["washCare"] = washCare;

    return data;
  }
}
