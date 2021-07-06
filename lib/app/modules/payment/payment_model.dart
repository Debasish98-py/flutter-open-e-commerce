class Payment {
  int id;
  String amount;
  String currency;

  Payment({
    id,
    amount,
    currency,
  });

  Payment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amount = json['amount'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['amount'] = amount;
    data['currency'] = currency;
    return data;
  }
}