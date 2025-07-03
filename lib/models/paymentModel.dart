class PaymentModel {
  final String type, last4, expiry, image;

  PaymentModel({
    required this.type,
    required this.last4,
    required this.expiry,
    required this.image,
  });
}

class PaymentMethods {
  static List<PaymentModel> paymentMethods = [
    PaymentModel(
      type: 'Visa',
      last4: '1234',
      expiry: '12/26',
      image: 'assets/icons/visa.svg',
    ),
    PaymentModel(
      type: 'Mastercard',
      last4: '4567',
      expiry: '08/25',
      image: 'assets/icons/mastercard.svg',
    ),
  ];
}
