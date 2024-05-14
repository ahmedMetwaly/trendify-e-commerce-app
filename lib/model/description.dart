class Description {
  String? style;
  String? patternType;
  String? neckline;
  String? sleeveLength;
  String? type;
  String? waistLine;
  String? hemShaped;
  String? length;
  String? fitType;
  String? fabric;
  String? material;
  String? composition;
  String? careInstructions;
  String? sheer;
  Description({
    this.sleeveLength,
    this.type,
    this.waistLine,
    this.hemShaped,
    this.length,
    this.fitType,
    this.careInstructions,
    this.composition,
    this.fabric,
    this.material,
    this.neckline,
    this.patternType,
    this.sheer,
    this.style,
  });
  Description.fromJson(Map<String, dynamic> json) {
    sleeveLength = json["sleeveLength"];
    type = json["type"];
    waistLine = json["waistLine"];
    hemShaped = json["hemShaped"];
    length = json["length"];
    fitType = json["fitType"];
    careInstructions = json["careInstructions"];
    composition = json["composition"];
    fabric = json["fabric"];
    material = json["material"];
    neckline = json["neckline"];
    patternType = json["patternType"];
    sheer = json["sheer"];
    style = json["style"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["sleeveLength"] = sleeveLength;
    data["waistLine"] = waistLine;
    data["hemShaped"] = hemShaped;
    data["length"] = length;
    data["fitType"] = fitType;
    data["careInstructions"] = careInstructions;
    data["composition"] = composition;
    data["fabric"] = fabric;
    data["material"] = material;
    data["neckline"] = neckline;
    data["patternType"] = patternType;
    data["sheer"] = sheer;
    data["style"] = style;
    return data;
  }
}
