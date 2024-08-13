import 'package:shop_app/generated/l10n.dart';

enum OrderStatesE {
  pending,
  processing,
  shipped,
  delivered,
  returned,
  cancelled
}

class DetectOrderStateRepo {
  final OrderStatesE? state;

  DetectOrderStateRepo({this.state});
  OrderStatesE detectOrderState(String order) {
    if (order == S.current.pending) {
      return OrderStatesE.pending;
    } else if (order == S.current.processing) {
      return OrderStatesE.processing;
    } else if (order == S.current.shipped) {
      return OrderStatesE.shipped;
    } else if (order == S.current.delivered) {
      return OrderStatesE.delivered;
    } else if (order == S.current.returned) {
      return OrderStatesE.returned;
    } else {
      return OrderStatesE.cancelled;
    }
  }

  String detectState() {
    switch (state) {
      case OrderStatesE.pending:
        return S.current.pending;
      case OrderStatesE.processing:
        return S.current.processing;
      case OrderStatesE.shipped:
        return S.current.shipped;
      case OrderStatesE.delivered:
        return S.current.delivered;
      case OrderStatesE.returned:
        return S.current.returned;
      case OrderStatesE.cancelled:
        return S.current.cancelled;
      default:
        return S.current.error;
    }
  }

  String detectNextState(String orderState) {
    if (orderState == S.current.pending) {
      return S.current.processing;
    } else if (orderState == S.current.processing) {
      return S.current.shipped;
    } else if (orderState == S.current.shipped) {
      return S.current.delivered;
    } else if (orderState == S.current.delivered) {
      return S.current.returned;
    }
    return "";
  }
}
