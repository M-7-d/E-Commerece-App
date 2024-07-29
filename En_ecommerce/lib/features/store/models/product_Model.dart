import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:en_ecommerce/features/store/models/productVaritions.dart';
import 'brand_Model.dart';
import 'productAtrribute.dart';

class ProductModel {
  String id;
  int stock;
  String? sku;
  double price;
  String title;
  DateTime? date;
  double salePrice;
  String thumbnail;
  bool? isFeatured;
  BrandModel? brand;
  String? description;
  String? categoryId;
  List<String>? images;
  String productType;
  List<ProductAttirbuteModel>? productAttributes;
  List<ProductvaritionsModel>? productVariations;
  ProductModel(
      {required this.id,
      this.brand,
      this.categoryId,
      this.description,
      this.date,
      this.images,
      this.isFeatured,
      required this.price,
      this.productAttributes,
      required this.productType,
      this.productVariations,
      this.salePrice = 0.0,
      this.sku,
      required this.stock,
      required this.thumbnail,
      required this.title});

  static ProductModel empty() => ProductModel(
      id: "", price: 0, productType: "", stock: 0, thumbnail: "", title: "");

  toJson() {
    return {
      "SKU": sku,
      "Title": title,
      "Stock": stock,
      "Price": price,
      "Images": images ?? [],
      "Thumbnil": thumbnail,
      "SalePrice": salePrice,
      "IsFeatured": isFeatured,
      "CategoryId": categoryId,
      "Brand": brand!.toJson(),
      "Description": description,
      "ProductType": productType,
      "ProductAtrributes": productAttributes != null
          ? productAttributes!.map((e) => e.toJson()).toList()
          : [],
      "ProductVariations": productVariations != null
          ? productVariations!.map((e) => e.toJson()).toList()
          : [],
    };
  }

  factory ProductModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) {
      return ProductModel.empty();
    }
    final data = document.data()!;
    return ProductModel(
      id: document.id,
      sku: data['SKU'] ?? "",
      title: data['Title'] ?? "",
      stock: data['Stock'] ?? 0,
      isFeatured: data['IsFeatured'] ?? false,
      price: double.parse((data['Price'] ?? 0.0).toString()),
      salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
      thumbnail: data['Thumbnil'] ?? '',
      categoryId: data['CategoryId'] ?? '',
      description: data['Description'] ?? '',
      productType: data['ProductType'] ?? '',
      brand: BrandModel.fromJson(data['Brand']),
      images: data['Images'] != null ? List<String>.from(data['Images']) : [],
      productAttributes: (data['ProductAtrributes'] as List<dynamic>)
          .map((e) => ProductAttirbuteModel.fromJson(e))
          .toList(),
      productVariations: (data['ProductVariations'] as List<dynamic>)
          .map((e) => ProductvaritionsModel.fromJson(e))
          .toList(),
    );
  }
}
