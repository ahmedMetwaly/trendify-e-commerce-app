class ProductMaterial {
  late String material;
  late String washCare;
  ProductMaterial({required this.material, required this.washCare});
  ProductMaterial.fromJson(Map<String, dynamic> json) {
    material = json["material"];
    washCare = json["washCare"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["material"] = material;
    data["washCare"] = washCare;

    return data;
  }
}
