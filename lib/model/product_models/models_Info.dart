class ModelsInfo {
  Attr? attr;
  String? size;
  String? name;
  String? image;
  Attr? attrcm;
  Attr? attrinch;
  int? sizeUnit;
  String? countryCode;
  String? attrLocalSizeValue;

  ModelsInfo(
      {attr,
      size,
      name,
      image,
      attrcm,
      attrinch,
      sizeUnit,
      countryCode,
      attrLocalSizeValue});

  ModelsInfo.fromJson(Map<String, dynamic> json) {
    attr = json['attr'] != null ? Attr.fromJson(json['attr']) : null;
    size = json['size'];
    name = json['name'];
    image = json['image'];
    attrcm = json['attrcm'] != null ? Attr.fromJson(json['attrcm']) : null;
    attrinch =
        json['attrinch'] != null ? Attr.fromJson(json['attrinch']) : null;
    sizeUnit = json['sizeUnit'];
    countryCode = json['country_code'];
    attrLocalSizeValue = json['attr_local_size_value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (attr != null) {
      data['attr'] = attr!.toJson();
    }
    data['size'] = size;
    data['name'] = name;
    data['image'] = image;
    if (attrcm != null) {
      data['attrcm'] = attrcm!.toJson();
    }
    if (attrinch != null) {
      data['attrinch'] = attrinch!.toJson();
    }
    data['sizeUnit'] = sizeUnit;
    data['country_code'] = countryCode;
    data['attr_local_size_value'] = attrLocalSizeValue;
    return data;
  }
}

class Attr {
  String? height;
  String? bust;
  String? waist;
  String? hip;
  String? ballGirth;
  String? footLength;

  Attr({height, bust, waist, hip, ballGirth, footLength});

  Attr.fromJson(Map<String, dynamic> json) {
    height = json['Height'];
    bust = json['Bust'];
    waist = json['Waist'];
    hip = json['Hip'];
    ballGirth = json['BallGirth'];
    footLength = json['FootLength'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['Height'] = height;
    data['Bust'] = bust;
    data['Waist'] = waist;
    data['Hip'] = hip;
    data['BallGirth'] = ballGirth;
    data['FootLength'] = footLength;
    return data;
  }
}
/* 
class AllColorDetailImages {
  List? colorKeys;
  List? images;
  List<Map<String, List<String>>>? colorImages;
  AllColorDetailImages();

  AllColorDetailImages.fromJson(Map<String, dynamic> json) {
    colorKeys = json.keys.toList();
    List colorValues = json.values.toList();
    List<String> images = [];
    List<Map<String, List<String>>> data = [];
    for (int i = 0; i < colorValues.length; i++) {
      for (var image in colorValues[i]) {
        images.add("");
      }
      Map<String, List<String>> entry = {colorKeys![i]: images};
      data.add(entry);
      images = [];
    }
    colorImages = data;
  }
}
 */
class AttrSizeDict {
  List<XS>? xS;
  List<S>? s;
  List<M>? m;
  List<L>? l;
  List<XL>? xL;
  List? availableSizes;
  List?sizeDetails;
  AttrSizeDict({xS, s, m, l, xL, availableSizes});

  AttrSizeDict.fromJson(Map<String, dynamic> json) {
    availableSizes = json.keys.toList();
    List details=[];
    for(String size in availableSizes!){
     details.add(json[size]);
//print( json[size]);
    }
    sizeDetails= details;

  /*   for (int i = 0; i < availableSizes!.length; i++) {
      print(availableSizes![i]);
      /* for (var size in availableSizes![i].toString()) {
        for(var details in size){
          print(details["Length "]);
        //SizeDetails.fromJson(json[details]);

        }
      } */
    } */
   /*  if (json['XS'] != null) {
      xS = <XS>[];
      json['XS'].forEach((v) {
        xS!.add(XS.fromJson(v));
      });
    }
    if (json['S'] != null) {
      s = <S>[];
      json['S'].forEach((v) {
        s!.add(S.fromJson(v));
      });
    }
    if (json['M'] != null) {
      m = <M>[];
      json['M'].forEach((v) {
        m!.add(M.fromJson(v));
      });
    }
    if (json['L'] != null) {
      l = <L>[];
      json['L'].forEach((v) {
        l!.add(L.fromJson(v));
      });
    }
    if (json['XL'] != null) {
      xL = <XL>[];
      json['XL'].forEach((v) {
        xL!.add(XL.fromJson(v));
      });
    } */
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (xS != null) {
      data['XS'] = xS!.map((v) => v.toJson()).toList();
    }
    if (s != null) {
      data['S'] = s!.map((v) => v.toJson()).toList();
    }
    if (m != null) {
      data['M'] = m!.map((v) => v.toJson()).toList();
    }
    if (l != null) {
      data['L'] = l!.map((v) => v.toJson()).toList();
    }
    if (xL != null) {
      data['XL'] = xL!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SizeDetails {
  String? length;
  String? bust;
  String? waistSize;
  String? hipSize;

  SizeDetails({length, bust, waistSize, hipSize});

  SizeDetails.fromJson(Map<String, dynamic> json) {
    length = json['Length '];
    bust = json['Bust '];
    waistSize = json['Waist Size '];
    hipSize = json['Hip Size '];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['Length '] = length;
    data['Bust '] = bust;
    data['Waist Size '] = waistSize;
    data['Hip Size '] = hipSize;
    return data;
  }
}

class XS {
  String? length;
  String? bust;
  String? waistSize;
  String? hipSize;

  XS({length, bust, waistSize, hipSize});

  XS.fromJson(Map<String, dynamic> json) {
    length = json['Length '];
    bust = json['Bust '];
    waistSize = json['Waist Size '];
    hipSize = json['Hip Size '];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['Length '] = length;
    data['Bust '] = bust;
    data['Waist Size '] = waistSize;
    data['Hip Size '] = hipSize;
    return data;
  }
}

class S {
  String? length;
  String? bust;
  String? waistSize;
  String? hipSize;

  S({length, bust, waistSize, hipSize});

  S.fromJson(Map<String, dynamic> json) {
    length = json['Length '];
    bust = json['Bust '];
    waistSize = json['Waist Size '];
    hipSize = json['Hip Size '];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['Length '] = length;
    data['Bust '] = bust;
    data['Waist Size '] = waistSize;
    data['Hip Size '] = hipSize;
    return data;
  }
}

class M {
  String? length;
  String? bust;
  String? waistSize;
  String? hipSize;

  M({length, bust, waistSize, hipSize});

  M.fromJson(Map<String, dynamic> json) {
    length = json['Length '];
    bust = json['Bust '];
    waistSize = json['Waist Size '];
    hipSize = json['Hip Size '];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['Length '] = length;
    data['Bust '] = bust;
    data['Waist Size '] = waistSize;
    data['Hip Size '] = hipSize;
    return data;
  }
}

class L {
  String? length;
  String? bust;
  String? waistSize;
  String? hipSize;

  L({length, bust, waistSize, hipSize});

  L.fromJson(Map<String, dynamic> json) {
    length = json['Length '];
    bust = json['Bust '];
    waistSize = json['Waist Size '];
    hipSize = json['Hip Size '];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['Length '] = length;
    data['Bust '] = bust;
    data['Waist Size '] = waistSize;
    data['Hip Size '] = hipSize;
    return data;
  }
}

class XL {
  String? length;
  String? bust;
  String? waistSize;
  String? hipSize;

  XL({length, bust, waistSize, hipSize});

  XL.fromJson(Map<String, dynamic> json) {
    length = json['Length '];
    bust = json['Bust '];
    waistSize = json['Waist Size '];
    hipSize = json['Hip Size '];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['Length '] = length;
    data['Bust '] = bust;
    data['Waist Size '] = waistSize;
    data['Hip Size '] = hipSize;
    return data;
  }
}
