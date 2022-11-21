// To parse this JSON data, do
//
//     final categoriesProductsModel = categoriesProductsModelFromJson(jsonString);

import 'dart:convert';

CategoriesProductsModel categoriesProductsModelFromJson(String str) =>
    CategoriesProductsModel.fromJson(json.decode(str));

String categoriesProductsModelToJson(CategoriesProductsModel data) => json.encode(data.toJson());

class CategoriesProductsModel {
  CategoriesProductsModel({
    required this.currentPage,
    this.categories = const [],
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    this.nextPageUrl,
    required this.path,
    required this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  final int currentPage;
  final List<CategoryDataModel> categories;
  final String firstPageUrl;
  final int from;
  final int lastPage;
  final String lastPageUrl;
  final String? nextPageUrl;
  final String path;
  final int perPage;
  final String? prevPageUrl;
  final int? to;
  final int? total;

  factory CategoriesProductsModel.fromJson(Map<String, dynamic> json) => CategoriesProductsModel(
        currentPage: json["current_page"],
        categories:
            List<CategoryDataModel>.from(json["data"].map((x) => CategoryDataModel.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(categories.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class CategoryDataModel {
  CategoryDataModel({
    required this.id,
    required this.name,
    required this.businessId,
    this.shortCode,
    required this.parentId,
    required this.createdBy,
    required this.categoryType,
    this.description,
    this.slug,
    this.color,
    this.image,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.products = const [],
  });

  final int id;
  final String name;
  final int businessId;
  final dynamic shortCode;
  final int parentId;
  final int createdBy;
  final String categoryType;
  final dynamic description;
  final dynamic slug;
  final dynamic color;
  final dynamic image;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<ProductModel> products;

  factory CategoryDataModel.fromJson(Map<String, dynamic> json) => CategoryDataModel(
        id: json["id"],
        name: json["name"],
        businessId: json["business_id"],
        shortCode: json["short_code"],
        parentId: json["parent_id"],
        createdBy: json["created_by"],
        categoryType: json["category_type"],
        description: json["description"],
        slug: json["slug"],
        color: json["color"],
        image: json["image"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.tryParse(json["created_at"]),
        updatedAt: DateTime.tryParse(json["updated_at"]),
        products: List<ProductModel>.from(json["products"].map((x) => ProductModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "business_id": businessId,
        "short_code": shortCode,
        "parent_id": parentId,
        "created_by": createdBy,
        "category_type": categoryType,
        "description": description,
        "slug": slug,
        "color": color,
        "image": image,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class ModifierModel {
  ModifierModel({
    required this.modifierSetId,
    required this.productId,
    required this.productModifier,
  });

  final int modifierSetId;
  final int productId;
  final ProductModel productModifier;

  factory ModifierModel.fromJson(Map<String, dynamic> json) => ModifierModel(
        modifierSetId: json["modifier_set_id"],
        productId: json["product_id"],
        productModifier: ProductModel.fromJson(json["productmodifier"]),
      );

  Map<String, dynamic> toJson() => {
        "modifier_set_id": modifierSetId,
        "product_id": productId,
        "productmodifier": productModifier.toJson(),
      };
}

class ProductModel {
  ProductModel({
    required this.id,
    required this.name,
    this.quantity = 0,
    required this.businessId,
    required this.type,
    this.unitId,
    this.secondaryUnitId,
    this.subUnitIds,
    this.brandId,
    this.categoryId,
    this.subCategoryId,
    this.tax,
    this.taxType,
    this.enableStock,
    this.alertQuantity,
    this.sku,
    this.barcodeType,
    this.expiryPeriod,
    this.expiryPeriodType,
    this.enableSrNo,
    this.weight,
    this.productCustomField1,
    this.productCustomField2,
    this.productCustomField3,
    this.productCustomField4,
    this.image,
    this.productDescription,
    this.createdBy,
    this.warrantyId,
    this.isInactive,
    this.notForSelling,
    this.createdAt,
    this.updatedAt,
    this.imageUrl,
    this.brand,
    this.modifier = const [],
    this.variations = const [],
  });

  final int id;
  final String name;
  int quantity;
  final int businessId;
  final String type;
  final int? unitId;
  final int? secondaryUnitId;
  final dynamic subUnitIds;
  final int? brandId;
  final int? categoryId;
  final int? subCategoryId;
  final int? tax;
  final String? taxType;
  final int? enableStock;
  final String? alertQuantity;
  final String? sku;
  final String? barcodeType;
  final dynamic expiryPeriod;
  final dynamic expiryPeriodType;
  final int? enableSrNo;
  final String? weight;
  final String? productCustomField1;
  final String? productCustomField2;
  final String? productCustomField3;
  final String? productCustomField4;
  final String? image;
  final String? productDescription;
  final int? createdBy;
  final dynamic warrantyId;
  final int? isInactive;
  final int? notForSelling;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? imageUrl;
  final dynamic brand;
  final List<ModifierModel> modifier;
  final List<VariationModel> variations;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        name: json["name"],
        businessId: json["business_id"],
        type: json["type"],
        unitId: json["unit_id"],
        secondaryUnitId: json["secondary_unit_id"],
        subUnitIds: json["sub_unit_ids"],
        brandId: json["brand_id"],
        categoryId: json["category_id"],
        subCategoryId: json["sub_category_id"],
        tax: json["tax"],
        taxType: json["tax_type"],
        enableStock: json["enable_stock"],
        alertQuantity: json["alert_quantity"],
        sku: json["sku"],
        barcodeType: json["barcode_type"],
        expiryPeriod: json["expiry_period"],
        expiryPeriodType: json["expiry_period_type"],
        enableSrNo: json["enable_sr_no"],
        weight: json["weight"],
        productCustomField1: json["product_custom_field1"],
        productCustomField2: json["product_custom_field2"],
        productCustomField3: json["product_custom_field3"],
        productCustomField4: json["product_custom_field4"],
        image: json["image"],
        productDescription: json["product_description"],
        createdBy: json["created_by"],
        warrantyId: json["warranty_id"],
        isInactive: json["is_inactive"],
        notForSelling: json["not_for_selling"],
        createdAt: DateTime.tryParse(json["created_at"]),
        updatedAt: DateTime.tryParse(json["updated_at"]),
        imageUrl: json["image_url"],
        brand: json["brand"],
        modifier: json["modifier"] == null
            ? []
            : List<ModifierModel>.from(json["modifier"].map((x) => ModifierModel.fromJson(x))),
        variations: json["variations"] == null
            ? []
            : List<VariationModel>.from(json["variations"].map((x) => VariationModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "quantity": quantity,
        "business_id": businessId,
        "type": type,
        "unit_id": unitId,
        "secondary_unit_id": secondaryUnitId,
        "sub_unit_ids": subUnitIds,
        "brand_id": brandId,
        "category_id": categoryId,
        "sub_category_id": subCategoryId,
        "tax": tax,
        "tax_type": taxType,
        "enable_stock": enableStock,
        "alert_quantity": alertQuantity,
        "sku": sku,
        "barcode_type": barcodeType,
        "expiry_period": expiryPeriod,
        "expiry_period_type": expiryPeriodType,
        "enable_sr_no": enableSrNo,
        "weight": weight,
        "product_custom_field1": productCustomField1,
        "product_custom_field2": productCustomField2,
        "product_custom_field3": productCustomField3,
        "product_custom_field4": productCustomField4,
        "image": image,
        "product_description": productDescription,
        "created_by": createdBy,
        "warranty_id": warrantyId,
        "is_inactive": isInactive,
        "not_for_selling": notForSelling,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "image_url": imageUrl,
        "brand": brand,
        "modifier": List<dynamic>.from(modifier.map((x) => x.toJson())),
        "variations": List<dynamic>.from(variations.map((x) => x.toJson())),
      };
}

class VariationModel {
  final int productId;
  final int id;
  final String name;
  final String subSku;
  final int productVariationId;
  // final int? productVariationQuantity;
  final String? defaultPurchasePrice;
  final String? dppIncTax;
  final String? profitPercent;
  final String? defaultSellPrice;
  final String? sellPriceIncTax;

  VariationModel({
    required this.productId,
    required this.id,
    required this.name,
    required this.subSku,
    required this.productVariationId,
    // this.productVariationQuantity,
    this.defaultPurchasePrice,
    this.dppIncTax,
    this.profitPercent,
    this.defaultSellPrice,
    this.sellPriceIncTax,
  });

  // VariationModel copyWith({
  //   int? productId,
  //   int? id,
  //   String? name,
  //   String? subSku,
  //   int? productVariationId,
  //   int? productVariationQuantity,
  //   String? defaultPurchasePrice,
  //   String? dppIncTax,
  //   String? profitPercent,
  //   String? defaultSellPrice,
  //   String? sellPriceIncTax,
  // }) =>
  //     VariationModel(
  //       productId: productId ?? this.productId,
  //       id: id ?? this.id,
  //       name: name ?? this.name,
  //       subSku: subSku ?? this.subSku,
  //       productVariationId: productVariationId ?? this.productVariationId,
  //       defaultPurchasePrice: defaultPurchasePrice ?? this.defaultPurchasePrice,
  //       dppIncTax: dppIncTax ?? this.dppIncTax,
  //       profitPercent: profitPercent ?? this.profitPercent,
  //       defaultSellPrice: defaultSellPrice ?? this.defaultSellPrice,
  //       sellPriceIncTax: sellPriceIncTax ?? this.sellPriceIncTax,
  //     );

  factory VariationModel.fromJson(Map<String, dynamic> json) => VariationModel(
        productId: json["product_id"],
        id: json["id"],
        name: json["name"] ?? 'Variation Name Missing!',
        subSku: json["sub_sku"],
        productVariationId: json["product_variation_id"],
        defaultPurchasePrice: json["default_purchase_price"],
        dppIncTax: json["dpp_inc_tax"],
        profitPercent: json["profit_percent"],
        defaultSellPrice: json["default_sell_price"],
        sellPriceIncTax: json["sell_price_inc_tax"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "id": id,
        "name": name,
        "sub_sku": subSku,
        "product_variation_id": productVariationId,
        "default_purchase_price": defaultPurchasePrice,
        "dpp_inc_tax": dppIncTax,
        "profit_percent": profitPercent,
        "default_sell_price": defaultSellPrice,
        "sell_price_inc_tax": sellPriceIncTax,
      };
}
