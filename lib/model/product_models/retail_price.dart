class RetailPrice {
	String? amount;
	String? amountWithSymbol;
	String? usdAmount;
	String? usdAmountWithSymbol;
	String? priceShowStyle;

	RetailPrice({amount, amountWithSymbol, usdAmount, usdAmountWithSymbol, priceShowStyle});

	RetailPrice.fromJson(Map<String, dynamic> json) {
		amount = json['amount'];
		amountWithSymbol = json['amountWithSymbol'];
		usdAmount = json['usdAmount'];
		usdAmountWithSymbol = json['usdAmountWithSymbol'];
		priceShowStyle = json['priceShowStyle'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = {};
		data['amount'] = amount;
		data['amountWithSymbol'] = amountWithSymbol;
		data['usdAmount'] = usdAmount;
		data['usdAmountWithSymbol'] = usdAmountWithSymbol;
		data['priceShowStyle'] = priceShowStyle;
		return data;
	}
}
