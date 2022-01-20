// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  Login({
    required this.accessToken,
    required this.expiredDate,
    required this.vendor,
  });

  String accessToken;
  int expiredDate;
  Vendor vendor;

  factory Login.fromJson(Map<String, dynamic> json) => Login(
    accessToken: json["access_token"],
    expiredDate: json["expired_date"],
    vendor: Vendor.fromJson(json["vendor"]),
  );

  Map<String, dynamic> toJson() => {
    "access_token": accessToken,
    "expired_date": expiredDate,
    "vendor": vendor.toJson(),
  };
}

class Vendor {
  Vendor({
    required this.id,
    required this.firstName,
    required this.vendorId,
    required this.isSuperAccount,
    required this.branchId,
    required this.lastName,
    required this.name,
    required this.phone,
    required this.email,
    required this.address,
    required this.media,
    required this.translations,
    required this.translation,
    required this.logo,
    required this.vendorPhone,
  });

  int id;
  String firstName;
  int vendorId;
  bool isSuperAccount;
  int branchId;
  String lastName;
  String name;
  String phone;
  String email;
  String address;
  Media media;
  List<Translation> translations;
  String? translation;
  String logo;
  String vendorPhone;

  factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
    id: json["id"],
    firstName: json["first_name"],
    vendorId: json["vendor_id"],
    isSuperAccount: json["is_super_account"],
    branchId: json["branch_id"],
    lastName: json["last_name"],
    name: json["name"],
    phone: json["phone"],
    email: json["email"],
    address: json["address"],
    media: Media.fromJson(json["media"]),
    translations: List<Translation>.from(json["translations"].map((x) => Translation.fromJson(x))),
    translation: json["translation"],
    logo: json["logo"],
    vendorPhone: json["vendor_phone"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "vendor_id": vendorId,
    "is_super_account": isSuperAccount,
    "branch_id": branchId,
    "last_name": lastName,
    "name": name,
    "phone": phone,
    "email": email,
    "address": address,
    "media": media.toJson(),
    "translations": List<dynamic>.from(translations.map((x) => x.toJson())),
    "translation": translation,
    "logo": logo,
    "vendor_phone": vendorPhone,
  };
}

class Media {
  Media({
    required this.id,
    required this.mediaId,
    required this.fileUrl,
    required this.fileName,
    required this.size,
  });

  int id;
  int mediaId;
  String fileUrl;
  String fileName;
  String size;

  factory Media.fromJson(Map<String, dynamic> json) => Media(
    id: json["id"],
    mediaId: json["media_id"],
    fileUrl: json["file_url"],
    fileName: json["file_name"],
    size: json["size"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "media_id": mediaId,
    "file_url": fileUrl,
    "file_name": fileName,
    "size": size,
  };
}

class Translation {
  Translation({
    required this.id,
    required this.vendorId,
    required this.name,
    required this.description,
    required this.langCode,
  });

  int id;
  int vendorId;
  String name;
  String description;
  String langCode;

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
    id: json["id"],
    vendorId: json["vendor_id"],
    name: json["name"],
    description: json["description"],
    langCode: json["lang_code"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "vendor_id": vendorId,
    "name": name,
    "description": description,
    "lang_code": langCode,
  };
}
