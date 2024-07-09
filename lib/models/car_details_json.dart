// To parse this JSON data, do
//
//     final carDetailsResponse = carDetailsResponseFromJson(jsonString);

import 'dart:convert';

CarDetailsResponse carDetailsResponseFromJson(String str) => CarDetailsResponse.fromJson(json.decode(str));

String carDetailsResponseToJson(CarDetailsResponse data) => json.encode(data.toJson());

class CarDetailsResponse {
  CarDetailsResponse({
    this.status,
    this.data,
  });

  String status;
  CarData data;

  factory CarDetailsResponse.fromJson(Map<String, dynamic> json) => CarDetailsResponse(
    status: json["status"] == null ? null : json["status"],
    data: json["data"] == null ? null : CarData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "data": data == null ? null : data.toJson(),
  };
}

class CarData {
  CarData({
    this.car,
  });

  CarDetails car;

  factory CarData.fromJson(Map<String, dynamic> json) => CarData(
    car: json["car"] == null ? null : CarDetails.fromJson(json["car"]),
  );

  Map<String, dynamic> toJson() => {
    "car": car == null ? null : car.toJson(),
  };
}

class CarDetails {
  CarDetails({
    this.id,
    this.dealerId,
    this.postTitle,
    this.photo,
    this.photos,
    this.maker,
    this.model,
    this.postType,
    this.postContent,
    this.postStatus,
    this.visibility,
    this.stock,
    this.pRange,
    this.iclPostLanguage,
    this.postExcerpt,
    this.postName,
    this.guid,
    this.carPrice,
    this.carOldPrice,
    this.carCondition,
    this.numberOfPassengers,
    this.carDoorsCount,
    this.carBody,
    this.carSubModel,
    this.carTrim,
    this.carCertified,
    this.carDrivetrain,
    this.carCylinders,
    this.carTransmission,
    this.carFuelType,
    this.carInterriorColor,
    this.carExteriorColor,
    this.carYear,
    this.carMileage,
    this.carMileageUnit,
    this.carVin,
    this.carEngineSize,
    this.carOptions,
    this.cardealerRooftopId,
    this.cardealerDealerName,
    this.cardealerDealerEmail,
    this.cardealerDealerPhone,
    this.cardealerDealerAddress,
    this.cardealerDealerCity,
    this.cardealerDealerRegionCode,
    this.cardealerPostalCode,
    this.cardealerDealerLatitude,
    this.cardealerDealerLongitude,
    this.type,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.zapierUrl,
    this.mapUrl,
    this.websiteUrl,
    this.chatUrl,
    this.adminNote,
    this.published,
    this.links,
  });

  int id;
  int dealerId;
  String postTitle;
  String photo;
  String photos;
  String maker;
  String model;
  String postType;
  String postContent;
  String postStatus;
  String visibility;
  String stock;
  String pRange;
  String iclPostLanguage;
  String postExcerpt;
  String postName;
  String guid;
  int carPrice;
  dynamic carOldPrice;
  String carCondition;
  int numberOfPassengers;
  int carDoorsCount;
  String carBody;
  String carSubModel;
  String carTrim;
  String carCertified;
  String carDrivetrain;
  String carCylinders;
  String carTransmission;
  String carFuelType;
  String carInterriorColor;
  String carExteriorColor;
  String carYear;
  String carMileage;
  dynamic carMileageUnit;
  String carVin;
  String carEngineSize;
  String carOptions;
  String cardealerRooftopId;
  String cardealerDealerName;
  String cardealerDealerEmail;
  String cardealerDealerPhone;
  String cardealerDealerAddress;
  String cardealerDealerCity;
  String cardealerDealerRegionCode;
  String cardealerPostalCode;
  String cardealerDealerLatitude;
  String cardealerDealerLongitude;
  String type;
  dynamic userId;
  DateTime createdAt;
  DateTime updatedAt;
  String zapierUrl;
  String mapUrl;
  String websiteUrl;
  dynamic chatUrl;
  dynamic adminNote;
  int published;
  Links links;

  factory CarDetails.fromJson(Map<String, dynamic> json) => CarDetails(
    id: json["ID"] == null ? null : json["ID"],
    dealerId: json["dealer_id"] == null ? null : json["dealer_id"],
    postTitle: json["post_title"] == null ? null : json["post_title"],
    photo: json["photo"] == null ? null : json["photo"],
    photos: json["photos"] == null ? null : json["photos"],
    maker: json["maker"] == null ? null : json["maker"],
    model: json["model"] == null ? null : json["model"],
    postType: json["post_type"] == null ? null : json["post_type"],
    postContent: json["post_content"] == null ? null : json["post_content"],
    postStatus: json["post_status"] == null ? null : json["post_status"],
    visibility: json["visibility"] == null ? null : json["visibility"],
    stock: json["stock"] == null ? null : json["stock"],
    pRange: json["p_range"] == null ? null : json["p_range"],
    iclPostLanguage: json["icl_post_language"] == null ? null : json["icl_post_language"],
    postExcerpt: json["post_excerpt"] == null ? null : json["post_excerpt"],
    postName: json["post_name"] == null ? null : json["post_name"],
    guid: json["guid"] == null ? null : json["guid"],
    carPrice: json["car_price"] == null ? null : json["car_price"],
    carOldPrice: json["car_old_price"],
    carCondition: json["car_condition"] == null ? null : json["car_condition"],
    numberOfPassengers: json["number_of_passengers"] == null ? null : json["number_of_passengers"],
    carDoorsCount: json["car_doors_count"] == null ? null : json["car_doors_count"],
    carBody: json["car_body"] == null ? null : json["car_body"],
    carSubModel: json["car_sub_model"] == null ? null : json["car_sub_model"],
    carTrim: json["car_trim"] == null ? null : json["car_trim"],
    carCertified: json["car_certified"] == null ? null : json["car_certified"],
    carDrivetrain: json["car_drivetrain"] == null ? null : json["car_drivetrain"],
    carCylinders: json["car_cylinders"] == null ? null : json["car_cylinders"],
    carTransmission: json["car_transmission"] == null ? null : json["car_transmission"],
    carFuelType: json["car_fuel_type"] == null ? null : json["car_fuel_type"],
    carInterriorColor: json["car_interrior_color"] == null ? null : json["car_interrior_color"],
    carExteriorColor: json["car_exterior_color"] == null ? null : json["car_exterior_color"],
    carYear: json["car_year"] == null ? null : json["car_year"],
    carMileage: json["car_mileage"] == null ? null : json["car_mileage"],
    carMileageUnit: json["car_mileage_unit"],
    carVin: json["car_vin"] == null ? null : json["car_vin"],
    carEngineSize: json["car_engine_size"] == null ? null : json["car_engine_size"],
    carOptions: json["car_options"] == null ? null : json["car_options"],
    cardealerRooftopId: json["cardealer_rooftop_id"] == null ? null : json["cardealer_rooftop_id"],
    cardealerDealerName: json["cardealer_dealer_name"] == null ? null : json["cardealer_dealer_name"],
    cardealerDealerEmail: json["cardealer_dealer_email"] == null ? null : json["cardealer_dealer_email"],
    cardealerDealerPhone: json["cardealer_dealer_phone"] == null ? null : json["cardealer_dealer_phone"],
    cardealerDealerAddress: json["cardealer_dealer_address"] == null ? null : json["cardealer_dealer_address"],
    cardealerDealerCity: json["cardealer_dealer_city"] == null ? null : json["cardealer_dealer_city"],
    cardealerDealerRegionCode: json["cardealer_dealer_region_code"] == null ? null : json["cardealer_dealer_region_code"],
    cardealerPostalCode: json["cardealer_postal_code"] == null ? null : json["cardealer_postal_code"],
    cardealerDealerLatitude: json["cardealer_dealer_latitude"] == null ? null : json["cardealer_dealer_latitude"],
    cardealerDealerLongitude: json["cardealer_dealer_longitude"] == null ? null : json["cardealer_dealer_longitude"],
    type: json["type"] == null ? null : json["type"],
    userId: json["user_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    zapierUrl: json["Zapier URL"] == null ? null : json["Zapier URL"],
    mapUrl: json["Map URL"] == null ? null : json["Map URL"],
    websiteUrl: json["website URL"] == null ? null : json["website URL"],
    chatUrl: json["Chat URL"],
    adminNote: json["admin_note"],
    published: json["published"] == null ? null : json["published"],
    links: json["links"] == null ? null : Links.fromJson(json["links"]),
  );

  Map<String, dynamic> toJson() => {
    "ID": id == null ? null : id,
    "dealer_id": dealerId == null ? null : dealerId,
    "post_title": postTitle == null ? null : postTitle,
    "photo": photo == null ? null : photo,
    "photos": photos == null ? null : photos,
    "maker": maker == null ? null : maker,
    "model": model == null ? null : model,
    "post_type": postType == null ? null : postType,
    "post_content": postContent == null ? null : postContent,
    "post_status": postStatus == null ? null : postStatus,
    "visibility": visibility == null ? null : visibility,
    "stock": stock == null ? null : stock,
    "p_range": pRange == null ? null : pRange,
    "icl_post_language": iclPostLanguage == null ? null : iclPostLanguage,
    "post_excerpt": postExcerpt == null ? null : postExcerpt,
    "post_name": postName == null ? null : postName,
    "guid": guid == null ? null : guid,
    "car_price": carPrice == null ? null : carPrice,
    "car_old_price": carOldPrice,
    "car_condition": carCondition == null ? null : carCondition,
    "number_of_passengers": numberOfPassengers == null ? null : numberOfPassengers,
    "car_doors_count": carDoorsCount == null ? null : carDoorsCount,
    "car_body": carBody == null ? null : carBody,
    "car_sub_model": carSubModel == null ? null : carSubModel,
    "car_trim": carTrim == null ? null : carTrim,
    "car_certified": carCertified == null ? null : carCertified,
    "car_drivetrain": carDrivetrain == null ? null : carDrivetrain,
    "car_cylinders": carCylinders == null ? null : carCylinders,
    "car_transmission": carTransmission == null ? null : carTransmission,
    "car_fuel_type": carFuelType == null ? null : carFuelType,
    "car_interrior_color": carInterriorColor == null ? null : carInterriorColor,
    "car_exterior_color": carExteriorColor == null ? null : carExteriorColor,
    "car_year": carYear == null ? null : carYear,
    "car_mileage": carMileage == null ? null : carMileage,
    "car_mileage_unit": carMileageUnit,
    "car_vin": carVin == null ? null : carVin,
    "car_engine_size": carEngineSize == null ? null : carEngineSize,
    "car_options": carOptions == null ? null : carOptions,
    "cardealer_rooftop_id": cardealerRooftopId == null ? null : cardealerRooftopId,
    "cardealer_dealer_name": cardealerDealerName == null ? null : cardealerDealerName,
    "cardealer_dealer_email": cardealerDealerEmail == null ? null : cardealerDealerEmail,
    "cardealer_dealer_phone": cardealerDealerPhone == null ? null : cardealerDealerPhone,
    "cardealer_dealer_address": cardealerDealerAddress == null ? null : cardealerDealerAddress,
    "cardealer_dealer_city": cardealerDealerCity == null ? null : cardealerDealerCity,
    "cardealer_dealer_region_code": cardealerDealerRegionCode == null ? null : cardealerDealerRegionCode,
    "cardealer_postal_code": cardealerPostalCode == null ? null : cardealerPostalCode,
    "cardealer_dealer_latitude": cardealerDealerLatitude == null ? null : cardealerDealerLatitude,
    "cardealer_dealer_longitude": cardealerDealerLongitude == null ? null : cardealerDealerLongitude,
    "type": type == null ? null : type,
    "user_id": userId,
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
    "Zapier URL": zapierUrl == null ? null : zapierUrl,
    "Map URL": mapUrl == null ? null : mapUrl,
    "website URL": websiteUrl == null ? null : websiteUrl,
    "Chat URL": chatUrl,
    "admin_note": adminNote,
    "published": published == null ? null : published,
    "links": links == null ? null : links.toJson(),
  };
}

class Links {
  Links({
    this.dealer,
  });

  String dealer;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    dealer: json["dealer"] == null ? null : json["dealer"],
  );

  Map<String, dynamic> toJson() => {
    "dealer": dealer == null ? null : dealer,
  };
}
