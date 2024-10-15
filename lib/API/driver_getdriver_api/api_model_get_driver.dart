class ApiModelGetDriver {
  bool? success;
  List<Data>? data;
  String? message;

  ApiModelGetDriver({this.success, this.data, this.message});

  ApiModelGetDriver.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class Data {
  int? id;
  String? avgRating;
  String? licenceNumber;
  String? driverType;
  String? latitude;
  String? longitude;
  String? name;
  String? email;
  int? extraBus;
  int? workingWithChildrenCertificate;
  int? snowLicence;
  String? deviceId;
  String? distance;
  String? profileImage;
  String? language;
  String? licence;
  String? experience;

  Data(
      {this.id,
        this.avgRating,
        this.licenceNumber,
        this.driverType,
        this.latitude,
        this.longitude,
        this.name,
        this.email,
        this.extraBus,
        this.workingWithChildrenCertificate,
        this.snowLicence,
        this.deviceId,
        this.distance,
        this.profileImage,
        this.language,
        this.licence,
        this.experience});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    avgRating = json['avg_rating']?.toString();  // Safely converting to String
    licenceNumber = json['licence_number'];
    driverType = json['driver_type'];
    latitude = json['latitude']?.toString();  // Converting to String
    longitude = json['longitude']?.toString();  // Converting to String
    name = json['name'];
    email = json['email'];
    extraBus = json['extra_bus'];
    workingWithChildrenCertificate = json['working_with_children_certificate'];
    snowLicence = json['snow_licence'];
    deviceId = json['device_id'];
    distance = json['distance']?.toString();  // Converting to String
    profileImage = json['profile_image'];
    language = json['language'];
    licence = json['licence'];
    experience = json['experience'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['avg_rating'] = avgRating;
    data['licence_number'] = licenceNumber;
    data['driver_type'] = driverType;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['name'] = name;
    data['email'] = email;
    data['extra_bus'] = extraBus;
    data['working_with_children_certificate'] = workingWithChildrenCertificate;
    data['snow_licence'] = snowLicence;
    data['device_id'] = deviceId;
    data['distance'] = distance;
    data['profile_image'] = profileImage;
    data['language'] = language;
    data['licence'] = licence;
    data['experience'] = experience;
    return data;
  }
}
