import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/product_material.dart';
import 'material_informations_states.dart';

class MaterialInformationBloc extends Cubit<MaterialInformationStates> {
  MaterialInformationBloc() : super(MaterialInitialState());
  TextEditingController materialWashCare =TextEditingController(text: "Easy to care for, machine washable in cold or warm water. Can be tumble dried on low heat."); 
   ProductMaterial? productMaterial ; 

  Map<String, String> materialOptions = {
    "Cotton":
        "Easy to care for, machine washable in cold or warm water. Can be tumble dried on low heat.",
    "Linen":
        "Can be machine washed on warm or cold gentle cycle. Linen wrinkles easily, so ironing or steaming might be needed.",
    "Wool":
        "Requires special care. Hand wash in cold water with wool detergent or dry clean. Avoid hot water and agitation, which can cause shrinkage and felting.",
    "Silk":
        "Delicate fabric, best dry cleaned. Some silk garments can be hand-washed in cold water with special detergent.",
    "Polyester":
        "Easy to care for, machine washable in cold or warm water. Can be tumble dried on low heat.",
    "Nylon":
        "Easy to care for, machine washable in cold or warm water. Can be tumble dried on low heat.",
    "Acrylic":
        "Easy to care for, machine washable in cold or warm water. Can be tumble dried on low heat.",
    "Spandex":
        "Usually blended with other fibers. Washing instructions depend on the blend. Generally, machine washable in cold water on a delicate cycle. Can be tumble dried on low heat or air dried.",
    "Rayon":
        "Washing instructions depend on the type of rayon. Some types can be machine washed on a delicate cycle in cold water, while others require dry cleaning",
    "Tencel":
        "Generally, machine washable in cold water on a gentle cycle. Can be tumble dried on low heat or air dried."
  };
  int selectedindex=0; // Initially no selection
  void chooseMaterial(int? index) {
    if (index != null) {
      selectedindex = index;
      materialWashCare.text = materialOptions.values.elementAt(index);
      productMaterial?.material = materialOptions.keys.elementAt(index);
      productMaterial?.washCare = materialOptions.values.elementAt(index);
      emit(MaterialSelected());
    }
  }

  void addNewMaterial(String material, String washCare) {
    materialOptions[material] = washCare;
    emit(AddNewMaterial());
  }
}
