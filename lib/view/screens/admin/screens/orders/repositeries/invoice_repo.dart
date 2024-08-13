import '../models/product_order_model.dart';

class InvoiceRepo {
  final List<ProductOrder> products;
  final double salePrecentage;
  final double deliveryAmount;

  InvoiceRepo(
      {required this.products,
      required this.salePrecentage,
      required this.deliveryAmount});
  Map<String, dynamic> calculateTotalAmount() {
    double total = 0;
    int quantity = 0;

    for (var item in products) {
      total += item.price * item.quantity;
      quantity += item.quantity;
    }
    if (salePrecentage != 0) {
      total = total - (total * (salePrecentage / 100));
    }
    total += deliveryAmount;
    return {"total": total, "quantity": quantity};
  }
}
