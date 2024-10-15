class ApiModel {
  ApiModel({
    required this.success,
    required this.data,
    required this.message,
  });

  final bool success;
  final List<Data> data;
  final String message;

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'data': data.map((e) => e.toJson()).toList(),
      'message': message,
    };
  }

  factory ApiModel.fromJson(Map<String, dynamic> json) {
    return ApiModel(
      success: json['success'] ?? false,
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => Data.fromJson(e))
              .toList() ??
          [],
      message: json['message'] ?? '',
    );
  }
}

class Data {
  Data({
    required this.id,
    required this.token,
    required this.email,
    required this.name,
    required this.deviceId,
    required this.role,
    required this.currentRole,
    required this.isAdminCustomer,
    required this.profileImage,
    required this.phoneNumber,
    required this.avgRating,
    required this.licenceNumber,
    required this.longitude,
    required this.latitude,
    required this.address,
    required this.extraBus,
    required this.workingWith,
    required this.snowLicence,
    required this.experience,
    required this.driverType,
    required this.language,
    required this.licence,
    required this.experienceList,
    required this.companyList,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final String token;
  final String email;
  final String name;
  final String deviceId;
  final String role;
  final String currentRole;
  final String isAdminCustomer;
  final String profileImage;
  final String phoneNumber;
  final String avgRating;
  final String licenceNumber;
  final String longitude;
  final String latitude;
  final String address;
  final int extraBus;
  final int workingWith;
  final int snowLicence;
  final String experience;
  final String driverType;
  final List<Language> language;
  final List<Licence> licence;
  final List<ExperienceList> experienceList;
  final List<CompanyList> companyList;
  final String createdAt;
  final String updatedAt;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'] as int? ?? 0,
      token: json['token'] as String? ?? '',
      email: json['email'] as String? ?? '',
      name: json['name'] as String? ?? '',
      deviceId: json['device_id'] as String? ?? '',
      role: json['role'] as String? ?? '',
      currentRole: json['current_role'] as String? ?? '',
      isAdminCustomer: json['is_admin_customer'] as String? ?? '',
      profileImage: json['profile_image'] as String? ?? '',
      phoneNumber: json['phone_number'] as String? ?? '',
      avgRating: json['avg_rating'] as String? ?? '',
      licenceNumber: json['licence_number'] as String? ?? '',
      longitude: json['longitude'] as String? ?? '',
      latitude: json['latitude'] as String? ?? '',
      address: json['address'] as String? ?? '',
      extraBus: json['extra_bus'] as int? ?? 0,
      workingWith: json['working_with'] as int? ?? 0,
      snowLicence: json['snow_licence'] as int? ?? 0,
      experience: json['experience'] as String? ?? '',
      driverType: json['driver_type'] as String? ?? '',
      language: (json['language'] as List<dynamic>?)
              ?.map((e) => Language.fromJson(e))
              .toList() ??
          [],
      licence: (json['licence'] as List<dynamic>?)
              ?.map((e) => Licence.fromJson(e))
              .toList() ??
          [],
      experienceList: (json['experience_list'] as List<dynamic>?)
              ?.map((e) => ExperienceList.fromJson(e))
              .toList() ??
          [],
      companyList: (json['company_list'] as List<dynamic>?)
              ?.map((e) => CompanyList.fromJson(e))
              .toList() ??
          [],
      createdAt: json['created_at'] as String? ?? '',
      updatedAt: json['updated_at'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['token'] = token;
    data['email'] = email;
    data['name'] = name;
    data['device_id'] = deviceId;
    data['role'] = role;
    data['current_role'] = currentRole;
    data['is_admin_customer'] = isAdminCustomer;
    data['profile_image'] = profileImage;
    data['phone_number'] = phoneNumber;
    data['avg_rating'] = avgRating;
    data['licence_number'] = licenceNumber;
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    data['address'] = address;
    data['extra_bus'] = extraBus;
    data['working_with'] = workingWith;
    data['snow_licence'] = snowLicence;
    data['experience'] = experience;
    data['driver_type'] = driverType;
    data['language'] = language.map((e) => e.toJson()).toList();
    data['licence'] = licence.map((e) => e.toJson()).toList();
    data['experience_list'] = experienceList.map((e) => e.toJson()).toList();
    data['company_list'] = companyList.map((e) => e.toJson()).toList();
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Language {
  Language({
    required this.id,
    required this.language,
  });

  late final int id;
  late final String language;

  Language.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    language = json['language'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['language'] = language;
    return data;
  }
}

class Licence {
  Licence({
    required this.id,
    required this.licence,
  });

  late final int id;
  late final String licence;

  Licence.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    licence = json['licence'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['licence'] = licence;
    return data;
  }
}

class ExperienceList {
  ExperienceList({
    required this.id,
    required this.experience,
  });

  late final int id;
  late final String experience;

  ExperienceList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    experience = json['experience'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['experience'] = experience;
    return data;
  }
}

class CompanyList {
  CompanyList({
    required this.id,
    required this.companyName,
    required this.companyRepresentative,
    required this.companyRepresentativeNumber,
    required this.companyAddress,
    required this.companyLatitude,
    required this.companyLongitude,
  });

  late final int id;
  late final String companyName;
  late final String companyRepresentative;
  late final String companyRepresentativeNumber;
  late final String companyAddress;
  late final String companyLatitude;
  late final String companyLongitude;

  CompanyList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyName = json['company_name'];
    companyRepresentative = json['company_representative'];
    companyRepresentativeNumber = json['company_representative_number'];
    companyAddress = json['company_address'];
    companyLatitude = json['company_latitude'];
    companyLongitude = json['company_longitude'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['company_name'] = companyName;
    data['company_representative'] = companyRepresentative;
    data['company_representative_number'] = companyRepresentativeNumber;
    data['company_address'] = companyAddress;
    data['company_latitude'] = companyLatitude;
    data['company_longitude'] = companyLongitude;
    return data;
  }
}
