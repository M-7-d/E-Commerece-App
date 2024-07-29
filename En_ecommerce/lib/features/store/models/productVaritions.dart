class ProductvaritionsModel {
  final String id;
  String sku;
  String image;
  String? description;
  double price;
  double salePrice;
  int stock;
  Map<String, String> attributeValues;

  ProductvaritionsModel({
    required this.id,
    this.sku = "",
    this.price = 0.0,
    this.stock = 0,
    required this.attributeValues,
    this.salePrice = 0,
    this.description = "",
    this.image = "",
  });

  static ProductvaritionsModel empty() =>
      ProductvaritionsModel(id: "id", attributeValues: {});

  toJson() {
    return {
      "Id": id,
      "Image": image,
      "Description": description,
      "Price": price,
      "SalePrice": salePrice,
      "SKU": sku,
      "Stock": stock,
      "Attributes": attributeValues,
    };
  }

  factory ProductvaritionsModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) {
      return ProductvaritionsModel.empty();
    }
    return ProductvaritionsModel(
        id: data["Id"] ?? "",
        price: double.parse((data["Price"] ?? 0.0).toString()),
        sku: data["SKU"] ?? "",
        stock: data["Stock"] ?? 0,
        salePrice: double.parse((data["SalePrice"] ?? 0.0).toString()),
        image: data["Image"] ?? "",
        attributeValues: Map<String, String>.from(data["Attributes"]));
  }
}
