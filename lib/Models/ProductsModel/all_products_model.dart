// To parse this JSON data, do
//
//     final categoriesProductsModel = categoriesProductsModelFromJson(jsonString);

import 'dart:convert';

import '../enum_value_model.dart';

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
  final DateTime? deletedAt;
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
        deletedAt: DateTime.tryParse('${json["deleted_at"]}'),
        createdAt: DateTime.tryParse('${json["created_at"]}'),
        updatedAt: DateTime.tryParse('${json["updated_at"]}'),
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
    this.productVariations = const [],
    this.productTax,
    this.brand,
    this.modifier = const [],
    this.modifierSets = const [],
    this.variations = const [],
  });

  ProductModel copyWith({
    int? id,
    String? name,
    int? quantity,
    int? businessId,
    String? type,
    int? unitId,
    int? secondaryUnitId,
    dynamic subUnitIds,
    int? brandId,
    int? categoryId,
    int? subCategoryId,
    int? tax,
    TaxType? taxType,
    int? enableStock,
    String? alertQuantity,
    String? sku,
    String? barcodeType,
    dynamic expiryPeriod,
    dynamic expiryPeriodType,
    int? enableSrNo,
    String? weight,
    String? productCustomField1,
    String? productCustomField2,
    String? productCustomField3,
    String? productCustomField4,
    String? image,
    String? productDescription,
    int? createdBy,
    dynamic warrantyId,
    int? isInactive,
    int? notForSelling,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? imageUrl,
    List<ProductVariation>? productVariations,
    ProductTax? productTax,
    dynamic brand,
    List<ModifierModel>? modifier,
    List<ProductModel>? modifierSets,
    List<VariationModel>? variations,
  }) =>
      ProductModel(
        id: id ?? this.id,
        name: name ?? this.name,
        quantity: quantity ?? this.quantity,
        businessId: businessId ?? this.businessId,
        type: type ?? this.type,
        unitId: unitId ?? this.unitId,
        secondaryUnitId: secondaryUnitId ?? this.secondaryUnitId,
        subUnitIds: subUnitIds ?? this.subUnitIds,
        brandId: brandId ?? this.brandId,
        categoryId: categoryId ?? this.categoryId,
        subCategoryId: subCategoryId ?? this.subCategoryId,
        tax: tax ?? this.tax,
        taxType: taxType ?? this.taxType,
        enableStock: enableStock ?? this.enableStock,
        alertQuantity: alertQuantity ?? this.alertQuantity,
        sku: sku ?? this.sku,
        barcodeType: barcodeType ?? this.barcodeType,
        expiryPeriod: expiryPeriod ?? this.expiryPeriod,
        expiryPeriodType: expiryPeriodType ?? this.expiryPeriodType,
        enableSrNo: enableSrNo ?? this.enableSrNo,
        weight: weight ?? this.weight,
        productCustomField1: productCustomField1 ?? this.productCustomField1,
        productCustomField2: productCustomField2 ?? this.productCustomField2,
        productCustomField3: productCustomField3 ?? this.productCustomField3,
        productCustomField4: productCustomField4 ?? this.productCustomField4,
        image: image ?? this.image,
        productDescription: productDescription ?? this.productDescription,
        createdBy: createdBy ?? this.createdBy,
        warrantyId: warrantyId ?? this.warrantyId,
        isInactive: isInactive ?? this.isInactive,
        notForSelling: notForSelling ?? this.notForSelling,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        imageUrl: imageUrl ?? this.imageUrl,
        productVariations: productVariations ?? this.productVariations,
        productTax: productTax ?? this.productTax,
        brand: brand ?? this.brand,
        modifier: modifier ?? this.modifier,
        modifierSets: modifierSets ?? this.modifierSets,
        variations: variations ?? this.variations,
      );

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
  final TaxType? taxType;
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
  final List<ProductVariation> productVariations;
  final ProductTax? productTax;
  final dynamic brand;
  final List<ModifierModel> modifier;
  final List<ProductModel> modifierSets;
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
        taxType: taxTypeValues.map[json["tax_type"]],
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
        createdAt: DateTime.tryParse('${json["created_at"]}'),
        updatedAt: DateTime.tryParse('${json["updated_at"]}'),
        imageUrl: json["image_url"],
        productVariations: json["product_variations"] == null
            ? []
            : List<ProductVariation>.from(
                json["product_variations"].map((x) => ProductVariation.fromJson(x))),
        productTax: json["product_tax"] == null ? null : ProductTax.fromJson(json["product_tax"]),
        brand: json["brand"],
        modifier: json["modifier"] == null
            ? []
            : List<ModifierModel>.from(json["modifier"].map((x) => ModifierModel.fromJson(x))),
        modifierSets: json["modifier_sets"] == null
            ? []
            : List<ProductModel>.from(json["modifier_sets"].map((x) => ProductModel.fromJson(x))),
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
        "tax_type": taxTypeValues.reverse?[taxType],
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
        "product_variations": List<dynamic>.from(productVariations.map((x) => x.toJson())),
        "product_tax": productTax?.toJson(),
        "brand": brand,
        "modifier": List<dynamic>.from(modifier.map((x) => x.toJson())),
        "modifier_sets": List<dynamic>.from(modifierSets.map((x) => x.toJson())),
        "variations": List<dynamic>.from(variations.map((x) => x.toJson())),
      };
}

class ProductTax {
  ProductTax({
    required this.id,
    required this.businessId,
    this.name,
    this.amount,
    this.isTaxGroup,
    this.forTaxGroup,
    this.createdBy,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  final int id;
  final int businessId;
  final ProductTaxName? name;
  final int? amount;
  final int? isTaxGroup;
  final int? forTaxGroup;
  final int? createdBy;
  final DateTime? deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  // ProductTax copyWith({
  //   int id,
  //   int businessId,
  //   ProductTaxName name,
  //   int amount,
  //   int isTaxGroup,
  //   int forTaxGroup,
  //   int createdBy,
  //   dynamic deletedAt,
  //   DateTime createdAt,
  //   DateTime updatedAt,
  // }) =>
  //     ProductTax(
  //       id: id ?? this.id,
  //       businessId: businessId ?? this.businessId,
  //       name: name ?? this.name,
  //       amount: amount ?? this.amount,
  //       isTaxGroup: isTaxGroup ?? this.isTaxGroup,
  //       forTaxGroup: forTaxGroup ?? this.forTaxGroup,
  //       createdBy: createdBy ?? this.createdBy,
  //       deletedAt: deletedAt ?? this.deletedAt,
  //       createdAt: createdAt ?? this.createdAt,
  //       updatedAt: updatedAt ?? this.updatedAt,
  //     );

  factory ProductTax.fromJson(Map<String, dynamic> json) => ProductTax(
        id: json["id"],
        businessId: json["business_id"],
        name: productTaxNameValues.map[json["name"]],
        amount: json["amount"],
        isTaxGroup: json["is_tax_group"],
        forTaxGroup: json["for_tax_group"],
        createdBy: json["created_by"],
        deletedAt: DateTime.tryParse('${json["deleted_at"]}'),
        createdAt: DateTime.tryParse('${json["created_at"]}'),
        updatedAt: DateTime.tryParse('${json["updated_at"]}'),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "business_id": businessId,
        "name": productTaxNameValues.reverse?[name],
        "amount": amount,
        "is_tax_group": isTaxGroup,
        "for_tax_group": forTaxGroup,
        "created_by": createdBy,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

enum ProductTaxName { VAT }

final productTaxNameValues = EnumValues({"VAT": ProductTaxName.VAT});

class ProductVariation {
  ProductVariation({
    required this.id,
    this.variationTemplateId,
    this.name,
    required this.productId,
    this.isDummy,
    this.createdAt,
    this.updatedAt,
    this.variations = const [],
  });

  final int id;
  final dynamic variationTemplateId;
  final String? name;
  final int productId;
  final int? isDummy;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<VariationModel> variations;

  // ProductVariation copyWith({
  //   int id,
  //   dynamic variationTemplateId,
  //   String name,
  //   int productId,
  //   int isDummy,
  //   DateTime createdAt,
  //   DateTime updatedAt,
  //   List<Variation> variations,
  // }) =>
  //     ProductVariation(
  //       id: id ?? this.id,
  //       variationTemplateId: variationTemplateId ?? this.variationTemplateId,
  //       name: name ?? this.name,
  //       productId: productId ?? this.productId,
  //       isDummy: isDummy ?? this.isDummy,
  //       createdAt: createdAt ?? this.createdAt,
  //       updatedAt: updatedAt ?? this.updatedAt,
  //       variations: variations ?? this.variations,
  //     );

  factory ProductVariation.fromJson(Map<String, dynamic> json) => ProductVariation(
        id: json["id"],
        variationTemplateId: json["variation_template_id"],
        name: json["name"],
        productId: json["product_id"],
        isDummy: json["is_dummy"],
        createdAt: DateTime.tryParse('${json["created_at"]}'),
        updatedAt: DateTime.tryParse('${json["updated_at"]}'),
        variations:
            List<VariationModel>.from(json["variations"].map((x) => VariationModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "variation_template_id": variationTemplateId,
        "name": name,
        "product_id": productId,
        "is_dummy": isDummy,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "variations": List<dynamic>.from(variations.map((x) => x.toJson())),
      };
}

class VariationModel {
  final int id;
  final String name;
  // final int? productVariationQuantity;
  final int productId;
  final String subSku;
  final int productVariationId;
  final dynamic variationValueId;
  final String? defaultPurchasePrice;
  final String? dppIncTax;
  final String? profitPercent;
  final String? defaultSellPrice;
  final String? sellPriceIncTax;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  final List<dynamic> comboVariations;
  final List<VariationLocationDetail> variationLocationDetails;

  VariationModel({
    required this.id,
    required this.name,
    // this.productVariationQuantity,
    required this.productId,
    required this.subSku,
    required this.productVariationId,
    this.variationValueId,
    this.defaultPurchasePrice,
    this.dppIncTax,
    this.profitPercent,
    this.defaultSellPrice,
    this.sellPriceIncTax,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.comboVariations = const [],
    this.variationLocationDetails = const [],
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
        variationValueId: json["variation_value_id"],
        defaultPurchasePrice: json["default_purchase_price"],
        dppIncTax: json["dpp_inc_tax"],
        profitPercent: json["profit_percent"],
        defaultSellPrice: json["default_sell_price"],
        sellPriceIncTax: json["sell_price_inc_tax"],
        createdAt: DateTime.tryParse('${json["created_at"]}'),
        updatedAt: DateTime.tryParse('${json["updated_at"]}'),
        deletedAt: DateTime.tryParse('${json["deleted_at"]}'),
        comboVariations: json["combo_variations"] == null
            ? []
            : List<dynamic>.from(json["combo_variations"].map((x) => x)),
        variationLocationDetails: json["variation_location_details"] == null
            ? []
            : List<VariationLocationDetail>.from(
                json["variation_location_details"].map((x) => VariationLocationDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "id": id,
        "name": name,
        "sub_sku": subSku,
        "product_variation_id": productVariationId,
        "variation_value_id": variationValueId,
        "default_purchase_price": defaultPurchasePrice,
        "dpp_inc_tax": dppIncTax,
        "profit_percent": profitPercent,
        "default_sell_price": defaultSellPrice,
        "sell_price_inc_tax": sellPriceIncTax,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt?.toIso8601String(),
        "combo_variations":
            comboVariations.isEmpty ? null : List<dynamic>.from(comboVariations.map((x) => x)),
        "variation_location_details": variationLocationDetails.isEmpty
            ? null
            : List<dynamic>.from(variationLocationDetails.map((x) => x.toJson())),
      };
}

class VariationLocationDetail {
  VariationLocationDetail({
    required this.id,
    required this.productId,
    required this.productVariationId,
    required this.variationId,
    this.locationId,
    this.qtyAvailable,
    this.createdAt,
    this.updatedAt,
  });

  final int id;
  final int productId;
  final int productVariationId;
  final int variationId;
  final int? locationId;
  final String? qtyAvailable;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory VariationLocationDetail.fromJson(Map<String, dynamic> json) => VariationLocationDetail(
        id: json["id"],
        productId: json["product_id"],
        productVariationId: json["product_variation_id"],
        variationId: json["variation_id"],
        locationId: json["location_id"],
        qtyAvailable: json["qty_available"],
        createdAt: DateTime.tryParse('${json["created_at"]}'),
        updatedAt: DateTime.tryParse('${json["updated_at"]}'),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "product_variation_id": productVariationId,
        "variation_id": variationId,
        "location_id": locationId,
        "qty_available": qtyAvailable,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

enum TaxType { INCLUSIVE }

final taxTypeValues = EnumValues({"inclusive": TaxType.INCLUSIVE});

// enum Type { SINGLE, MODIFIER }
//
// final typeValues = EnumValues({"modifier": Type.MODIFIER, "single": Type.SINGLE});

// 22 Nov 2022
/*

CategoriesProductsModel categoriesProductsModelFromJson(String str) => CategoriesProductsModel.fromJson(json.decode(str));

String categoriesProductsModelToJson(CategoriesProductsModel data) => json.encode(data.toJson());

class CategoriesProductsModel {
  CategoriesProductsModel({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  final int currentPage;
  final List<Datum> data;
  final String firstPageUrl;
  final int from;
  final int lastPage;
  final String lastPageUrl;
  final dynamic nextPageUrl;
  final String path;
  final int perPage;
  final dynamic prevPageUrl;
  final int to;
  final int total;

  factory CategoriesProductsModel.fromJson(Map<String, dynamic> json) => CategoriesProductsModel(
    currentPage: json["current_page"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
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
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
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

class Datum {
  Datum({
    this.id,
    this.name,
    this.businessId,
    this.shortCode,
    this.parentId,
    this.createdBy,
    this.categoryType,
    this.description,
    this.slug,
    this.color,
    this.image,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.products,
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
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<Product> products;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
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
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
  };
}

class Product {
  Product({
    this.id,
    this.name,
    this.businessId,
    this.type,
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
    this.productVariations,
    this.productTax,
    this.brand,
    this.modifier,
    this.modifierSets,
    this.variations,
    this.pivot,
  });

  final int id;
  final String name;
  final int businessId;
  final Type type;
  final int unitId;
  final dynamic secondaryUnitId;
  final dynamic subUnitIds;
  final dynamic brandId;
  final int categoryId;
  final dynamic subCategoryId;
  final int tax;
  final TaxType taxType;
  final int enableStock;
  final String alertQuantity;
  final String sku;
  final BarcodeType barcodeType;
  final dynamic expiryPeriod;
  final dynamic expiryPeriodType;
  final int enableSrNo;
  final String weight;
  final String productCustomField1;
  final String productCustomField2;
  final String productCustomField3;
  final String productCustomField4;
  final String image;
  final dynamic productDescription;
  final int createdBy;
  final dynamic warrantyId;
  final int isInactive;
  final int notForSelling;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String imageUrl;
  final List<ProductVariationElement> productVariations;
  final ProductTax productTax;
  final dynamic brand;
  final List<Modifier> modifier;
  final List<Product> modifierSets;
  final List<ProductVariation> variations;
  final Pivot pivot;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    name: json["name"],
    businessId: json["business_id"],
    type: typeValues.map[json["type"]],
    unitId: json["unit_id"] == null ? null : json["unit_id"],
    secondaryUnitId: json["secondary_unit_id"],
    subUnitIds: json["sub_unit_ids"],
    brandId: json["brand_id"],
    categoryId: json["category_id"] == null ? null : json["category_id"],
    subCategoryId: json["sub_category_id"],
    tax: json["tax"] == null ? null : json["tax"],
    taxType: taxTypeValues.map[json["tax_type"]],
    enableStock: json["enable_stock"],
    alertQuantity: json["alert_quantity"] == null ? null : json["alert_quantity"],
    sku: json["sku"],
    barcodeType: barcodeTypeValues.map[json["barcode_type"]],
    expiryPeriod: json["expiry_period"],
    expiryPeriodType: json["expiry_period_type"],
    enableSrNo: json["enable_sr_no"],
    weight: json["weight"] == null ? null : json["weight"],
    productCustomField1: json["product_custom_field1"] == null ? null : json["product_custom_field1"],
    productCustomField2: json["product_custom_field2"] == null ? null : json["product_custom_field2"],
    productCustomField3: json["product_custom_field3"] == null ? null : json["product_custom_field3"],
    productCustomField4: json["product_custom_field4"] == null ? null : json["product_custom_field4"],
    image: json["image"] == null ? null : json["image"],
    productDescription: json["product_description"],
    createdBy: json["created_by"],
    warrantyId: json["warranty_id"],
    isInactive: json["is_inactive"],
    notForSelling: json["not_for_selling"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    imageUrl: json["image_url"],
    productVariations: json["product_variations"] == null ? null : List<ProductVariationElement>.from(json["product_variations"].map((x) => ProductVariationElement.fromJson(x))),
    productTax: json["product_tax"] == null ? null : ProductTax.fromJson(json["product_tax"]),
    brand: json["brand"],
    modifier: json["modifier"] == null ? null : List<Modifier>.from(json["modifier"].map((x) => Modifier.fromJson(x))),
    modifierSets: json["modifier_sets"] == null ? null : List<Product>.from(json["modifier_sets"].map((x) => Product.fromJson(x))),
    variations: json["variations"] == null ? null : List<ProductVariation>.from(json["variations"].map((x) => ProductVariation.fromJson(x))),
    pivot: json["pivot"] == null ? null : Pivot.fromJson(json["pivot"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "business_id": businessId,
    "type": typeValues.reverse[type],
    "unit_id": unitId == null ? null : unitId,
    "secondary_unit_id": secondaryUnitId,
    "sub_unit_ids": subUnitIds,
    "brand_id": brandId,
    "category_id": categoryId == null ? null : categoryId,
    "sub_category_id": subCategoryId,
    "tax": tax == null ? null : tax,
    "tax_type": taxTypeValues.reverse[taxType],
    "enable_stock": enableStock,
    "alert_quantity": alertQuantity == null ? null : alertQuantity,
    "sku": sku,
    "barcode_type": barcodeTypeValues.reverse[barcodeType],
    "expiry_period": expiryPeriod,
    "expiry_period_type": expiryPeriodType,
    "enable_sr_no": enableSrNo,
    "weight": weight == null ? null : weight,
    "product_custom_field1": productCustomField1 == null ? null : productCustomField1,
    "product_custom_field2": productCustomField2 == null ? null : productCustomField2,
    "product_custom_field3": productCustomField3 == null ? null : productCustomField3,
    "product_custom_field4": productCustomField4 == null ? null : productCustomField4,
    "image": image == null ? null : image,
    "product_description": productDescription,
    "created_by": createdBy,
    "warranty_id": warrantyId,
    "is_inactive": isInactive,
    "not_for_selling": notForSelling,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "image_url": imageUrl,
    "product_variations": productVariations == null ? null : List<dynamic>.from(productVariations.map((x) => x.toJson())),
    "product_tax": productTax == null ? null : productTax.toJson(),
    "brand": brand,
    "modifier": modifier == null ? null : List<dynamic>.from(modifier.map((x) => x.toJson())),
    "modifier_sets": modifierSets == null ? null : List<dynamic>.from(modifierSets.map((x) => x.toJson())),
    "variations": variations == null ? null : List<dynamic>.from(variations.map((x) => x.toJson())),
    "pivot": pivot == null ? null : pivot.toJson(),
  };
}

enum BarcodeType { C128 }

final barcodeTypeValues = EnumValues({
  "C128": BarcodeType.C128
});

class Modifier {
  Modifier({
    this.modifierSetId,
    this.productId,
    this.productmodifier,
  });

  final int modifierSetId;
  final int productId;
  final Productmodifier productmodifier;

  factory Modifier.fromJson(Map<String, dynamic> json) => Modifier(
    modifierSetId: json["modifier_set_id"],
    productId: json["product_id"],
    productmodifier: Productmodifier.fromJson(json["productmodifier"]),
  );

  Map<String, dynamic> toJson() => {
    "modifier_set_id": modifierSetId,
    "product_id": productId,
    "productmodifier": productmodifier.toJson(),
  };
}

class Productmodifier {
  Productmodifier({
    this.id,
    this.name,
    this.businessId,
    this.type,
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
    this.variations,
  });

  final int id;
  final String name;
  final int businessId;
  final Type type;
  final dynamic unitId;
  final dynamic secondaryUnitId;
  final dynamic subUnitIds;
  final dynamic brandId;
  final dynamic categoryId;
  final dynamic subCategoryId;
  final dynamic tax;
  final TaxType taxType;
  final int enableStock;
  final dynamic alertQuantity;
  final String sku;
  final BarcodeType barcodeType;
  final dynamic expiryPeriod;
  final dynamic expiryPeriodType;
  final int enableSrNo;
  final dynamic weight;
  final dynamic productCustomField1;
  final dynamic productCustomField2;
  final dynamic productCustomField3;
  final dynamic productCustomField4;
  final dynamic image;
  final dynamic productDescription;
  final int createdBy;
  final dynamic warrantyId;
  final int isInactive;
  final int notForSelling;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String imageUrl;
  final List<ProductmodifierVariation> variations;

  factory Productmodifier.fromJson(Map<String, dynamic> json) => Productmodifier(
    id: json["id"],
    name: json["name"],
    businessId: json["business_id"],
    type: typeValues.map[json["type"]],
    unitId: json["unit_id"],
    secondaryUnitId: json["secondary_unit_id"],
    subUnitIds: json["sub_unit_ids"],
    brandId: json["brand_id"],
    categoryId: json["category_id"],
    subCategoryId: json["sub_category_id"],
    tax: json["tax"],
    taxType: taxTypeValues.map[json["tax_type"]],
    enableStock: json["enable_stock"],
    alertQuantity: json["alert_quantity"],
    sku: json["sku"],
    barcodeType: barcodeTypeValues.map[json["barcode_type"]],
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
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    imageUrl: json["image_url"],
    variations: List<ProductmodifierVariation>.from(json["variations"].map((x) => ProductmodifierVariation.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "business_id": businessId,
    "type": typeValues.reverse[type],
    "unit_id": unitId,
    "secondary_unit_id": secondaryUnitId,
    "sub_unit_ids": subUnitIds,
    "brand_id": brandId,
    "category_id": categoryId,
    "sub_category_id": subCategoryId,
    "tax": tax,
    "tax_type": taxTypeValues.reverse[taxType],
    "enable_stock": enableStock,
    "alert_quantity": alertQuantity,
    "sku": sku,
    "barcode_type": barcodeTypeValues.reverse[barcodeType],
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
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "image_url": imageUrl,
    "variations": List<dynamic>.from(variations.map((x) => x.toJson())),
  };
}

enum TaxType { INCLUSIVE }

final taxTypeValues = EnumValues({
  "inclusive": TaxType.INCLUSIVE
});

enum Type { SINGLE, MODIFIER }

final typeValues = EnumValues({
  "modifier": Type.MODIFIER,
  "single": Type.SINGLE
});

class ProductmodifierVariation {
  ProductmodifierVariation({
    this.id,
    this.name,
    this.productId,
    this.subSku,
    this.productVariationId,
    this.variationValueId,
    this.defaultPurchasePrice,
    this.dppIncTax,
    this.profitPercent,
    this.defaultSellPrice,
    this.sellPriceIncTax,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.comboVariations,
    this.variationLocationDetails,
  });

  final int id;
  final VariationName name;
  final int productId;
  final String subSku;
  final int productVariationId;
  final dynamic variationValueId;
  final String defaultPurchasePrice;
  final String dppIncTax;
  final String profitPercent;
  final String defaultSellPrice;
  final String sellPriceIncTax;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic deletedAt;
  final List<dynamic> comboVariations;
  final List<VariationLocationDetail> variationLocationDetails;

  factory ProductmodifierVariation.fromJson(Map<String, dynamic> json) => ProductmodifierVariation(
    id: json["id"],
    name: variationNameValues.map[json["name"]],
    productId: json["product_id"],
    subSku: json["sub_sku"],
    productVariationId: json["product_variation_id"],
    variationValueId: json["variation_value_id"],
    defaultPurchasePrice: json["default_purchase_price"],
    dppIncTax: json["dpp_inc_tax"],
    profitPercent: json["profit_percent"],
    defaultSellPrice: json["default_sell_price"],
    sellPriceIncTax: json["sell_price_inc_tax"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
    comboVariations: json["combo_variations"] == null ? null : List<dynamic>.from(json["combo_variations"].map((x) => x)),
    variationLocationDetails: json["variation_location_details"] == null ? null : List<VariationLocationDetail>.from(json["variation_location_details"].map((x) => VariationLocationDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": variationNameValues.reverse[name],
    "product_id": productId,
    "sub_sku": subSku,
    "product_variation_id": productVariationId,
    "variation_value_id": variationValueId,
    "default_purchase_price": defaultPurchasePrice,
    "dpp_inc_tax": dppIncTax,
    "profit_percent": profitPercent,
    "default_sell_price": defaultSellPrice,
    "sell_price_inc_tax": sellPriceIncTax,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "deleted_at": deletedAt,
    "combo_variations": comboVariations == null ? null : List<dynamic>.from(comboVariations.map((x) => x)),
    "variation_location_details": variationLocationDetails == null ? null : List<dynamic>.from(variationLocationDetails.map((x) => x.toJson())),
  };
}

enum VariationName { DUMMY, EXTRA_CHEESE, EXTRA_BUTTER, GARLIC_SAUSE, BUTTER }

final variationNameValues = EnumValues({
  "butter": VariationName.BUTTER,
  "DUMMY": VariationName.DUMMY,
  "Extra Butter": VariationName.EXTRA_BUTTER,
  "Extra Cheese": VariationName.EXTRA_CHEESE,
  "Garlic Sause": VariationName.GARLIC_SAUSE
});

class VariationLocationDetail {
  VariationLocationDetail({
    this.id,
    this.productId,
    this.productVariationId,
    this.variationId,
    this.locationId,
    this.qtyAvailable,
    this.createdAt,
    this.updatedAt,
  });

  final int id;
  final int productId;
  final int productVariationId;
  final int variationId;
  final int locationId;
  final String qtyAvailable;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory VariationLocationDetail.fromJson(Map<String, dynamic> json) => VariationLocationDetail(
    id: json["id"],
    productId: json["product_id"],
    productVariationId: json["product_variation_id"],
    variationId: json["variation_id"],
    locationId: json["location_id"],
    qtyAvailable: json["qty_available"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_id": productId,
    "product_variation_id": productVariationId,
    "variation_id": variationId,
    "location_id": locationId,
    "qty_available": qtyAvailable,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class Pivot {
  Pivot({
    this.productId,
    this.modifierSetId,
  });

  final int productId;
  final int modifierSetId;

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
    productId: json["product_id"],
    modifierSetId: json["modifier_set_id"],
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "modifier_set_id": modifierSetId,
  };
}

class ProductTax {
  ProductTax({
    this.id,
    this.businessId,
    this.name,
    this.amount,
    this.isTaxGroup,
    this.forTaxGroup,
    this.createdBy,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  final int id;
  final int businessId;
  final ProductTaxName name;
  final int amount;
  final int isTaxGroup;
  final int forTaxGroup;
  final int createdBy;
  final dynamic deletedAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory ProductTax.fromJson(Map<String, dynamic> json) => ProductTax(
    id: json["id"],
    businessId: json["business_id"],
    name: productTaxNameValues.map[json["name"]],
    amount: json["amount"],
    isTaxGroup: json["is_tax_group"],
    forTaxGroup: json["for_tax_group"],
    createdBy: json["created_by"],
    deletedAt: json["deleted_at"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "business_id": businessId,
    "name": productTaxNameValues.reverse[name],
    "amount": amount,
    "is_tax_group": isTaxGroup,
    "for_tax_group": forTaxGroup,
    "created_by": createdBy,
    "deleted_at": deletedAt,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

enum ProductTaxName { VAT }

final productTaxNameValues = EnumValues({
  "VAT": ProductTaxName.VAT
});

class ProductVariationElement {
  ProductVariationElement({
    this.id,
    this.variationTemplateId,
    this.name,
    this.productId,
    this.isDummy,
    this.createdAt,
    this.updatedAt,
    this.variations,
  });

  final int id;
  final dynamic variationTemplateId;
  final VariationName name;
  final int productId;
  final int isDummy;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<ProductmodifierVariation> variations;

  factory ProductVariationElement.fromJson(Map<String, dynamic> json) => ProductVariationElement(
    id: json["id"],
    variationTemplateId: json["variation_template_id"],
    name: variationNameValues.map[json["name"]],
    productId: json["product_id"],
    isDummy: json["is_dummy"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    variations: List<ProductmodifierVariation>.from(json["variations"].map((x) => ProductmodifierVariation.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "variation_template_id": variationTemplateId,
    "name": variationNameValues.reverse[name],
    "product_id": productId,
    "is_dummy": isDummy,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "variations": List<dynamic>.from(variations.map((x) => x.toJson())),
  };
}

class ProductVariation {
  ProductVariation({
    this.productId,
    this.name,
    this.subSku,
    this.defaultPurchasePrice,
    this.dppIncTax,
    this.profitPercent,
    this.defaultSellPrice,
    this.sellPriceIncTax,
    this.comboVariations,
  });

  final int productId;
  final VariationName name;
  final String subSku;
  final String defaultPurchasePrice;
  final String dppIncTax;
  final String profitPercent;
  final String defaultSellPrice;
  final String sellPriceIncTax;
  final List<dynamic> comboVariations;

  factory ProductVariation.fromJson(Map<String, dynamic> json) => ProductVariation(
    productId: json["product_id"],
    name: variationNameValues.map[json["name"]],
    subSku: json["sub_sku"],
    defaultPurchasePrice: json["default_purchase_price"],
    dppIncTax: json["dpp_inc_tax"],
    profitPercent: json["profit_percent"],
    defaultSellPrice: json["default_sell_price"],
    sellPriceIncTax: json["sell_price_inc_tax"],
    comboVariations: List<dynamic>.from(json["combo_variations"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "name": variationNameValues.reverse[name],
    "sub_sku": subSku,
    "default_purchase_price": defaultPurchasePrice,
    "dpp_inc_tax": dppIncTax,
    "profit_percent": profitPercent,
    "default_sell_price": defaultSellPrice,
    "sell_price_inc_tax": sellPriceIncTax,
    "combo_variations": List<dynamic>.from(comboVariations.map((x) => x)),
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
*/

// 23 Nov 2022
/*

// To parse this JSON data, do
//
//     final categoriesProductsModel = categoriesProductsModelFromJson(jsonString);

import 'dart:convert';

CategoriesProductsModel categoriesProductsModelFromJson(String str) => CategoriesProductsModel.fromJson(json.decode(str));

String categoriesProductsModelToJson(CategoriesProductsModel data) => json.encode(data.toJson());

class CategoriesProductsModel {
    CategoriesProductsModel({
        this.currentPage,
        this.data,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.prevPageUrl,
        this.to,
        this.total,
    });

    final int currentPage;
    final List<Datum> data;
    final String firstPageUrl;
    final int from;
    final int lastPage;
    final String lastPageUrl;
    final dynamic nextPageUrl;
    final String path;
    final int perPage;
    final dynamic prevPageUrl;
    final int to;
    final int total;

    CategoriesProductsModel copyWith({
        int currentPage,
        List<Datum> data,
        String firstPageUrl,
        int from,
        int lastPage,
        String lastPageUrl,
        dynamic nextPageUrl,
        String path,
        int perPage,
        dynamic prevPageUrl,
        int to,
        int total,
    }) =>
        CategoriesProductsModel(
            currentPage: currentPage ?? this.currentPage,
            data: data ?? this.data,
            firstPageUrl: firstPageUrl ?? this.firstPageUrl,
            from: from ?? this.from,
            lastPage: lastPage ?? this.lastPage,
            lastPageUrl: lastPageUrl ?? this.lastPageUrl,
            nextPageUrl: nextPageUrl ?? this.nextPageUrl,
            path: path ?? this.path,
            perPage: perPage ?? this.perPage,
            prevPageUrl: prevPageUrl ?? this.prevPageUrl,
            to: to ?? this.to,
            total: total ?? this.total,
        );

    factory CategoriesProductsModel.fromJson(Map<String, dynamic> json) => CategoriesProductsModel(
        currentPage: json["current_page"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
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
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
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

class Datum {
    Datum({
        this.id,
        this.name,
        this.businessId,
        this.shortCode,
        this.parentId,
        this.createdBy,
        this.categoryType,
        this.description,
        this.slug,
        this.color,
        this.image,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
        this.products,
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
    final DateTime createdAt;
    final DateTime updatedAt;
    final List<Product> products;

    Datum copyWith({
        int id,
        String name,
        int businessId,
        dynamic shortCode,
        int parentId,
        int createdBy,
        String categoryType,
        dynamic description,
        dynamic slug,
        dynamic color,
        dynamic image,
        dynamic deletedAt,
        DateTime createdAt,
        DateTime updatedAt,
        List<Product> products,
    }) =>
        Datum(
            id: id ?? this.id,
            name: name ?? this.name,
            businessId: businessId ?? this.businessId,
            shortCode: shortCode ?? this.shortCode,
            parentId: parentId ?? this.parentId,
            createdBy: createdBy ?? this.createdBy,
            categoryType: categoryType ?? this.categoryType,
            description: description ?? this.description,
            slug: slug ?? this.slug,
            color: color ?? this.color,
            image: image ?? this.image,
            deletedAt: deletedAt ?? this.deletedAt,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            products: products ?? this.products,
        );

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
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
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
    };
}

class Modifier {
    Modifier({
        this.modifierSetId,
        this.productId,
        this.productmodifier,
    });

    final int modifierSetId;
    final int productId;
    final Product productmodifier;

    Modifier copyWith({
        int modifierSetId,
        int productId,
        Product productmodifier,
    }) =>
        Modifier(
            modifierSetId: modifierSetId ?? this.modifierSetId,
            productId: productId ?? this.productId,
            productmodifier: productmodifier ?? this.productmodifier,
        );

    factory Modifier.fromJson(Map<String, dynamic> json) => Modifier(
        modifierSetId: json["modifier_set_id"],
        productId: json["product_id"],
        productmodifier: Product.fromJson(json["productmodifier"]),
    );

    Map<String, dynamic> toJson() => {
        "modifier_set_id": modifierSetId,
        "product_id": productId,
        "productmodifier": productmodifier.toJson(),
    };
}

class Product {
    Product({
        this.id,
        this.name,
        this.businessId,
        this.type,
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
        this.productVariations,
        this.productTax,
        this.brand,
        this.modifier,
        this.modifierSets,
        this.variations,
        this.pivot,
    });

    final int id;
    final String name;
    final int businessId;
    final Type type;
    final int unitId;
    final dynamic secondaryUnitId;
    final dynamic subUnitIds;
    final dynamic brandId;
    final int categoryId;
    final dynamic subCategoryId;
    final int tax;
    final TaxType taxType;
    final int enableStock;
    final String alertQuantity;
    final String sku;
    final BarcodeType barcodeType;
    final dynamic expiryPeriod;
    final dynamic expiryPeriodType;
    final int enableSrNo;
    final String weight;
    final String productCustomField1;
    final String productCustomField2;
    final String productCustomField3;
    final String productCustomField4;
    final String image;
    final dynamic productDescription;
    final int createdBy;
    final dynamic warrantyId;
    final int isInactive;
    final int notForSelling;
    final DateTime createdAt;
    final DateTime updatedAt;
    final String imageUrl;
    final List<ProductVariation> productVariations;
    final ProductTax productTax;
    final dynamic brand;
    final List<Modifier> modifier;
    final List<Product> modifierSets;
    final List<Variation> variations;
    final Pivot pivot;

    Product copyWith({
        int id,
        String name,
        int businessId,
        Type type,
        int unitId,
        dynamic secondaryUnitId,
        dynamic subUnitIds,
        dynamic brandId,
        int categoryId,
        dynamic subCategoryId,
        int tax,
        TaxType taxType,
        int enableStock,
        String alertQuantity,
        String sku,
        BarcodeType barcodeType,
        dynamic expiryPeriod,
        dynamic expiryPeriodType,
        int enableSrNo,
        String weight,
        String productCustomField1,
        String productCustomField2,
        String productCustomField3,
        String productCustomField4,
        String image,
        dynamic productDescription,
        int createdBy,
        dynamic warrantyId,
        int isInactive,
        int notForSelling,
        DateTime createdAt,
        DateTime updatedAt,
        String imageUrl,
        List<ProductVariation> productVariations,
        ProductTax productTax,
        dynamic brand,
        List<Modifier> modifier,
        List<Product> modifierSets,
        List<Variation> variations,
        Pivot pivot,
    }) =>
        Product(
            id: id ?? this.id,
            name: name ?? this.name,
            businessId: businessId ?? this.businessId,
            type: type ?? this.type,
            unitId: unitId ?? this.unitId,
            secondaryUnitId: secondaryUnitId ?? this.secondaryUnitId,
            subUnitIds: subUnitIds ?? this.subUnitIds,
            brandId: brandId ?? this.brandId,
            categoryId: categoryId ?? this.categoryId,
            subCategoryId: subCategoryId ?? this.subCategoryId,
            tax: tax ?? this.tax,
            taxType: taxType ?? this.taxType,
            enableStock: enableStock ?? this.enableStock,
            alertQuantity: alertQuantity ?? this.alertQuantity,
            sku: sku ?? this.sku,
            barcodeType: barcodeType ?? this.barcodeType,
            expiryPeriod: expiryPeriod ?? this.expiryPeriod,
            expiryPeriodType: expiryPeriodType ?? this.expiryPeriodType,
            enableSrNo: enableSrNo ?? this.enableSrNo,
            weight: weight ?? this.weight,
            productCustomField1: productCustomField1 ?? this.productCustomField1,
            productCustomField2: productCustomField2 ?? this.productCustomField2,
            productCustomField3: productCustomField3 ?? this.productCustomField3,
            productCustomField4: productCustomField4 ?? this.productCustomField4,
            image: image ?? this.image,
            productDescription: productDescription ?? this.productDescription,
            createdBy: createdBy ?? this.createdBy,
            warrantyId: warrantyId ?? this.warrantyId,
            isInactive: isInactive ?? this.isInactive,
            notForSelling: notForSelling ?? this.notForSelling,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            imageUrl: imageUrl ?? this.imageUrl,
            productVariations: productVariations ?? this.productVariations,
            productTax: productTax ?? this.productTax,
            brand: brand ?? this.brand,
            modifier: modifier ?? this.modifier,
            modifierSets: modifierSets ?? this.modifierSets,
            variations: variations ?? this.variations,
            pivot: pivot ?? this.pivot,
        );

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        businessId: json["business_id"],
        type: typeValues.map[json["type"]],
        unitId: json["unit_id"] == null ? null : json["unit_id"],
        secondaryUnitId: json["secondary_unit_id"],
        subUnitIds: json["sub_unit_ids"],
        brandId: json["brand_id"],
        categoryId: json["category_id"] == null ? null : json["category_id"],
        subCategoryId: json["sub_category_id"],
        tax: json["tax"] == null ? null : json["tax"],
        taxType: taxTypeValues.map[json["tax_type"]],
        enableStock: json["enable_stock"],
        alertQuantity: json["alert_quantity"] == null ? null : json["alert_quantity"],
        sku: json["sku"],
        barcodeType: barcodeTypeValues.map[json["barcode_type"]],
        expiryPeriod: json["expiry_period"],
        expiryPeriodType: json["expiry_period_type"],
        enableSrNo: json["enable_sr_no"],
        weight: json["weight"] == null ? null : json["weight"],
        productCustomField1: json["product_custom_field1"] == null ? null : json["product_custom_field1"],
        productCustomField2: json["product_custom_field2"] == null ? null : json["product_custom_field2"],
        productCustomField3: json["product_custom_field3"] == null ? null : json["product_custom_field3"],
        productCustomField4: json["product_custom_field4"] == null ? null : json["product_custom_field4"],
        image: json["image"] == null ? null : json["image"],
        productDescription: json["product_description"],
        createdBy: json["created_by"],
        warrantyId: json["warranty_id"],
        isInactive: json["is_inactive"],
        notForSelling: json["not_for_selling"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        imageUrl: json["image_url"],
        productVariations: json["product_variations"] == null ? null : List<ProductVariation>.from(json["product_variations"].map((x) => ProductVariation.fromJson(x))),
        productTax: json["product_tax"] == null ? null : ProductTax.fromJson(json["product_tax"]),
        brand: json["brand"],
        modifier: json["modifier"] == null ? null : List<Modifier>.from(json["modifier"].map((x) => Modifier.fromJson(x))),
        modifierSets: json["modifier_sets"] == null ? null : List<Product>.from(json["modifier_sets"].map((x) => Product.fromJson(x))),
        variations: json["variations"] == null ? null : List<Variation>.from(json["variations"].map((x) => Variation.fromJson(x))),
        pivot: json["pivot"] == null ? null : Pivot.fromJson(json["pivot"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "business_id": businessId,
        "type": typeValues.reverse[type],
        "unit_id": unitId == null ? null : unitId,
        "secondary_unit_id": secondaryUnitId,
        "sub_unit_ids": subUnitIds,
        "brand_id": brandId,
        "category_id": categoryId == null ? null : categoryId,
        "sub_category_id": subCategoryId,
        "tax": tax == null ? null : tax,
        "tax_type": taxTypeValues.reverse[taxType],
        "enable_stock": enableStock,
        "alert_quantity": alertQuantity == null ? null : alertQuantity,
        "sku": sku,
        "barcode_type": barcodeTypeValues.reverse[barcodeType],
        "expiry_period": expiryPeriod,
        "expiry_period_type": expiryPeriodType,
        "enable_sr_no": enableSrNo,
        "weight": weight == null ? null : weight,
        "product_custom_field1": productCustomField1 == null ? null : productCustomField1,
        "product_custom_field2": productCustomField2 == null ? null : productCustomField2,
        "product_custom_field3": productCustomField3 == null ? null : productCustomField3,
        "product_custom_field4": productCustomField4 == null ? null : productCustomField4,
        "image": image == null ? null : image,
        "product_description": productDescription,
        "created_by": createdBy,
        "warranty_id": warrantyId,
        "is_inactive": isInactive,
        "not_for_selling": notForSelling,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "image_url": imageUrl,
        "product_variations": productVariations == null ? null : List<dynamic>.from(productVariations.map((x) => x.toJson())),
        "product_tax": productTax == null ? null : productTax.toJson(),
        "brand": brand,
        "modifier": modifier == null ? null : List<dynamic>.from(modifier.map((x) => x.toJson())),
        "modifier_sets": modifierSets == null ? null : List<dynamic>.from(modifierSets.map((x) => x.toJson())),
        "variations": variations == null ? null : List<dynamic>.from(variations.map((x) => x.toJson())),
        "pivot": pivot == null ? null : pivot.toJson(),
    };
}

enum BarcodeType { C128 }

final barcodeTypeValues = EnumValues({
    "C128": BarcodeType.C128
});

class Pivot {
    Pivot({
        this.productId,
        this.modifierSetId,
    });

    final int productId;
    final int modifierSetId;

    Pivot copyWith({
        int productId,
        int modifierSetId,
    }) =>
        Pivot(
            productId: productId ?? this.productId,
            modifierSetId: modifierSetId ?? this.modifierSetId,
        );

    factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        productId: json["product_id"],
        modifierSetId: json["modifier_set_id"],
    );

    Map<String, dynamic> toJson() => {
        "product_id": productId,
        "modifier_set_id": modifierSetId,
    };
}

class ProductTax {
    ProductTax({
        this.id,
        this.businessId,
        this.name,
        this.amount,
        this.isTaxGroup,
        this.forTaxGroup,
        this.createdBy,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
    });

    final int id;
    final int businessId;
    final ProductTaxName name;
    final int amount;
    final int isTaxGroup;
    final int forTaxGroup;
    final int createdBy;
    final dynamic deletedAt;
    final DateTime createdAt;
    final DateTime updatedAt;

    ProductTax copyWith({
        int id,
        int businessId,
        ProductTaxName name,
        int amount,
        int isTaxGroup,
        int forTaxGroup,
        int createdBy,
        dynamic deletedAt,
        DateTime createdAt,
        DateTime updatedAt,
    }) =>
        ProductTax(
            id: id ?? this.id,
            businessId: businessId ?? this.businessId,
            name: name ?? this.name,
            amount: amount ?? this.amount,
            isTaxGroup: isTaxGroup ?? this.isTaxGroup,
            forTaxGroup: forTaxGroup ?? this.forTaxGroup,
            createdBy: createdBy ?? this.createdBy,
            deletedAt: deletedAt ?? this.deletedAt,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
        );

    factory ProductTax.fromJson(Map<String, dynamic> json) => ProductTax(
        id: json["id"],
        businessId: json["business_id"],
        name: productTaxNameValues.map[json["name"]],
        amount: json["amount"],
        isTaxGroup: json["is_tax_group"],
        forTaxGroup: json["for_tax_group"],
        createdBy: json["created_by"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "business_id": businessId,
        "name": productTaxNameValues.reverse[name],
        "amount": amount,
        "is_tax_group": isTaxGroup,
        "for_tax_group": forTaxGroup,
        "created_by": createdBy,
        "deleted_at": deletedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

enum ProductTaxName { VAT }

final productTaxNameValues = EnumValues({
    "VAT": ProductTaxName.VAT
});

class ProductVariation {
    ProductVariation({
        this.id,
        this.variationTemplateId,
        this.name,
        this.productId,
        this.isDummy,
        this.createdAt,
        this.updatedAt,
        this.variations,
    });

    final int id;
    final dynamic variationTemplateId;
    final ProductVariationName name;
    final int productId;
    final int isDummy;
    final DateTime createdAt;
    final DateTime updatedAt;
    final List<Variation> variations;

    ProductVariation copyWith({
        int id,
        dynamic variationTemplateId,
        ProductVariationName name,
        int productId,
        int isDummy,
        DateTime createdAt,
        DateTime updatedAt,
        List<Variation> variations,
    }) =>
        ProductVariation(
            id: id ?? this.id,
            variationTemplateId: variationTemplateId ?? this.variationTemplateId,
            name: name ?? this.name,
            productId: productId ?? this.productId,
            isDummy: isDummy ?? this.isDummy,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            variations: variations ?? this.variations,
        );

    factory ProductVariation.fromJson(Map<String, dynamic> json) => ProductVariation(
        id: json["id"],
        variationTemplateId: json["variation_template_id"],
        name: productVariationNameValues.map[json["name"]],
        productId: json["product_id"],
        isDummy: json["is_dummy"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        variations: List<Variation>.from(json["variations"].map((x) => Variation.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "variation_template_id": variationTemplateId,
        "name": productVariationNameValues.reverse[name],
        "product_id": productId,
        "is_dummy": isDummy,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "variations": List<dynamic>.from(variations.map((x) => x.toJson())),
    };
}

enum ProductVariationName { DUMMY, EXTRA_CHEESE, EXTRA_BUTTER, GARLIC_SAUSE, BUTTER }

final productVariationNameValues = EnumValues({
    "butter": ProductVariationName.BUTTER,
    "DUMMY": ProductVariationName.DUMMY,
    "Extra Butter": ProductVariationName.EXTRA_BUTTER,
    "Extra Cheese": ProductVariationName.EXTRA_CHEESE,
    "Garlic Sause": ProductVariationName.GARLIC_SAUSE
});

class Variation {
    Variation({
        this.id,
        this.name,
        this.productId,
        this.subSku,
        this.productVariationId,
        this.variationValueId,
        this.defaultPurchasePrice,
        this.dppIncTax,
        this.profitPercent,
        this.defaultSellPrice,
        this.sellPriceIncTax,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.comboVariations,
        this.variationLocationDetails,
    });

    final int id;
    final ProductVariationName name;
    final int productId;
    final String subSku;
    final int productVariationId;
    final dynamic variationValueId;
    final String defaultPurchasePrice;
    final String dppIncTax;
    final String profitPercent;
    final String defaultSellPrice;
    final String sellPriceIncTax;
    final DateTime createdAt;
    final DateTime updatedAt;
    final dynamic deletedAt;
    final List<dynamic> comboVariations;
    final List<VariationLocationDetail> variationLocationDetails;

    Variation copyWith({
        int id,
        ProductVariationName name,
        int productId,
        String subSku,
        int productVariationId,
        dynamic variationValueId,
        String defaultPurchasePrice,
        String dppIncTax,
        String profitPercent,
        String defaultSellPrice,
        String sellPriceIncTax,
        DateTime createdAt,
        DateTime updatedAt,
        dynamic deletedAt,
        List<dynamic> comboVariations,
        List<VariationLocationDetail> variationLocationDetails,
    }) =>
        Variation(
            id: id ?? this.id,
            name: name ?? this.name,
            productId: productId ?? this.productId,
            subSku: subSku ?? this.subSku,
            productVariationId: productVariationId ?? this.productVariationId,
            variationValueId: variationValueId ?? this.variationValueId,
            defaultPurchasePrice: defaultPurchasePrice ?? this.defaultPurchasePrice,
            dppIncTax: dppIncTax ?? this.dppIncTax,
            profitPercent: profitPercent ?? this.profitPercent,
            defaultSellPrice: defaultSellPrice ?? this.defaultSellPrice,
            sellPriceIncTax: sellPriceIncTax ?? this.sellPriceIncTax,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            deletedAt: deletedAt ?? this.deletedAt,
            comboVariations: comboVariations ?? this.comboVariations,
            variationLocationDetails: variationLocationDetails ?? this.variationLocationDetails,
        );

    factory Variation.fromJson(Map<String, dynamic> json) => Variation(
        id: json["id"],
        name: productVariationNameValues.map[json["name"]],
        productId: json["product_id"],
        subSku: json["sub_sku"],
        productVariationId: json["product_variation_id"],
        variationValueId: json["variation_value_id"],
        defaultPurchasePrice: json["default_purchase_price"],
        dppIncTax: json["dpp_inc_tax"],
        profitPercent: json["profit_percent"],
        defaultSellPrice: json["default_sell_price"],
        sellPriceIncTax: json["sell_price_inc_tax"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        comboVariations: json["combo_variations"] == null ? null : List<dynamic>.from(json["combo_variations"].map((x) => x)),
        variationLocationDetails: json["variation_location_details"] == null ? null : List<VariationLocationDetail>.from(json["variation_location_details"].map((x) => VariationLocationDetail.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": productVariationNameValues.reverse[name],
        "product_id": productId,
        "sub_sku": subSku,
        "product_variation_id": productVariationId,
        "variation_value_id": variationValueId,
        "default_purchase_price": defaultPurchasePrice,
        "dpp_inc_tax": dppIncTax,
        "profit_percent": profitPercent,
        "default_sell_price": defaultSellPrice,
        "sell_price_inc_tax": sellPriceIncTax,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "combo_variations": comboVariations == null ? null : List<dynamic>.from(comboVariations.map((x) => x)),
        "variation_location_details": variationLocationDetails == null ? null : List<dynamic>.from(variationLocationDetails.map((x) => x.toJson())),
    };
}

class VariationLocationDetail {
    VariationLocationDetail({
        this.id,
        this.productId,
        this.productVariationId,
        this.variationId,
        this.locationId,
        this.qtyAvailable,
        this.createdAt,
        this.updatedAt,
    });

    final int id;
    final int productId;
    final int productVariationId;
    final int variationId;
    final int locationId;
    final String qtyAvailable;
    final DateTime createdAt;
    final DateTime updatedAt;

    VariationLocationDetail copyWith({
        int id,
        int productId,
        int productVariationId,
        int variationId,
        int locationId,
        String qtyAvailable,
        DateTime createdAt,
        DateTime updatedAt,
    }) =>
        VariationLocationDetail(
            id: id ?? this.id,
            productId: productId ?? this.productId,
            productVariationId: productVariationId ?? this.productVariationId,
            variationId: variationId ?? this.variationId,
            locationId: locationId ?? this.locationId,
            qtyAvailable: qtyAvailable ?? this.qtyAvailable,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
        );

    factory VariationLocationDetail.fromJson(Map<String, dynamic> json) => VariationLocationDetail(
        id: json["id"],
        productId: json["product_id"],
        productVariationId: json["product_variation_id"],
        variationId: json["variation_id"],
        locationId: json["location_id"],
        qtyAvailable: json["qty_available"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "product_variation_id": productVariationId,
        "variation_id": variationId,
        "location_id": locationId,
        "qty_available": qtyAvailable,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

enum TaxType { INCLUSIVE }

final taxTypeValues = EnumValues({
    "inclusive": TaxType.INCLUSIVE
});

enum Type { SINGLE, MODIFIER }

final typeValues = EnumValues({
    "modifier": Type.MODIFIER,
    "single": Type.SINGLE
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}

*/
