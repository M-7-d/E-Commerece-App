import 'package:en_ecommerce/features/store/models/brand_Model.dart';
import 'package:en_ecommerce/features/store/models/productAtrribute.dart';
import 'package:en_ecommerce/features/store/models/productVaritions.dart';
import 'package:en_ecommerce/features/store/models/product_Model.dart';
import 'package:en_ecommerce/utills/constans/images.dart';
import '../../../features/store/models/banner_Model.dart';
import '../../../features/store/models/category_Model.dart';
import '../../../routes/routes.dart';

class TDummyData {
  static final List<BannerModel> banners = [
    BannerModel(
        imageUrl: Timages.banner1, targetScreen: TRoutes.order, active: false),
    BannerModel(
        imageUrl: Timages.banner1, targetScreen: TRoutes.order, active: false),
    BannerModel(
        imageUrl: Timages.banner1, targetScreen: TRoutes.order, active: false),
    BannerModel(
        imageUrl: Timages.banner1, targetScreen: TRoutes.order, active: false),
    BannerModel(
        imageUrl: Timages.banner1, targetScreen: TRoutes.order, active: false),
    BannerModel(
        imageUrl: Timages.banner1, targetScreen: TRoutes.order, active: false),
    BannerModel(
        imageUrl: Timages.banner1, targetScreen: TRoutes.order, active: false),
  ];

//   static final UserModel user = UserModel(
//       id: "1",
//       firstName: "Adcons",
//       lastName: "Coding",
//       email: "adcons70@gmail.com",
//       phoneNumber: "4444444444",
//       profilePicture: Timages.darkLogo,
//       username: "M7D",
//       addresses: [
//         AddressModel(
//           id: "1",
//           name: "Coding With M7D",
//           phoneNumber: "3434343434",
//           stret: "3030303 binevler",
//           city: " Gaziantep",
//           state: "dmniwn",
//           postalcode: " 34343",
//           country: "Turkey ",
//         )
//       ]);

//   static final CartModel cart = CartModel(cartId "001" , items:[CartIteModel(productId: "001" ,variationId : "1", quantity : 1,title:products[0].title,image : products[0].thumbnail, brandName : products[0].brand!.name,price :products[0].price[0].attributeValues , selectedVariation : products[0].productVariations![0].productVariations)]);

  static final List<CategoryModel> categories = [
    CategoryModel(
        id: "3", name: "Sports", isFeatured: true, image: Timages.google),
    CategoryModel(
        id: "4", name: "Sports", isFeatured: true, image: Timages.google),
    CategoryModel(
        id: "5", name: "Facebook", isFeatured: false, image: Timages.facebook),
    CategoryModel(
        id: "6", name: "Google", isFeatured: true, image: Timages.google),
    CategoryModel(
        id: "7", name: "Laptops", isFeatured: true, image: Timages.facebook),
  ];

  static final List<ProductModel> products = [
    ProductModel(
        id: "001",
        price: 190,
        isFeatured: true,
        productType: "Laptop",
        stock: 23,
        description: "hvioahjkvabn",
        brand: BrandModel(
            id: "1",
            image: Timages.facebook,
            name: "Acer",
            productsCount: 220,
            isFeatured: true),
        images: [Timages.facebook, Timages.google, Timages.lightlogo],
        salePrice: 23,
        sku: "afaab",
        categoryId: "1",
        productAttributes: [
          ProductAttirbuteModel(
              name: "Color", values: ["Green", "Black", "Eed"]),
          ProductAttirbuteModel(
              name: "Size", values: ["EU 30", "EU 32", "EU 34"]),
        ],
        productVariations: [
          ProductvaritionsModel(
            id: "1",
            attributeValues: {"Color": "Black", "Size": "EU 32"},
            stock: 14,
            salePrice: 244,
            image: Timages.darkLogo,
            description: "gagaagfvq",
          )
        ],
        thumbnail: Timages.google,
        title: "Gaming Acer Laptop"),
    ProductModel(
        id: "001",
        price: 190,
        isFeatured: true,
        productType: "Laptop",
        stock: 23,
        description: "hvioahjkvabn",
        brand: BrandModel(
            id: "1",
            image: Timages.facebook,
            name: "Acer",
            productsCount: 220,
            isFeatured: true),
        images: [Timages.facebook, Timages.google, Timages.lightlogo],
        salePrice: 23,
        sku: "afaab",
        categoryId: "1",
        productAttributes: [
          ProductAttirbuteModel(
              name: "Color", values: ["Green", "Black", "Eed"]),
          ProductAttirbuteModel(
              name: "Size", values: ["EU 30", "EU 32", "EU 34"]),
        ],
        productVariations: [
          ProductvaritionsModel(
            id: "1",
            attributeValues: {"Color": "Black", "Size": "EU 32"},
            stock: 14,
            salePrice: 244,
            image: Timages.darkLogo,
            description: "gagaagfvq",
          )
        ],
        thumbnail: Timages.google,
        title: "Gaming Acer Laptop"),
    ProductModel(
        id: "001",
        price: 190,
        isFeatured: true,
        productType: "Laptop",
        stock: 23,
        description: "hvioahjkvabn",
        brand: BrandModel(
            id: "1",
            image: Timages.facebook,
            name: "Acer",
            productsCount: 220,
            isFeatured: true),
        images: [Timages.facebook, Timages.google, Timages.lightlogo],
        salePrice: 23,
        sku: "afaab",
        categoryId: "1",
        productAttributes: [
          ProductAttirbuteModel(
              name: "Color", values: ["Green", "Black", "Eed"]),
          ProductAttirbuteModel(
              name: "Size", values: ["EU 30", "EU 32", "EU 34"]),
        ],
        productVariations: [
          ProductvaritionsModel(
            id: "1",
            attributeValues: {"Color": "Black", "Size": "EU 32"},
            stock: 14,
            salePrice: 244,
            image: Timages.darkLogo,
            description: "gagaagfvq",
          )
        ],
        thumbnail: Timages.google,
        title: "Gaming Acer Laptop"),
    ProductModel(
        id: "001",
        price: 190,
        isFeatured: true,
        productType: "Laptop",
        stock: 23,
        description: "hvioahjkvabn",
        brand: BrandModel(
            id: "1",
            image: Timages.facebook,
            name: "Acer",
            productsCount: 220,
            isFeatured: true),
        images: [Timages.facebook, Timages.google, Timages.lightlogo],
        salePrice: 23,
        sku: "afaab",
        categoryId: "1",
        productAttributes: [
          ProductAttirbuteModel(
              name: "Color", values: ["Green", "Black", "Eed"]),
          ProductAttirbuteModel(
              name: "Size", values: ["EU 30", "EU 32", "EU 34"]),
        ],
        productVariations: [
          ProductvaritionsModel(
            id: "1",
            attributeValues: {"Color": "Black", "Size": "EU 32"},
            stock: 14,
            salePrice: 244,
            image: Timages.darkLogo,
            description: "gagaagfvq",
          )
        ],
        thumbnail: Timages.google,
        title: "Gaming Acer Laptop"),
    ProductModel(
        id: "001",
        price: 190,
        isFeatured: true,
        productType: "Laptop",
        stock: 23,
        description: "hvioahjkvabn",
        brand: BrandModel(
            id: "1",
            image: Timages.facebook,
            name: "Acer",
            productsCount: 220,
            isFeatured: true),
        images: [Timages.facebook, Timages.google, Timages.lightlogo],
        salePrice: 23,
        sku: "afaab",
        categoryId: "1",
        productAttributes: [
          ProductAttirbuteModel(
              name: "Color", values: ["Green", "Black", "Eed"]),
          ProductAttirbuteModel(
              name: "Size", values: ["EU 30", "EU 32", "EU 34"]),
        ],
        productVariations: [
          ProductvaritionsModel(
            id: "1",
            attributeValues: {"Color": "Black", "Size": "EU 32"},
            stock: 14,
            salePrice: 244,
            image: Timages.darkLogo,
            description: "gagaagfvq",
          )
        ],
        thumbnail: Timages.google,
        title: "Gaming Acer Laptop")
  ];
}
