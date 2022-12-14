// To parse this JSON data, do
//
//     final allProducts = allProductsFromJson(jsonString);

import 'package:get/get.dart';
import 'dart:convert';

AllProducts allProductsFromJson(String str) => AllProducts.fromJson(json.decode(str));

String allProductsToJson(AllProducts data) => json.encode(data.toJson());

class AllProducts {
  AllProducts({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    required this.prevPageUrl,
    this.to,
    this.total,
  });

  int currentPage;
  List<Datum> data;
  String firstPageUrl;
  int? from;
  int lastPage;
  String lastPageUrl;
  dynamic nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  factory AllProducts.fromJson(Map<String, dynamic> json) => AllProducts(
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
    this.selectQuantity,
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
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.productsList,
  });
  RxInt? selectQuantity;
  int? id;
  String? name;
  int? businessId;
  String? shortCode;
  int? parentId;
  int? createdBy;
  String? categoryType;
  String? description;
  String? slug;
  String? color;
  String? image;
  DateTime? deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Product>? productsList;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        selectQuantity: 0.obs,
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
        productsList: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "selectQuantity": selectQuantity,
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
        "products": List<dynamic>.from(productsList!.map((x) => x.toJson())),
      };
}

class Modifier {
  Modifier({
    required this.modifierSetId,
    required this.productId,
    required this.productModifier,
  });

  int modifierSetId;
  int productId;
  Product productModifier;

  factory Modifier.fromJson(Map<String, dynamic> json) => Modifier(
        modifierSetId: json["modifier_set_id"],
        productId: json["product_id"],
        productModifier: Product.fromJson(json["productmodifier"]),
      );

  Map<String, dynamic> toJson() => {
        "modifier_set_id": modifierSetId,
        "product_id": productId,
        "productmodifier": productModifier.toJson(),
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
    this.brand,
    this.modifier = const <Modifier>[],
    this.modifierSets = const [],
    this.variations = const [],
    this.pivot,
    this.selectQuantity = 0,
  });
  int selectQuantity;
  int? id;
  String? name;
  int? businessId;
  String? type;
  int? unitId;
  int? secondaryUnitId;
  int? subUnitIds;
  int? brandId;
  int? categoryId;
  int? subCategoryId;
  int? tax;
  String? taxType;
  int? enableStock;
  String? alertQuantity;
  String? sku;
  String? barcodeType;
  DateTime? expiryPeriod;
  DateTime? expiryPeriodType;
  int? enableSrNo;
  String? weight;
  String? productCustomField1;
  String? productCustomField2;
  String? productCustomField3;
  String? productCustomField4;
  String? image;
  String? productDescription;
  int? createdBy;
  int? warrantyId;
  int? isInactive;
  int? notForSelling;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? imageUrl;
  dynamic brand;
  List<Modifier>? modifier;
  List<Product>? modifierSets;
  List<Variation>? variations;
  Pivot? pivot;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        selectQuantity: 0,
        id: json["id"],
        name: json["name"] ?? "",
        businessId: json["business_id"],
        type: json["type"] ?? "",
        unitId: json["unit_id"],
        secondaryUnitId: json["secondary_unit_id"],
        subUnitIds: json["sub_unit_ids"],
        brandId: json["brand_id"],
        categoryId: json["category_id"],
        subCategoryId: json["sub_category_id"],
        tax: json["tax"],
        taxType: json["tax_type"] ?? "",
        enableStock: json["enable_stock"],
        alertQuantity: json["alert_quantity"],
        sku: json["sku"] ?? "",
        barcodeType: json["barcode_type"],
        expiryPeriod: json["expiry_period"],
        expiryPeriodType: json["expiry_period_type"],
        enableSrNo: json["enable_sr_no"] ?? "",
        weight: json["weight"],
        productCustomField1: json["product_custom_field1"] ?? "",
        productCustomField2: json["product_custom_field2"] ?? "",
        productCustomField3: json["product_custom_field3"] ?? "",
        productCustomField4: json["product_custom_field4"] ?? "",
        image: json["image"] ?? "",
        productDescription: json["product_description"] ?? "",
        createdBy: json["created_by"],
        warrantyId: json["warranty_id"],
        isInactive: json["is_inactive"],
        notForSelling: json["not_for_selling"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        imageUrl: json["image_url"] ?? "",
        brand: json["brand"],
        modifier: json["modifier"] != null
            ? List<Modifier>.from(json["modifier"].map((x) => Modifier.fromJson(x)))
            : null,
        modifierSets: json["modifier_sets"] != null
            ? List<Product>.from(json["modifier_sets"].map((x) => Product.fromJson(x)))
            : null,
        variations: json["variations"] != null
            ? List<Variation>.from(json["variations"].map((x) => Variation.fromJson(x)))
            : null,
        pivot: json["pivot"] != null ? Pivot.fromJson(json["pivot"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "selectQuantity": selectQuantity,
        "id": id,
        "name": name,
        "business_id": businessId,
        "type": type,
        "unit_id": unitId == null ? null : unitId,
        "secondary_unit_id": secondaryUnitId,
        "sub_unit_ids": subUnitIds,
        "brand_id": brandId,
        "category_id": categoryId == null ? null : categoryId,
        "sub_category_id": subCategoryId,
        "tax": tax == null ? null : tax,
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
        "modifier": List<dynamic>.from(modifier!.map((x) => x.toJson())),
        "modifier_sets": List<dynamic>.from(modifierSets!.map((x) => x.toJson())),
        "variations": List<dynamic>.from(variations!.map((x) => x.toJson())),
        "pivot": pivot == null ? null : pivot?.toJson(),
      };
}

class Pivot {
  Pivot({
    required this.productId,
    required this.modifierSetId,
  });

  int productId;
  int modifierSetId;

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        productId: json["product_id"],
        modifierSetId: json["modifier_set_id"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "modifier_set_id": modifierSetId,
      };
}

class Variation {
  Variation({
    required this.productId,
    required this.name,
    required this.subSku,
    required this.defaultPurchasePrice,
    required this.dppIncTax,
    required this.profitPercent,
    required this.defaultSellPrice,
    required this.sellPriceIncTax,
    required this.comboVariations,
  });

  int productId;
  String name;
  String subSku;
  String defaultPurchasePrice;
  String dppIncTax;
  String profitPercent;
  String defaultSellPrice;
  String sellPriceIncTax;
  List<dynamic>? comboVariations;

  factory Variation.fromJson(Map<String, dynamic> json) => Variation(
        productId: json["product_id"],
        name: json["name"],
        subSku: json["sub_sku"],
        defaultPurchasePrice: json["default_purchase_price"],
        dppIncTax: json["dpp_inc_tax"],
        profitPercent: json["profit_percent"],
        defaultSellPrice: json["default_sell_price"],
        sellPriceIncTax: json["sell_price_inc_tax"],
        comboVariations: json["combo_variations"] == null
            ? null
            : List<dynamic>.from(json["combo_variations"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "name": name,
        "sub_sku": subSku,
        "default_purchase_price": defaultPurchasePrice,
        "dpp_inc_tax": dppIncTax,
        "profit_percent": profitPercent,
        "default_sell_price": defaultSellPrice,
        "sell_price_inc_tax": sellPriceIncTax,
        "combo_variations":
            comboVariations == null ? null : List<dynamic>.from(comboVariations!.map((x) => x)),
      };
}

// import 'dart:convert';
//
// import 'package:get/get.dart';
//
// AllProducts allProductsFromJson(String str) => AllProducts.fromJson(json.decode(str));
//
// String allProductsToJson(AllProducts data) => json.encode(data.toJson());
//
// class AllProducts {
//   AllProducts({
//     required this.data,
//     required this.links,
//     required this.meta,
//   });
//
//   List<Products> data;
//   Links links;
//   Meta meta;
//
//   factory AllProducts.fromJson(Map<String, dynamic> json) => AllProducts(
//         data: List<Products>.from(json["data"].map((x) => Products.fromJson(x))),
//         links: Links.fromJson(json["links"]),
//         meta: Meta.fromJson(json["meta"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "data": List<dynamic>.from(data.map((x) => x.toJson())),
//         "links": links.toJson(),
//         "meta": meta.toJson(),
//       };
// }
//
// class Products {
//   Products({
//     required this.id,
//     required this.name,
//     required this.businessId,
//     required this.type,
//     required this.secondaryUnitId,
//     required this.subUnitIds,
//     required this.enableStock,
//     required this.alertQuantity,
//     required this.sku,
//     required this.barcodeType,
//     required this.expiryPeriod,
//     required this.expiryPeriodType,
//     required this.enableSrNo,
//     required this.weight,
//     required this.productCustomField1,
//     required this.productCustomField2,
//     required this.productCustomField3,
//     required this.productCustomField4,
//     required this.image,
//     required this.productDescription,
//     required this.createdBy,
//     required this.warrantyId,
//     required this.isInactive,
//     required this.notForSelling,
//     required this.imageUrl,
//     required this.productVariations,
//     required this.brand,
//     required this.unit,
//     required this.category,
//     required this.subCategory,
//     required this.productTax,
//     required this.productLocations,
//     required this.selectQuantity,
//   });
//
//   int id;
//   RxInt selectQuantity;
//   String name;
//   int businessId;
//   String type;
//   dynamic secondaryUnitId;
//   dynamic subUnitIds;
//   int enableStock;
//   String alertQuantity;
//   String sku;
//   String barcodeType;
//   dynamic expiryPeriod;
//   dynamic expiryPeriodType;
//   int enableSrNo;
//   String weight;
//   String productCustomField1;
//   String productCustomField2;
//   String productCustomField3;
//   String productCustomField4;
//   String image;
//   dynamic productDescription;
//   int createdBy;
//   dynamic warrantyId;
//   int isInactive;
//   int notForSelling;
//   String imageUrl;
//   List<ProductVariation> productVariations;
//   dynamic brand;
//   Unit unit;
//   Category category;
//   dynamic subCategory;
//   ProductTax productTax;
//   List<ProductLocation> productLocations;
//
//   factory Products.fromJson(Map<String, dynamic> json) => Products(
//         id: json["id"],
//         selectQuantity: 0.obs,
//         name: json["name"],
//         businessId: json["business_id"],
//         type: json["type"],
//         secondaryUnitId: json["secondary_unit_id"],
//         subUnitIds: json["sub_unit_ids"],
//         enableStock: json["enable_stock"],
//         alertQuantity: json["alert_quantity"],
//         sku: json["sku"],
//         barcodeType: json["barcode_type"],
//         expiryPeriod: json["expiry_period"],
//         expiryPeriodType: json["expiry_period_type"],
//         enableSrNo: json["enable_sr_no"],
//         weight: json["weight"],
//         productCustomField1: json["product_custom_field1"],
//         productCustomField2: json["product_custom_field2"],
//         productCustomField3: json["product_custom_field3"],
//         productCustomField4: json["product_custom_field4"],
//         image: json["image"],
//         productDescription: json["product_description"],
//         createdBy: json["created_by"],
//         warrantyId: json["warranty_id"],
//         isInactive: json["is_inactive"],
//         notForSelling: json["not_for_selling"],
//         imageUrl: json["image_url"],
//         productVariations: List<ProductVariation>.from(
//             json["product_variations"].map((x) => ProductVariation.fromJson(x))),
//         brand: json["brand"],
//         unit: Unit.fromJson(json["unit"]),
//         category: Category.fromJson(json["category"]),
//         subCategory: json["sub_category"],
//         productTax: ProductTax.fromJson(json["product_tax"]),
//         productLocations: List<ProductLocation>.from(
//             json["product_locations"].map((x) => ProductLocation.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "selectQuantity": selectQuantity,
//         "name": name,
//         "business_id": businessId,
//         "type": type,
//         "secondary_unit_id": secondaryUnitId,
//         "sub_unit_ids": subUnitIds,
//         "enable_stock": enableStock,
//         "alert_quantity": alertQuantity,
//         "sku": sku,
//         "barcode_type": barcodeType,
//         "expiry_period": expiryPeriod,
//         "expiry_period_type": expiryPeriodType,
//         "enable_sr_no": enableSrNo,
//         "weight": weight,
//         "product_custom_field1": productCustomField1,
//         "product_custom_field2": productCustomField2,
//         "product_custom_field3": productCustomField3,
//         "product_custom_field4": productCustomField4,
//         "image": image,
//         "product_description": productDescription,
//         "created_by": createdBy,
//         "warranty_id": warrantyId,
//         "is_inactive": isInactive,
//         "not_for_selling": notForSelling,
//         "image_url": imageUrl,
//         "product_variations": List<dynamic>.from(productVariations.map((x) => x.toJson())),
//         "brand": brand,
//         "unit": unit.toJson(),
//         "category": category.toJson(),
//         "sub_category": subCategory,
//         "product_tax": productTax.toJson(),
//         "product_locations": List<dynamic>.from(productLocations.map((x) => x.toJson())),
//       };
// }
//
// class Category {
//   Category({
//     required this.id,
//     required this.name,
//     this.image = 'assets/ItemCategory/cat_fastfood.png',
//     required this.businessId,
//     required this.shortCode,
//     required this.parentId,
//     required this.createdBy,
//     required this.categoryType,
//     required this.description,
//     required this.slug,
//     required this.deletedAt,
//     required this.createdAt,
//     required this.updatedAt,
//   });
//
//   int id;
//   String name;
//   String image;
//   int businessId;
//   dynamic shortCode;
//   int parentId;
//   int createdBy;
//   String categoryType;
//   dynamic description;
//   dynamic slug;
//   dynamic deletedAt;
//   DateTime createdAt;
//   DateTime updatedAt;
//
//   factory Category.fromJson(Map<String, dynamic> json) => Category(
//         id: json["id"],
//         name: json["name"],
//         image: 'assets/ItemCategory/cat_fastfood.png',
//         businessId: json["business_id"],
//         shortCode: json["short_code"],
//         parentId: json["parent_id"],
//         createdBy: json["created_by"],
//         categoryType: json["category_type"],
//         description: json["description"],
//         slug: json["slug"],
//         deletedAt: json["deleted_at"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "image": image,
//         "business_id": businessId,
//         "short_code": shortCode,
//         "parent_id": parentId,
//         "created_by": createdBy,
//         "category_type": categoryType,
//         "description": description,
//         "slug": slug,
//         "deleted_at": deletedAt,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//       };
// }
//
// class ProductLocation {
//   ProductLocation({
//     required this.id,
//     required this.businessId,
//     required this.locationId,
//     required this.name,
//     required this.landmark,
//     required this.country,
//     required this.state,
//     required this.city,
//     required this.zipCode,
//     required this.invoiceSchemeId,
//     required this.invoiceLayoutId,
//     required this.saleInvoiceLayoutId,
//     required this.sellingPriceGroupId,
//     required this.printReceiptOnInvoice,
//     required this.receiptPrinterType,
//     required this.printerId,
//     required this.mobile,
//     required this.alternateNumber,
//     required this.email,
//     required this.website,
//     required this.featuredProducts,
//     required this.isActive,
//     required this.defaultPaymentAccounts,
//     required this.customField1,
//     required this.customField2,
//     required this.customField3,
//     required this.customField4,
//     required this.deletedAt,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.pivot,
//   });
//
//   int id;
//   int businessId;
//   String locationId;
//   String name;
//   String landmark;
//   String country;
//   String state;
//   String city;
//   String zipCode;
//   int invoiceSchemeId;
//   int invoiceLayoutId;
//   int saleInvoiceLayoutId;
//   int sellingPriceGroupId;
//   int printReceiptOnInvoice;
//   String receiptPrinterType;
//   dynamic printerId;
//   String mobile;
//   String alternateNumber;
//   String email;
//   String website;
//   dynamic featuredProducts;
//   int isActive;
//   String defaultPaymentAccounts;
//   dynamic customField1;
//   dynamic customField2;
//   dynamic customField3;
//   dynamic customField4;
//   dynamic deletedAt;
//   DateTime createdAt;
//   DateTime updatedAt;
//   Pivot pivot;
//
//   factory ProductLocation.fromJson(Map<String, dynamic> json) => ProductLocation(
//         id: json["id"],
//         businessId: json["business_id"],
//         locationId: json["location_id"],
//         name: json["name"],
//         landmark: json["landmark"],
//         country: json["country"],
//         state: json["state"],
//         city: json["city"],
//         zipCode: json["zip_code"],
//         invoiceSchemeId: json["invoice_scheme_id"],
//         invoiceLayoutId: json["invoice_layout_id"],
//         saleInvoiceLayoutId: json["sale_invoice_layout_id"],
//         sellingPriceGroupId: json["selling_price_group_id"],
//         printReceiptOnInvoice: json["print_receipt_on_invoice"],
//         receiptPrinterType: json["receipt_printer_type"],
//         printerId: json["printer_id"],
//         mobile: json["mobile"],
//         alternateNumber: json["alternate_number"],
//         email: json["email"],
//         website: json["website"],
//         featuredProducts: json["featured_products"],
//         isActive: json["is_active"],
//         defaultPaymentAccounts: json["default_payment_accounts"],
//         customField1: json["custom_field1"],
//         customField2: json["custom_field2"],
//         customField3: json["custom_field3"],
//         customField4: json["custom_field4"],
//         deletedAt: json["deleted_at"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         pivot: Pivot.fromJson(json["pivot"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "business_id": businessId,
//         "location_id": locationId,
//         "name": name,
//         "landmark": landmark,
//         "country": country,
//         "state": state,
//         "city": city,
//         "zip_code": zipCode,
//         "invoice_scheme_id": invoiceSchemeId,
//         "invoice_layout_id": invoiceLayoutId,
//         "sale_invoice_layout_id": saleInvoiceLayoutId,
//         "selling_price_group_id": sellingPriceGroupId,
//         "print_receipt_on_invoice": printReceiptOnInvoice,
//         "receipt_printer_type": receiptPrinterType,
//         "printer_id": printerId,
//         "mobile": mobile,
//         "alternate_number": alternateNumber,
//         "email": email,
//         "website": website,
//         "featured_products": featuredProducts,
//         "is_active": isActive,
//         "default_payment_accounts": defaultPaymentAccounts,
//         "custom_field1": customField1,
//         "custom_field2": customField2,
//         "custom_field3": customField3,
//         "custom_field4": customField4,
//         "deleted_at": deletedAt,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//         "pivot": pivot.toJson(),
//       };
// }
//
// class Pivot {
//   Pivot({
//     required this.productId,
//     required this.locationId,
//   });
//
//   int productId;
//   int locationId;
//
//   factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
//         productId: json["product_id"],
//         locationId: json["location_id"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "product_id": productId,
//         "location_id": locationId,
//       };
// }
//
// class ProductTax {
//   ProductTax({
//     required this.id,
//     required this.businessId,
//     required this.name,
//     required this.amount,
//     required this.isTaxGroup,
//     required this.forTaxGroup,
//     required this.createdBy,
//     required this.deletedAt,
//     required this.createdAt,
//     required this.updatedAt,
//   });
//
//   int id;
//   int businessId;
//   String name;
//   int amount;
//   int isTaxGroup;
//   int forTaxGroup;
//   int createdBy;
//   dynamic deletedAt;
//   DateTime createdAt;
//   DateTime updatedAt;
//
//   factory ProductTax.fromJson(Map<String, dynamic> json) => ProductTax(
//         id: json["id"],
//         businessId: json["business_id"],
//         name: json["name"],
//         amount: json["amount"],
//         isTaxGroup: json["is_tax_group"],
//         forTaxGroup: json["for_tax_group"],
//         createdBy: json["created_by"],
//         deletedAt: json["deleted_at"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "business_id": businessId,
//         "name": name,
//         "amount": amount,
//         "is_tax_group": isTaxGroup,
//         "for_tax_group": forTaxGroup,
//         "created_by": createdBy,
//         "deleted_at": deletedAt,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//       };
// }
//
// class ProductVariation {
//   ProductVariation({
//     required this.id,
//     required this.variationTemplateId,
//     required this.name,
//     required this.productId,
//     required this.isDummy,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.variations,
//   });
//
//   int id;
//   dynamic variationTemplateId;
//   String name;
//   int productId;
//   int isDummy;
//   DateTime createdAt;
//   DateTime updatedAt;
//   List<Variation> variations;
//
//   factory ProductVariation.fromJson(Map<String, dynamic> json) => ProductVariation(
//         id: json["id"],
//         variationTemplateId: json["variation_template_id"],
//         name: json["name"],
//         productId: json["product_id"],
//         isDummy: json["is_dummy"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         variations: List<Variation>.from(json["variations"].map((x) => Variation.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "variation_template_id": variationTemplateId,
//         "name": name,
//         "product_id": productId,
//         "is_dummy": isDummy,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//         "variations": List<dynamic>.from(variations.map((x) => x.toJson())),
//       };
// }
//
// class Variation {
//   Variation({
//     required this.id,
//     required this.name,
//     required this.productId,
//     required this.subSku,
//     required this.productVariationId,
//     required this.variationValueId,
//     required this.defaultPurchasePrice,
//     required this.dppIncTax,
//     required this.profitPercent,
//     required this.defaultSellPrice,
//     required this.sellPriceIncTax,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.deletedAt,
//     required this.comboVariations,
//     required this.variationLocationDetails,
//     required this.media,
//     required this.discounts,
//   });
//
//   int id;
//   String name;
//   int productId;
//   String subSku;
//   int productVariationId;
//   dynamic variationValueId;
//   String defaultPurchasePrice;
//   String dppIncTax;
//   String profitPercent;
//   String defaultSellPrice;
//   String sellPriceIncTax;
//   DateTime createdAt;
//   DateTime updatedAt;
//   dynamic deletedAt;
//   List<dynamic> comboVariations;
//   List<dynamic> variationLocationDetails;
//   List<dynamic> media;
//   List<dynamic> discounts;
//
//   factory Variation.fromJson(Map<String, dynamic> json) => Variation(
//         id: json["id"],
//         name: json["name"],
//         productId: json["product_id"],
//         subSku: json["sub_sku"],
//         productVariationId: json["product_variation_id"],
//         variationValueId: json["variation_value_id"],
//         defaultPurchasePrice: json["default_purchase_price"],
//         dppIncTax: json["dpp_inc_tax"],
//         profitPercent: json["profit_percent"],
//         defaultSellPrice: json["default_sell_price"],
//         sellPriceIncTax: json["sell_price_inc_tax"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         deletedAt: json["deleted_at"],
//         comboVariations: List<dynamic>.from(json["combo_variations"].map((x) => x)),
//         variationLocationDetails:
//             List<dynamic>.from(json["variation_location_details"].map((x) => x)),
//         media: List<dynamic>.from(json["media"].map((x) => x)),
//         discounts: List<dynamic>.from(json["discounts"].map((x) => x)),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "product_id": productId,
//         "sub_sku": subSku,
//         "product_variation_id": productVariationId,
//         "variation_value_id": variationValueId,
//         "default_purchase_price": defaultPurchasePrice,
//         "dpp_inc_tax": dppIncTax,
//         "profit_percent": profitPercent,
//         "default_sell_price": defaultSellPrice,
//         "sell_price_inc_tax": sellPriceIncTax,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//         "deleted_at": deletedAt,
//         "combo_variations": List<dynamic>.from(comboVariations.map((x) => x)),
//         "variation_location_details": List<dynamic>.from(variationLocationDetails.map((x) => x)),
//         "media": List<dynamic>.from(media.map((x) => x)),
//         "discounts": List<dynamic>.from(discounts.map((x) => x)),
//       };
// }
//
// class Unit {
//   Unit({
//     required this.id,
//     required this.businessId,
//     required this.actualName,
//     required this.shortName,
//     required this.allowDecimal,
//     required this.baseUnitId,
//     required this.baseUnitMultiplier,
//     required this.createdBy,
//     required this.deletedAt,
//     required this.createdAt,
//     required this.updatedAt,
//   });
//
//   int id;
//   int businessId;
//   String actualName;
//   String shortName;
//   int allowDecimal;
//   dynamic baseUnitId;
//   dynamic baseUnitMultiplier;
//   int createdBy;
//   dynamic deletedAt;
//   DateTime createdAt;
//   DateTime updatedAt;
//
//   factory Unit.fromJson(Map<String, dynamic> json) => Unit(
//         id: json["id"],
//         businessId: json["business_id"],
//         actualName: json["actual_name"],
//         shortName: json["short_name"],
//         allowDecimal: json["allow_decimal"],
//         baseUnitId: json["base_unit_id"],
//         baseUnitMultiplier: json["base_unit_multiplier"],
//         createdBy: json["created_by"],
//         deletedAt: json["deleted_at"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "business_id": businessId,
//         "actual_name": actualName,
//         "short_name": shortName,
//         "allow_decimal": allowDecimal,
//         "base_unit_id": baseUnitId,
//         "base_unit_multiplier": baseUnitMultiplier,
//         "created_by": createdBy,
//         "deleted_at": deletedAt,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//       };
// }
//
// class Links {
//   Links({
//     required this.first,
//     required this.last,
//     required this.prev,
//     required this.next,
//   });
//
//   String first;
//   String last;
//   dynamic prev;
//   String next;
//
//   factory Links.fromJson(Map<String, dynamic> json) => Links(
//         first: json["first"],
//         last: json["last"],
//         prev: json["prev"],
//         next: json["next"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "first": first,
//         "last": last,
//         "prev": prev,
//         "next": next,
//       };
// }
//
// class Meta {
//   Meta({
//     required this.currentPage,
//     required this.from,
//     required this.lastPage,
//     required this.path,
//     required this.perPage,
//     required this.to,
//     required this.total,
//   });
//
//   int currentPage;
//   int from;
//   int lastPage;
//   String path;
//   int perPage;
//   int to;
//   int total;
//
//   factory Meta.fromJson(Map<String, dynamic> json) => Meta(
//         currentPage: json["current_page"],
//         from: json["from"],
//         lastPage: json["last_page"],
//         path: json["path"],
//         perPage: json["per_page"],
//         to: json["to"],
//         total: json["total"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "current_page": currentPage,
//         "from": from,
//         "last_page": lastPage,
//         "path": path,
//         "per_page": perPage,
//         "to": to,
//         "total": total,
//       };
// }
