import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    this.success,
    this.requestTime,
    this.responseTime,
    this.requestUrl,
    this.message,
    this.payload,
    this.payloadType,
  });

  bool? success;
  String? requestTime;
  String? responseTime;
  String? requestUrl;
  List<String>? message;
  List<Payload>? payload;
  String? payloadType;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    success: json["success"],
    requestTime: json["requestTime"],
    responseTime: json["responseTime"],
    requestUrl: json["requestURL"],
    message: List<String>.from(json["message"].map((x) => x)),
    payload: List<Payload>.from(json["payload"].map((x) => Payload.fromJson(x))),
    payloadType: json["payloadType"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "requestTime": requestTime,
    "responseTime": responseTime,
    "requestURL": requestUrl,
    "message": List<dynamic>.from(message!.map((x) => x)),
    "payload": List<dynamic>.from(payload!.map((x) => x.toJson())),
    "payloadType": payloadType,
  };
}

class Payload {
  Payload({
    this.id,
    this.active,
    this.deleted,
    this.dateUpdated,
    this.sku,
    this.name,
    this.upc,
    this.useLotNumber,
    this.useSerialNumber,
    this.useManufacturingSerialNumber,
    this.useSerialForReceive,
    this.description,
    this.type,
    this.hasVariants,
    this.assemblyId,
    this.kitId,
    this.sellingPrice,
    this.suggestedRetailPrice,
    this.cost,
    this.totalQuantity,
    this.availableQuantity,
    this.unitId,
    this.unitName,
    this.weight,
    this.taxable,
    this.dropShip,
    this.customField1,
    this.customField2,
    this.customField3,
    this.customField4,
    this.customField5,
    this.customField6,
    this.imageUrl,
    this.enableSerializedImageUpload,
    this.lotSerialEnabled,
  });

  int? id;
  bool? active;
  bool? deleted;
  DateTime? dateUpdated;
  String? sku;
  String? name;
  String? upc;
  bool? useLotNumber;
  bool? useSerialNumber;
  bool? useManufacturingSerialNumber;
  bool? useSerialForReceive;
  String? description;
  String? type;
  bool? hasVariants;
  int? assemblyId;
  int? kitId;
  double? sellingPrice;
  double? suggestedRetailPrice;
  double? cost;
  double? totalQuantity;
  double? availableQuantity;
  int? unitId;
  String? unitName;
  double? weight;
  bool? taxable;
  bool? dropShip;
  String? customField1;
  String? customField2;
  String? customField3;
  String? customField4;
  String? customField5;
  String? customField6;
  String? imageUrl;
  bool? enableSerializedImageUpload;
  bool? lotSerialEnabled;

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
    id: json["id"],
    active: json["active"],
    deleted: json["deleted"],
    dateUpdated: DateTime.parse(json["date_updated"]),
    sku: json["sku"],
    name: json["name"],
    upc: json["upc"],
    useLotNumber: json["use_lot_number"],
    useSerialNumber: json["use_serial_number"],
    useManufacturingSerialNumber: json["use_manufacturing_serial_number"],
    useSerialForReceive: json["use_serial_for_receive"],
    description: json["description"],
    type: json["type"],
    hasVariants: json["has_variants"],
    assemblyId: json["assembly_id"],
    kitId: json["kit_id"],
    sellingPrice: json["selling_price"],
    suggestedRetailPrice: json["suggested_retail_price"],
    cost: json["cost"].toDouble(),
    totalQuantity: json["total_quantity"],
    availableQuantity: json["available_quantity"],
    unitId: json["unit_id"],
    unitName: json["unit_name"],
    weight: json["weight"],
    taxable: json["taxable"],
    dropShip: json["drop_ship"],
    customField1: json["custom_field1"],
    customField2: json["custom_field2"],
    customField3: json["custom_field3"],
    customField4: json["custom_field4"],
    customField5: json["custom_field5"],
    customField6: json["custom_field6"],
    imageUrl: json["image_url"],
    enableSerializedImageUpload: json["enable_serialized_image_upload"],
    lotSerialEnabled: json["lot_serial_enabled"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "active": active,
    "deleted": deleted,
    "date_updated": dateUpdated?.toIso8601String(),
    "sku": sku,
    "name": name,
    "upc": upc,
    "use_lot_number": useLotNumber,
    "use_serial_number": useSerialNumber,
    "use_manufacturing_serial_number": useManufacturingSerialNumber,
    "use_serial_for_receive": useSerialForReceive,
    "description": description,
    "type": type,
    "has_variants": hasVariants,
    "assembly_id": assemblyId,
    "kit_id": kitId,
    "selling_price": sellingPrice,
    "suggested_retail_price": suggestedRetailPrice,
    "cost": cost,
    "total_quantity": totalQuantity,
    "available_quantity": availableQuantity,
    "unit_id": unitId,
    "unit_name": unitName == null ? null : unitName,
    "weight": weight,
    "taxable": taxable,
    "drop_ship": dropShip,
    "custom_field1": customField1,
    "custom_field2": customField2,
    "custom_field3": customField3,
    "custom_field4": customField4,
    "custom_field5": customField5,
    "custom_field6": customField6,
    "image_url": imageUrl,
    "enable_serialized_image_upload": enableSerializedImageUpload,
    "lot_serial_enabled": lotSerialEnabled,
  };
}
