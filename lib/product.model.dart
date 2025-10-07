class ProductModel {
  final String customerName;
  final double productPrice;
  final String productID;

  ProductModel({
    required this.customerName,
    required this.productPrice,
    required this.productID,
  });

  // ✅ Factory constructor to create a ProductModel from JSON
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      customerName: json['customerName'] ?? '',
      productPrice: double.parse(json['productPrice'].toString()),
      productID: json['productID'] ?? '',
    );
  }

  // ✅ Convert ProductModel instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'customerName': customerName,
      'productPrice': productPrice,
      'productID': productID,
    };
  }
}
